package com.demo.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.model.EditProfileModel;
import com.demo.model.RegisterModel;

@Component("editProfileValidator")
public class EditProfileValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(EditProfileModel.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		EditProfileModel editProfileModel = (EditProfileModel) target;
		
	}

}
