package com.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Item;
import com.demo.entities.Order;
import com.demo.services.ProductService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "cart/index";
	}
	
	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id, HttpSession session) {
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.find(id), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = this.exists(id, cart);
			if (index == -1) {
				cart.add(new Item(productService.find(id), 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart";
	}

	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") int id, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}

	
	private int exists(int id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}
	
	@RequestMapping(value = "order", method = RequestMethod.POST)
	private String order() {
		Order order = new Order();
		order.setId(id);
		return "cart/success";
	}
	

}
