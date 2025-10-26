package com.example.portfolio.controller;

import org.springframework.web.bind.annotation.*;
import com.example.portfolio.model.Contact;
import com.example.portfolio.repository.ContactRepository;
import java.util.List;


@RestController
@RequestMapping("/api/contacts")
@CrossOrigin(origins = "http://localhost:3000") // frontend URL
public class ContactController {

    private final ContactRepository repo;

    public ContactController(ContactRepository repo) {
        this.repo = repo;
    }

    @PostMapping
    public Contact save(@RequestBody Contact c) {
        return repo.save(c);
    }

    @GetMapping
    public List<Contact> all() {
        return repo.findAll();
    }
}
