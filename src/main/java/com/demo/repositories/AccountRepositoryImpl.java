package com.demo.repositories;

import com.demo.entities.Account;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("accountRepository")
public class AccountRepositoryImpl implements AccountRepository {

    @Override
    public List<Account> findAll() {
        List<Account> accounts = new ArrayList<Account>();
//        accounts.add(new Account(1, "acc1", "$2a$04$YnS.4Ak1DPOV2YDjzPSl.ugIVk4/gXGPAHtSd/8g3fj2vJOuV49AG",
//                new String[] {"ROLE_SUPER_ADMIN", "ROLE_ADMIN", "ROLE_EMPLOYEE"}));
//        accounts.add(new Account(2, "acc2", "$2a$04$YnS.4Ak1DPOV2YDjzPSl.ugIVk4/gXGPAHtSd/8g3fj2vJOuV49AG",
//                new String[] {"ROLE_ADMIN", "ROLE_EMPLOYEE"}));
//        accounts.add(new Account(3, "acc3", "$2a$04$YnS.4Ak1DPOV2YDjzPSl.ugIVk4/gXGPAHtSd/8g3fj2vJOuV49AG",
//                new String[] {"ROLE_EMPLOYEE"}));
        return accounts;
    }

    @Override
    public Account find(String username) {
        for(Account account : this.findAll()) {
            if(account.getUsername().equalsIgnoreCase(username)) {
                return account;
            }
        }
        return null;
    }
}
