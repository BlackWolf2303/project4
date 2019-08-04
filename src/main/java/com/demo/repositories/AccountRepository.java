package com.demo.repositories;

import com.demo.entities.Account;
import com.demo.entities.Role;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("accountRepository")
public interface AccountRepository extends PagingAndSortingRepository<Account, Integer> {
	@Query("from Account where username = :username")
	Account findByUsername(@Param("username") String username);

	List<Account> findAll();
	List<Account> findAll(Sort sort);
//	@Query("SELECT e FROM Account e INNER JOIN Role")// where t.name = :roleName")
	Slice<Account> findByRoles(List<Role> roles, Pageable pageable);
}
