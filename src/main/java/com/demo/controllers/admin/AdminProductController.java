package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Product;
import com.demo.services.ColorService;
import com.demo.services.ProductService;
import com.demo.services.SizeService;

@Controller
@RequestMapping("admin/products")
public class AdminProductController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private ColorService colorService;
	@Autowired
	private SizeService sizeService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("products", productService.findAll());
		return "../admin/products/index";
	}
	
	@RequestMapping(value = "{id}" , method = RequestMethod.GET)
	public String detail(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.find(id));
		return "../admin/products/details";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("product") Product product) {
		productService.save(product);
		return "redirect:/admin/products";
	}

	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "../admin/products/add";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		productService.delete(id);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("product", productService.find(id));
		modelMap.put("sizes", sizeService.findAll());
		modelMap.put("colors", colorService.findAll());
		return "../admin/products/edit";
	}
	
	@RequestMapping(value = "edit/{id}", method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") Product product) {
		productService.save(product);
		return "redirect:/admin/products";
	}
}
