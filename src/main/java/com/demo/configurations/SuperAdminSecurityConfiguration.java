//package com.demo.configurations;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.context.SecurityContextPersistenceFilter;
//import org.springframework.security.web.firewall.HttpFirewall;
//import org.springframework.security.web.firewall.StrictHttpFirewall;
//import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;
//
//import com.demo.services.AccountService;
//import com.demo.services.RoleService;
//
//
//@EnableWebSecurity
//@Configuration
//@Order(1)
//public class SuperAdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
//
//	@Autowired
//	private RoleService roleService;
//	
//	@Autowired
//	private AccountService accountService;
//
//	@Override
//	protected void configure(HttpSecurity httpSecurity) throws Exception {
//		
//		httpSecurity.cors().and().csrf().disable();
//		
//		httpSecurity.antMatcher("/superadmin/**")
//					.authorizeRequests()
//					.antMatchers("/superadmin/**").access("hasRole('ROLE_SUPER_ADMIN')")
//					.and().formLogin().loginPage("/superadmin/login")
//					.loginProcessingUrl("/superadmin/login")
//					.defaultSuccessUrl("/superadmin")
//					.failureUrl("/superadmin/login?error=true")
//					.and().logout().logoutUrl("/superadmin/logout")
//					.logoutSuccessUrl("/superadmin/login").deleteCookies("JSESSIONID")
//					.and().rememberMe().key("corgi")
//					.and().exceptionHandling().accessDeniedPage("/superadmin/403");
//		
//	}
//
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
//		builder.userDetailsService(accountService);
//	}
//
//	@Bean
//	public BCryptPasswordEncoder encoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
//	@Bean
//	public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
//	    StrictHttpFirewall firewall = new StrictHttpFirewall();
//	    firewall.setAllowUrlEncodedSlash(true);    
//	    return firewall;
//	}
//	
//	@Bean
//	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
//	    return new SecurityContextHolderAwareRequestFilter();
//	}
//	
//	@Bean
//	public SecurityContextPersistenceFilter persistenceFilter() {
//		return new SecurityContextPersistenceFilter();
//	}
//	
//}