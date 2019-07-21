package com.demo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.Account;

public interface AccountService extends UserDetailsService {

	void save(Account account);

	Account findByUsername(String username);
	
	List<Account> findAllCustomer(String rolename);

	List<Account> findAll();
}
