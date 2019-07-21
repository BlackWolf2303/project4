package com.demo.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.entities.Account;
import com.demo.services.AccountService;

@Controller
@RequestMapping("admin/customer")
public class CustomerController {
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("")
	public String Index() {
		List<Account> customers = accountService.findAllCustomer();
		return "../admin/customer/index";
	}
	
}
