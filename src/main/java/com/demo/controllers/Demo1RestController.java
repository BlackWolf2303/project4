package com.demo.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/demo1")
public class Demo1RestController {

    @RequestMapping(value = "hello", method = RequestMethod.GET)
    public ResponseEntity<String> hello(){
        try {
            return new ResponseEntity<String>("Hello Demo 1", HttpStatus.OK);
        } catch (Exception e){
            return new ResponseEntity<String>(HttpStatus.BAD_GATEWAY);
        }
    }

}