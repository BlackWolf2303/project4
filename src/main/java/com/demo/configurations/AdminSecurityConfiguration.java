package com.demo.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.demo.services.AccountService;

@EnableWebSecurity
@Configuration
@Order(1)
public class AdminSecurityConfiguration extends WebSecurityConfigurerAdapter {
 
	@Autowired
    private AccountService accountService;
 
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.antMatcher("/admin/**")
			//.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
	        .authorizeRequests()
	        .antMatchers("/register*").permitAll()
	        .anyRequest().authenticated()
	
	    	.and()
	        .formLogin()
	        .loginPage("/admin/login").permitAll()
	        //.loginProcessingUrl("/admin/login")
	        .failureUrl("/admin/login?error=true")
	        .defaultSuccessUrl("/admin")
	        
	        .and()
	        .logout()
	        .logoutUrl("/admin/logout").permitAll()
		  	.logoutSuccessUrl("/admin/login")
		  	.deleteCookies("JSESSIONID")
		   
		  	.and().rememberMe().key("corgi")
		  	
		  	.and()
		  	.exceptionHandling()
		  	.accessDeniedPage("/403")
		   
		  	.and()
		  	.csrf().disable();
    }
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder)
            throws Exception {
        builder.userDetailsService(accountService);
    }
    
//    @Bean
//    public AuthenticationManager customAuthenticationManager() throws Exception {
//        return authenticationManager();
//    }

//    @Bean
//    public BCryptPasswordEncoder encoder() {
//        return new BCryptPasswordEncoder();
//    }
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
}
