package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ContactController {
	@RequestMapping("/contact")
	public String AboutView() {
		return "contact/index";
	}
}

