package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;

@Controller
@RequestMapping("admin/invoice")
public class InvoiceController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;

	@GetMapping()
	public String index(ModelMap map) {
		// List<Order> orders = (List<Order>)orderService.findAll();
		map.put("orders", orderService.findAll());
		return "../admin/invoice/index";
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Order order = orderService.find(id);
		if (order == null) {
			return "../admin/invoice/order-notfound";
		} else {
			modelMap.put("order", order);
		}
		return "../admin/invoice/edit";
	}

	@GetMapping("editshipto/{id}")
	public String editShipto(@PathVariable("id") int id, ModelMap modelMap) {
		Order order = orderService.find(id);
		if (order == null) {
			return "../admin/invoice/order-notfound";
		} else {
			modelMap.put("order", order);
		}
		return "../admin/invoice/editshipto";
	}

	@GetMapping("editstatus/{id}")
	public String editstatus(@PathVariable("id") int id, ModelMap modelMap) {
		Order insertOrder = orderService.find(id);
		if (insertOrder != null) {
			if (insertOrder.getStatus().equalsIgnoreCase("pending")) {
				insertOrder.setStatus("Done");
			} else if (insertOrder.getStatus().equalsIgnoreCase("done")) {
				insertOrder.setStatus("Pending");
			}
			orderService.save(insertOrder);
		}
		return "redirect:/admin/invoice";
	}

	@PostMapping("edit")
	public String edit(@ModelAttribute("order") Order order) {
		Order insertOrder = orderService.find(order.getId());
		if (insertOrder != null) {
			insertOrder.setShipto(order.getShipto());
			orderService.save(insertOrder);
		}
		return "redirect:/admin/invoice";
	}

	@PostMapping("editshipto")
	public String editShipTo(@ModelAttribute("order") Order order) {
		Order insertOrder = orderService.find(order.getId());
		if (insertOrder != null) {
			insertOrder.setShipto(order.getShipto());
			orderService.save(insertOrder);
		}
		return "redirect:/admin/invoice";
	}

	@GetMapping("detail/{id}")
	public String detail(@PathVariable("id") int id, ModelMap modelMap) {
		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		for (OrderDetail orderDetail : orderDetailService.findAll()) {
			if (orderDetail.getId().getOrder().getId() == id) {
				orderDetails.add(orderDetail);
			}
		}
		modelMap.put("orderDetails", orderDetails);
		return "../admin/invoice/detail";
	}

}
