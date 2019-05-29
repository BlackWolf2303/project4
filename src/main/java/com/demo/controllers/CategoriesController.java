package com.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoriesController {
	@RequestMapping("/categories")
	public String AboutView() {
		return "categories/index";
	}
}

