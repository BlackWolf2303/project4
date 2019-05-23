package com.demo.controllers;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("login")
public class LoginController {
    @RequestMapping(method = RequestMethod.GET)
    public String login() {
        return "login/index";
    }

//    @RequestMapping(method = RequestMethod.POST)
//    public String login(String username, String password) {
//        return "login/index";
//    }
}
