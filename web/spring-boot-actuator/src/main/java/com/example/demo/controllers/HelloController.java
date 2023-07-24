package com.example.demo.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {
    
    private static final Logger logger = LoggerFactory.getLogger(HelloController.class);

    @GetMapping
    public String ping() {
        logger.debug("Hello action called");
        return "Hello World!";
    }
}
