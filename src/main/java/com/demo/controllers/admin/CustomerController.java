package com.demo.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.AccountConfirm;
import com.demo.entities.Role;
import com.demo.services.AccountService;
import com.demo.services.RoleService;
import com.demo.validators.AccountValidator;

@Controller
@RequestMapping("admin/customer")
public class CustomerController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountValidator accountValidator;
	
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
		Account insertCustomer = accountService.findById(customer.getId());
		if (insertCustomer!=null) {
			insertCustomer.setUsername(customer.getUsername());
			accountService.save(insertCustomer);
		}
		return "redirect:/admin/customer";
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id){
		accountService.delete(id);
		return "redirect:/admin/customer";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("account", new AccountConfirm());
		return "../admin/customer/add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid AccountConfirm account, BindingResult bindingResult) {
		accountValidator.validate(account, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account acc = new Account();
			acc.setUsername(account.getUsername());
			acc.setPassword(account.getPassword());
			//acc.getRoles().add(roleService.find(3));
			accountService.save(acc);
			//securityService.autoLogin(acc.getUsername(), acc.getPassword());
			return "redirect:/admin/customer";
		} else {
			return "../admin/customer/add";
		}
	}
}
