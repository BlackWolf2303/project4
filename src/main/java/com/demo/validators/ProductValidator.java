package com.demo.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.AccountConfirm;
import com.demo.entities.ProductConfirm;

@Component("productValicator")
public class ProductValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(ProductConfirm.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		
	}

}
