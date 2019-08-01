package com.demo.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Account;
import com.demo.model.RegisterModel;
import com.demo.services.AccountService;

@Component("registerValidator")
public class RegisterValidator implements Validator {

	@Autowired
	private AccountService accountService;

	@Override
	public boolean supports(Class<?> arg0) {
		return arg0.equals(RegisterModel.class);
	}

	@Override
	public void validate(Object object, Errors errors) {
		RegisterModel registerAccount = (RegisterModel) object;
		//check exist username
		if (accountService.findByUsername(registerAccount.getUsername()) != null) {
			errors.rejectValue("username", "account.username.exists");
		}
		//check confirm password
		if (!registerAccount.getPassword().equalsIgnoreCase(registerAccount.getPasswordConfirm())) {
			errors.rejectValue("passwordConfirm", "account.password.nomatch");
	    }
		//check password
		if(!registerAccount.getPassword().isEmpty()) {
			if(registerAccount.getPassword().length() < 8 || registerAccount.getPassword().length() > 20) {
				errors.rejectValue("password", "account.password.length.nomatch");
			} else {
				Pattern pattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$");
			    Matcher matcher = pattern.matcher(registerAccount.getPassword());
			    if(!matcher.find()) {
			    	errors.rejectValue("password", "account.password.complexity.nomatch");
			    }
			}
			
		}
	}

}
