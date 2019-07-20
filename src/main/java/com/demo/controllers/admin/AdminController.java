package com.demo.controllers.admin;

import java.security.Principal;
import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.AccountConfirm;
import com.demo.entities.Role;
import com.demo.services.AccountService;
import com.demo.services.RoleService;
import com.demo.services.SecurityService;
import com.demo.validators.AccountValidator;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AccountValidator accountValidator;

	@Autowired
	private AccountService accountService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private SecurityService securityService;

	@RequestMapping(method = RequestMethod.GET)
	public String home() {
		return "../admin/home/index";
	}

	@RequestMapping(value = "403",method = RequestMethod.GET)
	public String ErrorPage() {
		return "../admin/home/error";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessge = null;
		if (error != null) {
			errorMessge = "Username or Password is incorrect !!";
		}
//        if(logout != null) {
//            errorMessge = "You have been successfully logged out !!";
//        }
		if (SecurityContextHolder.getContext().getAuthentication() != null
				&& SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			return "redirect:/admin";
		}
		model.addAttribute("errorMessge", errorMessge);
		return "../admin/home/login";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("account", new AccountConfirm());
		return "../admin/home/register";
	}

	@GetMapping("editaccount/{username}")
	public String editAccount(@PathVariable("username") String username, ModelMap modelMap) {
		modelMap.put("account", accountService.findByUsername(username));
		modelMap.put("rolesss", roleService.findAll());
		return "../admin/home/editAccount";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") @Valid AccountConfirm account, BindingResult bindingResult) {
		accountValidator.validate(account, bindingResult);
		if (!bindingResult.hasErrors()) {
			Account acc = new Account();
			acc.setUsername(account.getUsername());
			acc.setPassword(account.getPassword());
			acc.getRoles().add(roleService.find(3));
			accountService.save(acc);
			securityService.autoLogin(acc.getUsername(), acc.getPassword());
			return "redirect:/admin";
		} else {
			return "../admin/home/register";
		}
	}
}
