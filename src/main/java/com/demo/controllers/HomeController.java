package com.demo.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.SecurityService;

@Controller
@RequestMapping()
public class HomeController {
	@Autowired
	private AccountService accountService;

	@Autowired
	private SecurityService securityService;

	@RequestMapping()
	public String HomeView(ModelMap model) {
		try {
			boolean isLogin = SecurityContextHolder.getContext().getAuthentication() != null &&
					 SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
					 //when Anonymous Authentication is enabled
					 !(SecurityContextHolder.getContext().getAuthentication() 
					          instanceof AnonymousAuthenticationToken);
			model.put("isLogin", isLogin);
			return "home/index";
		} catch (Exception e) {
			System.out.println("null authen");
			return "home/index";
		}
	}

	@GetMapping("login")
	public String LoginFailed(@RequestParam(value = "error", required = false) String error, ModelMap model) {
		try {
			String errorMessge = null;
			if (error != null) {
				errorMessge = "Username or Password is incorrect !!";
			}
			model.addAttribute("errorMessge", errorMessge);
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String isLogin = authentication.getName();
//			boolean isLogin = SecurityContextHolder.getContext().getAuthentication() != null
//					&& SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
//					// when Anonymous Authentication is enabled
//					!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken);
//			model.put("isLogin", isLogin);
			return "login/index";
		} catch (Exception e) {
			return "redirect:/";
		}
	}

	@GetMapping("register")
	public String Register() {
		return "login/register";
	}

	@PostMapping("register")
	public String Register(@ModelAttribute("account") Account account,
			@RequestParam("passwordConfirm") String passwordConfirm) {
		// System.out.println(account.getUsername() + "|" + account.getPassword() + "|"
		// + passwordConfirm);
		accountService.save(account);
		securityService.autoLogin(account.getUsername(), passwordConfirm);
		return "redirect:/";
	}
}
