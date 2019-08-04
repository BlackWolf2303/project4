package com.demo.services;

import com.demo.entities.Account;
import com.demo.entities.Role;
import com.demo.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public Account save(Account account) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		account.setPassword(passwordEncoder.encode(account.getPassword()));
		return accountRepository.save(account);
	}

	@Override
	public Account findByUsername(String username) {
		Account account = accountRepository.findByUsername(username);
		return account;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		Account account = accountRepository.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("Username not found for " + username);
		}
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		for (Role role : account.getRoles()) {
			grantedAuthorities.add(new SimpleGrantedAuthority(role.getName()));
		}
		return new User(account.getUsername(), account.getPassword(), grantedAuthorities);
	}

	@Override
	public Page<Account> findAll(Pageable pageable) {
		return accountRepository.findAll(pageable);
	}

	@Override
	public List<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public List<Account> findAll(Sort sort) {
		return accountRepository.findAll(sort);
	}

	@Override
	public List<Account> findbyRoles(List<Role> roles, Sort sort) {
		return accountRepository.findByRoles(roles,sort);
	}

	@Override
	public Account findById(int id) {
		try {
			return accountRepository.findById(id).get();
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public void delete(int id) {
		 accountRepository.deleteById(id);
	}
	
}
