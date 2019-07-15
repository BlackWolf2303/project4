package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutController {
	@RequestMapping("/blog")
	public String AboutView() {
		return "blog/index";
	}
}

