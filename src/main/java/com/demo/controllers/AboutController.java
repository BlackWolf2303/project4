package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AboutController {
	@RequestMapping("/blog")
	public String AboutView() {
		return "blog/index";
	}
}

