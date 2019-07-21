package com.demo.repositories;

import com.demo.entities.Account;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {
	@Query("from Account where username = :username")
	Account findByUsername(@Param("username") String username);

	@Query("SELECT a "
			+ "FROM Account a INNER JOIN Role r WHERE r.name = :rolename")
	List<Account> findAllCustomer(@Param("rolename") String rolename);
}
