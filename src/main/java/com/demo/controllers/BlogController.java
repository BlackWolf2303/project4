package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BlogController {
	@RequestMapping("/about")
	public String AboutView() {
		return "about/index";
	}
}

