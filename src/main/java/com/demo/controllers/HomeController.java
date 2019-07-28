package com.demo.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Item;
import com.demo.entities.Role;
import com.demo.model.RegisterModel;
import com.demo.services.AccountService;
import com.demo.services.RoleService;
import com.demo.services.SecurityService;
import com.demo.validators.RegisterValidator;

@Controller
public class HomeController {

	@Autowired
	private RoleService roleService;

	@Autowired
	private RegisterValidator accountValidator;
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private SecurityService securityService;

	@RequestMapping("/")
	public String IndexView() {
		return "redirect:home";
	}

	@RequestMapping("home")
	public String HomeView(HttpSession session) { 
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			session.setAttribute("cart", cart);
		}
		return "home/index";
	}

	@RequestMapping("403")
	public String ErrorPage() {
		return "home/error";
	}

	@GetMapping("login")
	public String LoginFailed(@RequestParam(value = "error", required = false) String error, ModelMap model) {
		String errorMessge = null;
		if (error != null) {
			errorMessge = "Username or Password is incorrect !!";
		}
		model.addAttribute("errorMessge", errorMessge);
		return "login/index";
	}

	@GetMapping("register")
	public String Register(ModelMap map) {
		map.put("accountConfirm", new RegisterModel());
		return "login/register";
	}

	@PostMapping("register")
	public String Register(@ModelAttribute("accountConfirm") @Valid RegisterModel registerModel, BindingResult bindingResult) {		
		accountValidator.validate(registerModel, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account account = new Account();
			account.setUsername(registerModel.getUsername());
			account.setPassword(registerModel.getPassword());
			account.getRoles().add(roleService.find(3));
			accountService.save(account);
			securityService.autoLogin(account.getUsername(), account.getPassword());
			return "redirect:/home";
		} else {
			return "/login/register";
		}
	}
	
	@RequestMapping(value = "/successLogin", method = RequestMethod.POST)
	private String loginSuccess() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        for (Role role : accountService.findByUsername(authentication.getName()).getRoles()) {
        	System.out.println(role.getName());
        	if (role.getName().equalsIgnoreCase("ROLE_CUSTOMER")) {
                return "redirect:/home";
            }
		}   
    	securityService.autoLogout();
    	return "redirect:/login?error";
	}
}
