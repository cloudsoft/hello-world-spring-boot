package org.apache.brooklyn.example;

import io.micrometer.core.annotation.Timed;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Controller
@RequestMapping("/db")
public class MessageController {

    private final MessageRepo messageRepo;

    public MessageController(MessageRepo messageRepo) {
        this.messageRepo = messageRepo;
    }

    @Timed(value = "db.time", description = "Time taken to return db page")
    @GetMapping
    public String db(){
        return "db"; // view;
    }

    @ModelAttribute("messages")
    public List<Message> messages(){

        if(messageRepo.count() == 0) {
            return null;
        } else {
            return StreamSupport.stream(messageRepo.findAll().spliterator(), false).collect(Collectors.toList());
        }
    }
    @ModelAttribute("message")
    public Message message(){
        return new Message();
    }

    @Timed(value = "db.post.time", description = "Time taken to post a message")
    @PostMapping("/addmessage")
    public String addMessage(@Valid @ModelAttribute  Message message, BindingResult result){
        if (result.hasErrors()) {
            System.err.println("invalid message");
            return "db"; //view
        }
        messageRepo.save(message);
        return "redirect:/db";
    }
}

