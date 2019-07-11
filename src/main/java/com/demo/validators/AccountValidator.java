package com.demo.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Account;
import com.demo.entities.AccountConfirm;
import com.demo.services.AccountService;
import com.demo.services.AccountServiceImpl;

@Component("accountValicator")
public class AccountValidator implements Validator {

	@Autowired
	private AccountService accountService;

	@Override
	public boolean supports(Class<?> arg0) {
		return arg0.equals(AccountConfirm.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		accountService = new AccountServiceImpl();
		AccountConfirm accountConfirm = (AccountConfirm) object;
		if (accountService.findByUsername(accountConfirm.getUsername()) != null) {
			//errors.rejectValue("username", "account.username.exists");
		}
	}

}
