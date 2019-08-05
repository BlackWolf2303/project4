package com.demo.validators;

import java.io.File;
import java.io.IOException;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.model.EditProfileModel;
import com.demo.model.ProductModel;
import com.demo.model.RegisterModel;

@Component("productValidator")
public class ProductValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(ProductModel.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProductModel productModel = (ProductModel) target;
		if(productModel.getFile()[0].isEmpty()) {
			File image0 = new File("src/main/resources/static/upload/customer/picture" + 0 + productModel.getId() + ".jpg");
			if(!image0.exists()) {
				errors.rejectValue("file", "product.picture.required");
			}
		}
	}

}
