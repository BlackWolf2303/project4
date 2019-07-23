//package com.demo.configurations;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.firewall.HttpFirewall;
//import org.springframework.security.web.firewall.StrictHttpFirewall;
//
//import com.demo.services.AccountService;
//import com.demo.services.RoleService;
//
//@EnableWebSecurity
//public class HttpSecurityConfig {
//	
//	@Autowired
//	private RoleService roleService;
//	
//	@Autowired
//	private AccountService accountService;
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
//	@Configuration
//	@Order(1)
//	public class AdminConfiguration extends WebSecurityConfigurerAdapter {
//		protected void configure(HttpSecurity http) throws Exception {
//			http.antMatcher("/admin/**")
//					.authorizeRequests()
//					.antMatchers("/resources/**").permitAll()
//					//.anyRequest().access("hasRole('ROLE_NORMAL_ADMIN') or hasRole('ROLE_SUPER_ADMIN')")
//					.anyRequest().hasAuthority("ROLE_NORMAL_ADMIN")
//					
//					.and().formLogin().loginPage("/admin/login").permitAll()
//					// .loginProcessingUrl("/admin/login")
//					.failureUrl("/admin/login?error=true")
//					.defaultSuccessUrl("/admin")
//
//					.and().logout().logoutUrl("/admin/logout").permitAll().logoutSuccessUrl("/admin/login")
//					.deleteCookies("JSESSIONID")
//
//					.and().rememberMe().key("corgi")
//
//					.and().exceptionHandling().accessDeniedPage("/admin/403")
//
//					.and().csrf().disable();
//		}
//
//		@Bean
//		public AuthenticationManager customAuthenticationManager() throws Exception {
//			return authenticationManager();
//		}
//	}
//
//	@Configuration
//	@Order(2)
//	public class ClientConfiguration extends WebSecurityConfigurerAdapter {
//
//		@Override
//		protected void configure(HttpSecurity http) throws Exception {
//			http.antMatcher("/**")
//					.authorizeRequests()
//					.antMatchers("/resources/**").permitAll()
//					.anyRequest().permitAll()
//
//					.and().formLogin().loginPage("/login").permitAll()
//					// .loginProcessingUrl("/login")
//					.failureUrl("/login?error=true")
//					.successForwardUrl("/successLogin")
//					//.defaultSuccessUrl("/", true)
//
//					.and().logout().logoutSuccessUrl("/login").deleteCookies("JSESSIONID")
//
//					.and().rememberMe().key("corgi")
//
//					.and().exceptionHandling().accessDeniedPage("/403")
//
//					.and().csrf().disable();
//		}
//	}
//}