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
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.Role;
import com.demo.services.AccountService;
import com.demo.services.RoleService;

@Controller
@RequestMapping("admin/customer")
public class CustomerController {

	@Autowired
	private AccountService accountService;
	
	@GetMapping("")
	public String Index(ModelMap map) {
		List<Account> customers = new ArrayList<Account>();
		for (Account account : accountService.findAll()) {
			for (Role role : account.getRoles()) {
				if (role.getName().equalsIgnoreCase("ROLE_CUSTOMER")) {
					customers.add(account);
				}
			}
		}
		map.put("customers", customers);
		return "../admin/customer/index";
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Account account = accountService.findById(id);
		if(account==null) {
			return "../admin/customer/customer-notfound";
		} else {
			modelMap.put("customer", account);
		}
		return "../admin/customer/edit";
	}
	
	@PostMapping("edit")
	public String edit(@ModelAttribute("customer") Account customer) {
		System.out.println(customer.getId());
		return "redirect:/admin/customer";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id){
		accountService.delete(id);
		return "redirect:/admin/customer";
	}
	
}
