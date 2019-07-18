package com.demo.controllers;

import org.hibernate.validator.constraints.SafeHtml.Attribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Product;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value = "categories")
public class CategoriesController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.findAll());
		return "categories/index";
	}
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String indexProduct(@PathVariable("id") int id, ModelMap modelMap) {
		Product product = productService.find(id);
		modelMap.put("product", product);	
//		for (Category image : product.getCategories()) {
//			System.out.println(image.getCategory().getName());
//		}
		return "product/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String Search(@ModelAttribute("keyword") String name, ModelMap modelMap) {
		System.out.println(name);
		System.out.println(productService.findByName("sp 1"));
		modelMap.put("products", productService.findByName(name));
		return "categories/index";
	}
}

