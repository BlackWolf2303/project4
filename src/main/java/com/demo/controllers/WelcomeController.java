package com.demo.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("welcome")
public class WelcomeController {

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<String> welcome(){
        try {
            return new ResponseEntity<String>("❤❤❤ Hello Giang❤❤❤", HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_GATEWAY);
        }
    }

}
