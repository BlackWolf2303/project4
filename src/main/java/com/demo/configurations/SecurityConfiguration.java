package com.demo.configurations;

import com.demo.services.AccountService;
import com.demo.services.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private AccountService accountService;

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        httpSecurity.authorizeRequests()
                    .antMatchers(HttpMethod.GET, "/welcome").access("hasRole('ROLE_SUPER_ADMIN')")
                    //.antMatchers(HttpMethod.GET, "/api/demo2/**").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN')")
                    //.antMatchers(HttpMethod.GET, "/api/demo3/**").access("hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
                    .antMatchers("/login*").permitAll()
                    .antMatchers("/resources/**").permitAll()
                    .anyRequest().authenticated()
                .and()
                    .formLogin().loginPage("/login").passwordParameter("password").usernameParameter("username")
                    .loginProcessingUrl("/loginProcessing")
                    .defaultSuccessUrl("/welcome")
                    //.failureUrl("/loginFailed")
                .and().logout().logoutUrl("/doLogout").logoutSuccessUrl("/logout")
                .and().csrf().disable();

    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder builder)
            throws Exception {
        builder.userDetailsService(accountService);
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
}
