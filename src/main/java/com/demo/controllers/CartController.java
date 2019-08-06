package com.demo.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.entities.OrderDetailID;
import com.demo.entities.TypeValue;
import com.demo.model.DetailModel;
import com.demo.model.Item;
import com.demo.paypal.PayPalResult;
import com.demo.paypal.PayPalSucess;
import com.demo.services.AccountService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.PayPalService;
import com.demo.services.ProductService;
import com.demo.services.TypeTemplateService;
import com.demo.services.TypeValueService;

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
	@Autowired
	private PayPalService payPalService;
	@Autowired
	private TypeValueService typeValueService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {
		modelMap.put("items", new ArrayList<Item>());
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			session.setAttribute("cart", cart);
		}
		modelMap.put("payPalConfig", payPalService.getPayPalConfig());
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

	@RequestMapping(value = "buy/{id}", method = RequestMethod.POST)
	public String buy(@PathVariable("id") int id, @ModelAttribute DetailModel detailModel, HttpSession session) {
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			Item item = new Item(productService.find(id), detailModel.getQuantity());
			item.setTypeValue1(typeValueService.find(detailModel.getTypeValueId1()));
			item.setTypeValue2(typeValueService.find(detailModel.getTypeValueId2()));
			cart.add(item);
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = this.exists(id, cart, typeValueService.find(detailModel.getTypeValueId1()),
					typeValueService.find(detailModel.getTypeValueId2()));
			if (index == -1) {
				Item item = new Item(productService.find(id), detailModel.getQuantity());
				item.setTypeValue1(typeValueService.find(detailModel.getTypeValueId1()));
				item.setTypeValue2(typeValueService.find(detailModel.getTypeValueId2()));
				cart.add(item);
			} else {
				int quantity = cart.get(index).getQuantity() + detailModel.getQuantity();
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart";
	}

	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") int id, HttpSession session) {
//		List<Item> cart = (List<Item>)session.getAttribute("cart");
//		int index = this.exists(id, cart);
//		cart.remove(index);
//		session.setAttribute("cart", cart);
		return "redirect:/cart";
	}

	private int exists(int id, List<Item> cart, TypeValue typeValue, TypeValue typeValue2) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id && cart.get(i).getTypeValue1().getId() == typeValue.getId()
					&& cart.get(i).getTypeValue2().getId() == typeValue2.getId()) {
				return i;
			}
		}
		return -1;
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
	private String order(HttpSession session, ModelMap modelMap, @RequestParam("shipto") String shipto) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<Item> cart = (List<Item>) session.getAttribute("cart");

		if (authentication.isAuthenticated() && cart.size() != 0) {
			Account account = accountService.findByUsername(authentication.getName());
			Order order = new Order();
			order.setShipto(shipto);
			order.setAccount(account);
			order.setStatus("Pending");
			order.setType("Pay At Home");
			order.setCreateat(Date.valueOf(LocalDate.now()));
			Order order2 = orderService.save(order);
			List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
			for (Item item : (List<Item>) session.getAttribute("cart")) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(new OrderDetailID(order2, item.getProduct()));
				orderDetail.setPrice(item.getProduct().getPrice());
				orderDetail.setQuantity(item.getQuantity());

				orderDetail.setOption1(item.getTypeValue1().getTypeTemplates().get(0).getName() + "-"
						+ item.getTypeValue1().getName());
				orderDetail.setOption2(item.getTypeValue2().getTypeTemplates().get(0).getName() + "-"
						+ item.getTypeValue2().getName());

				orderDetails.add(orderDetailService.save(orderDetail));
			}
			modelMap.put("orderdetails", orderDetails);
			session.setAttribute("cart", new ArrayList<Item>());
			return "cart/success";
		} else {
			return "redirect:/cart";
		}
	}

	@GetMapping("checkout")
	public String checkout(HttpSession session, ModelMap modelMap) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		if (cart.size() == 0 || cart == null) {
			modelMap.put("error", true);
		}
		return "cart/checkout";
	}

	@GetMapping("success")
	public String success(HttpSession session, ModelMap modelMap, HttpServletRequest request) {
		PayPalSucess payPalSucess = new PayPalSucess();
		PayPalResult payPalResult = payPalSucess.getPayPal(request, payPalService.getPayPalConfig());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		if (authentication.isAuthenticated() && cart.size() != 0) {
			Account account = accountService.findByUsername(authentication.getName());
			Order order = new Order();
			order.setShipto(payPalResult.getAddress_street() + ", " + payPalResult.getAddress_city() + ", "
					+ payPalResult.getAddress_state() + ", " + payPalResult.getAddress_country());
			order.setAccount(account);
			order.setStatus("Pending");
			order.setType("PayPal");
			order.setCreateat(Date.valueOf(LocalDate.now()));
			Order order2 = orderService.save(order);
			List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
			for (Item item : (List<Item>) session.getAttribute("cart")) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setId(new OrderDetailID(order2, item.getProduct()));
				orderDetail.setPrice(item.getProduct().getPrice());
				orderDetail.setQuantity(item.getQuantity());

				orderDetail.setOption1(item.getTypeValue1().getTypeTemplates().get(0).getName() + "-"
						+ item.getTypeValue1().getName());
				orderDetail.setOption2(item.getTypeValue2().getTypeTemplates().get(0).getName() + "-"
						+ item.getTypeValue2().getName());

				orderDetails.add(orderDetailService.save(orderDetail));
			}
			session.setAttribute("cart", new ArrayList<Item>());
			return "cart/success";
		} else {
			return "redirect:/cart";
		}
	}

}
