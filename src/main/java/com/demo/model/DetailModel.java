package com.demo.model;

import com.demo.entities.TypeTemplate;

public class DetailModel {
	private String quantity;
	private TypeTemplate template1;
	private TypeTemplate template2;

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public TypeTemplate getTemplate1() {
		return template1;
	}

	public void setTemplate1(TypeTemplate template1) {
		this.template1 = template1;
	}

	public TypeTemplate getTemplate2() {
		return template2;
	}

	public void setTemplate2(TypeTemplate template2) {
		this.template2 = template2;
	}

}
