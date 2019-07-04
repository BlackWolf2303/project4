package com.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;

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
	public String HomeView() {
		return "home/index";
	}
	
	@GetMapping("login")
	public String LoginFailed(@RequestParam(value = "error", required = false) String error, Model model) {
		String errorMessge = null;
        if(error != null) {
            errorMessge = "Username or Password is incorrect !!";
        }
//        if(logout != null) {
//            errorMessge = "You have been successfully logged out !!";
//        }
        model.addAttribute("errorMessge", errorMessge);
        if (!RequestContextHolder.currentRequestAttributes().getSessionId().isEmpty()) {
        	return "redirect:/";
        }
		return "login/index";
	}
	
    @GetMapping("register")
    public String Register() {
        return "login/register";
    }
    
    @PostMapping("register")
    public String Register(@ModelAttribute("account") Account account, @RequestParam("passwordConfirm") String passwordConfirm) {
        //System.out.println(account.getUsername() + "|" + account.getPassword() + "|" + passwordConfirm);
        accountService.save(account);
        securityService.autoLogin(account.getUsername(), passwordConfirm);
    	return "redirect:/";
    }
}
