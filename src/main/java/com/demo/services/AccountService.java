package com.demo.services;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.Account;
import com.demo.entities.Role;

public interface AccountService extends UserDetailsService {

	Account save(Account account);

	Account findByUsername(String username);

	Page<Account> findAll(Pageable pageable);

	List<Account> findAll(Sort sort);

	List<Account> findAll();

	Slice<Account> findbyRoles(List<Role> roles, Pageable pageable);

	Account findById(int id);

	void delete(int id);
}
