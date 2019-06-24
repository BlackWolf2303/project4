package com.demo.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.Account;

public interface AccountService extends UserDetailsService {

	void save(Account account);

	Account findByUsername(String username);

}
