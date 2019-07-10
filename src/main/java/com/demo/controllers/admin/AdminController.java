package com.demo.controllers.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.SecurityService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String home() {
		return "../admin/home/index";
	}
	
	@GetMapping("login")
	public String loginFailed(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessge = null;
        if(error != null) {
            errorMessge = "Username or Password is incorrect !!";
        }
//        if(logout != null) {
//            errorMessge = "You have been successfully logged out !!";
//        }
		if (SecurityContextHolder.getContext().getAuthentication() != null
				&& SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
				// when Anonymous Authentication is enabled
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken) ) {
       	return "redirect:/admin";
       }
        model.addAttribute("errorMessge", errorMessge);
		return "../admin/login";
	}
	
    @GetMapping("register")
    public String register() {
        return "../admin/register";
    }
    
    @PostMapping("register")
    public String register(@ModelAttribute("account") Account account, @RequestParam("passwordConfirm") String passwordConfirm) {
        //System.out.println(account.getUsername() + "|" + account.getPassword() + "|" + passwordConfirm);
        accountService.save(account);
        securityService.autoLogin(account.getUsername(), passwordConfirm);
    	return "redirect:/admin";
    }
}
