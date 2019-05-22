package com.demo.repositories;

import com.demo.entities.Account;

import java.util.List;

public interface AccountRepository {
    List<Account> findAll();
    Account find(String username);
}
