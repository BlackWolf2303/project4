package com.demo.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/category")
public class AdminCategoryController {
	@GetMapping
	public String index() {
		
		return "../admin/catetory/index";
	}
}
