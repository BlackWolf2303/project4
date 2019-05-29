//package com.demo.configurations;
//
//import com.demo.services.AccountService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration2 extends WebSecurityConfigurerAdapter {
//    @Autowired
//    private AccountService accountService;
//
//    @Override
//    protected void configure(HttpSecurity httpSecurity) throws Exception {
//    	httpSecurity.antMatcher("/admin*")
//			        .authorizeRequests()
//			        .anyRequest()
//			        .hasRole("ADMIN")
//        
//			    	.and()
//			        .formLogin()
//			        .loginPage("/loginAdmin")
//			        .loginProcessingUrl("/admin_login")
//			        .failureUrl("/loginAdmin?error=loginError")
//			        .defaultSuccessUrl("/adminPage")
//			        
//			        .and()
//			        .logout()
//			        .logoutUrl("/admin_logout")
//				  	.logoutSuccessUrl("/protectedLinks")
//				  	.deleteCookies("JSESSIONID")
//				   
//				  	.and()
//				  	.exceptionHandling()
//				  	.accessDeniedPage("/403")
//				   
//				  	.and()
//				  	.csrf().disable();
//
//    }
//
//    @Autowired
//    public void configureGlobal(AuthenticationManagerBuilder builder)
//            throws Exception {
//        builder.userDetailsService(accountService);
//    }
//
//    @Bean
//    public BCryptPasswordEncoder encoder() {
//        return new BCryptPasswordEncoder();
//    }
//}
