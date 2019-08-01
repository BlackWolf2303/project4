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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.demo.entities.Account;
import com.demo.entities.Role;
import com.demo.model.Item;
import com.demo.model.RegisterModel;
import com.demo.services.AccountService;
import com.demo.services.RoleService;
import com.demo.services.SecurityService;
import com.demo.services.StorageService;
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

	@Autowired
	private StorageService storageService;

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
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("account", new RegisterModel());
		return "login/register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid RegisterModel account, BindingResult bindingResult, ModelMap modelMap) {
		accountValidator.validate(account, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account acc = new Account();
			acc.setUsername(account.getUsername());
			acc.setPassword(account.getPassword());
			acc.setEmail(account.getEmail());
			acc.getRoles().add(roleService.find(3));
			acc = accountService.save(acc);
			securityService.autoLogin(account.getUsername(), account.getPassword());
			return "redirect:/home";
		} else {
			return "/login/register";
		}
	}
	
	public void editPrcess(@PathVariable int id, @ModelAttribute("file") MultipartFile file) {
		String filename = id + "ava" + ".jpg";
		storageService.store(file, filename);
		Account account = accountService.findById(id);
		account.setAvatar(filename);
		accountService.save(account);
	}
}
