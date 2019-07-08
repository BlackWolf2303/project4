package com.demo.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Product;
import com.demo.services.ProductService;

@Controller
@RequestMapping("admin/products")
public class AdminProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.findAll());
		return "../admin/products/index";
	}
	
	
	
}
