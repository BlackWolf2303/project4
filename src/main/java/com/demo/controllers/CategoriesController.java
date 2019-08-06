package com.demo.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Image;
import com.demo.entities.Product;
import com.demo.model.DetailModel;
import com.demo.services.ProductService;

@Controller
@RequestMapping(value = "categories")
public class CategoriesController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		List<Product> products = new ArrayList<Product>();
		
		String[] properties = {"name","quantity","price"};
		String[] directions = {"asc","desc"};
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		String direction = ServletRequestUtils.getStringParameter(request, "dir", "asc");
		String property = ServletRequestUtils.getStringParameter(request, "prop", "name");

		if(direction.equalsIgnoreCase("asc")) {
			products = (List<Product>)productService.findAllWithActive(Sort.by(Direction.ASC, property));
		} else if (direction.equalsIgnoreCase("desc")) {
			products = (List<Product>)productService.findAllWithActive(Sort.by(Direction.DESC, property));
		}
		
		PagedListHolder<Product> pagedListHolder = new PagedListHolder<Product>(products);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		pagedListHolder.setMaxLinkedPages(3); 
		modelMap.put("pagedListHolder", pagedListHolder);
		modelMap.put("properties", properties);
		modelMap.put("directions", directions);
		return "categories/index";
	}
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String indexProduct(@PathVariable("id") int id, ModelMap modelMap) {
		Product product = productService.find(id);
		modelMap.put("product", product);
		List<String> images = new ArrayList<String>();
		for (int i = 0; i < 8; i++) {
			File file = new File("src/main/resources/static/upload/customer/picture" + i + id + ".jpg");
			if(file.exists()){
				images.add("http://localhost:9596/file/image/picture" + i + id + ".jpg");
			}
		}
		modelMap.put("images1", images);
		modelMap.put("detailModel", new DetailModel());
		return "product/index";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String Search(@ModelAttribute("keyword") String name, ModelMap modelMap) {
		modelMap.put("products", productService.findByName(name));
		return "categories/index";
	}
}

