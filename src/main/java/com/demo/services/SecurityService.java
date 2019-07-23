package com.demo.services;

public interface SecurityService {
	void autoLogin(String username, String password);
	void autoLogout();
}
