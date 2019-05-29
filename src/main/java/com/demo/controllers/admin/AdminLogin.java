package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "admin")
public class AdminLogin {
	
	@RequestMapping(method = RequestMethod.GET)
	public String home() {
		return "../admin/home/index";
	}
	
//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public String login() {
//		return "../admin/login/login";
//	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginFailed(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessge = null;
        if(error != null) {
            errorMessge = "Username or Password is incorrect !!";
        }
//        if(logout != null) {
//            errorMessge = "You have been successfully logged out !!";
//        }
        model.addAttribute("errorMessge", errorMessge);
		return "../admin/login/login";
	}
	
}
