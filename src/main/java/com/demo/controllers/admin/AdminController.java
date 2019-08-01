package com.demo.controllers.admin;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.services.SecurityService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "redirect:/admin/dashboard";
	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public String dashboard() {
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
		if (SecurityContextHolder.getContext().getAuthentication() != null
				&& SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
				!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
			return "redirect:/admin";
		}
		model.addAttribute("errorMessge", errorMessge);
		return "../admin/home/login";
	}
	
	@RequestMapping(value = "successLogin", method = RequestMethod.POST)
	private String successLogin(HttpServletRequest httpServletRequest) {
        UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        Collection<? extends GrantedAuthority> authorities
        = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
        	if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                return "redirect:/admin";
            }
		}
    	securityService.autoLogout();
    	return "redirect:/admin/login?error";
	}
}
