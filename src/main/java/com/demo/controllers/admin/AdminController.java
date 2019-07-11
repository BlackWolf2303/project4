package com.demo.controllers.admin;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@GetMapping("login")
	public String loginFailed(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessge = null;
		if (error != null) {
			errorMessge = "Username or Password is incorrect !!";
		}
//        if(logout != null) {
//            errorMessge = "You have been successfully logged out !!";
//        }
		if (SecurityContextHolder.getContext().getAuthentication() != null
				&& SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
				// when Anonymous Authentication is enabled
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			return "redirect:/admin";
		}
		model.addAttribute("errorMessge", errorMessge);
		return "../admin/login";
	}

	@GetMapping("register")
	public String register(ModelMap modelMap) {
		try {
			modelMap.put("accountConfirm", new AccountConfirm());
			modelMap.put("roless", roleService.findAll());
		} catch (Exception e) {
			System.out.println("Register GET");
		}
		return "../admin/register";
	}

	@PostMapping("register")
	public String register(@ModelAttribute("accountConfirm") @Valid AccountConfirm accountConfirm,
			BindingResult bindingResult) {
		// try {
		accountValidator.validate(accountConfirm, bindingResult);
		if (!bindingResult.hasErrors()) {
			// System.out.println(account.getUsername() + "|" + account.getPassword() + "|"
			// + passwordConfirm);
			System.out.println("Valid");
			if (accountConfirm.getPassword().equalsIgnoreCase(accountConfirm.getPasswordConfirm())) {
				Account account = new Account();
				account.setUsername(accountConfirm.getUsername());
				account.setPassword(accountConfirm.getPassword());
				account.setRoles(accountConfirm.getRoles());
				accountService.save(account);
				System.out.println("save");
				securityService.autoLogin(account.getUsername(), account.getPassword());
				System.out.println("autoLogin");
				return "redirect:/admin";
			}
			return "redirect:/admin/register";
		} else {
			// } catch (Exception e) {
			// System.out.println(e.getMessage() + "a");
			// }
			return "redirect:/admin/register";
		}
	}
}
