package com.demo.configurations;

import com.demo.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;

@EnableWebSecurity
@Configuration
@Order(2)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private AccountService accountService;
    
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
    	httpSecurity
    		.antMatcher("/**")
    		//.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
	        .authorizeRequests()
	        .antMatchers("/register*").permitAll()
	        .antMatchers("/resources/**").permitAll()
	        .anyRequest().permitAll()

	    	.and()
	        .formLogin()
	        .loginPage("/login").permitAll()
	        //.loginProcessingUrl("/admin/login")
	        .failureUrl("/login?error=true")
	        //.defaultSuccessUrl("/admin")
	        
	        .and()
	        .logout()
	        .logoutUrl("/logout").permitAll()
		  	.logoutSuccessUrl("/login")
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
    
    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Bean
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
	    return new SecurityContextHolderAwareRequestFilter();
	}
	
	@Bean
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
}
