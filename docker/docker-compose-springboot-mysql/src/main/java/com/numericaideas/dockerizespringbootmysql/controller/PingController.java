package com.numericaideas.dockerizespringbootmysql.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/ping")
public class PingController {

    private static final Logger logger = LoggerFactory.getLogger(PingController.class);
    
    @GetMapping
    public String ping() {
        logger.debug("Ping action called");
        return "Pong >>> It works!";
    }

}
