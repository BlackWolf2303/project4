package com.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.entities.OrderDetailID;
import com.demo.model.Item;
import com.demo.services.AccountService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.ProductService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private ProductService productService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {
		modelMap.put("items", new ArrayList<Item>());
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			session.setAttribute("cart", cart);
		}
		return "cart/index";
	}
	
	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id, HttpSession session) {
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.find(id), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>)session.getAttribute("cart");
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
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		int index = this.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart";
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
	private String order(HttpSession session, ModelMap modelMap) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		
		if(authentication.isAuthenticated() && cart.size()!=0) {
			Account account = accountService.findByUsername(authentication.getName());
			Order order = new Order();
			order.setAccount(account);
			Order order2 = orderService.save(order);
			List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
			for (Item item : (List<Item>)session.getAttribute("cart")) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(new OrderDetailID(order2, item.getProduct()));
				orderDetail.setPrice(item.getProduct().getPrice());
				orderDetail.setQuantity(item.getQuantity());
				orderDetails.add(orderDetailService.save(orderDetail));
			}
			modelMap.put("orderdetails", orderDetails);
			session.setAttribute("cart", new ArrayList<Item>());
			return "cart/success";
		} else {
			return "redirect:/cart";
		}
	}
	
}
