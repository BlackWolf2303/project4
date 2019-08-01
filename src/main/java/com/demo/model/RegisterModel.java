package com.demo.model;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

import com.demo.entities.Role;

public class RegisterModel {
	@NotEmpty
	@Length(min = 3, max = 250)
	private String username;
	@NotEmpty
	private String password;
	private String passwordConfirm;
	@NotEmpty
	@Email
	private String email;

	public String getUsername() {
		return username;
	}

	public void setUsername(String regusername) {
		this.username = regusername;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String regpassword) {
		this.password = regpassword;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String regpasswordConfirm) {
		this.passwordConfirm = regpasswordConfirm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
