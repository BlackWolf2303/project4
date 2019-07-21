package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.RoleService;

@Controller
@RequestMapping("admin/customer")
public class CustomerController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private RoleService roleService;
	
	@GetMapping("")
	public String Index(ModelMap map) {
		List<Account> accounts = accountService.findAll();
		List<Account> customers = new ArrayList<Account>();
		for (Account account : accounts) {
			customers.add((Account)account.getRoles()..contains(roleService.find(3))));
		}
		map.put("customers", customers);
		return "../admin/customer/index";
	}
	
}
