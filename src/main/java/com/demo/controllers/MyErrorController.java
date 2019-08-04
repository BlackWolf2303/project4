package com.demo.controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("error")
public class MyErrorController implements ErrorController  {
 
    @RequestMapping()
    public String handleError(HttpServletRequest request) {
    	String requestURL = (String)request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);
    	if(requestURL.substring(0, 6).equalsIgnoreCase("/admin")) {
    		return "error/admin";
    	}
        return "error/user";
    }
 
    @Override
    public String getErrorPath() {
        return "/error";
    }
}