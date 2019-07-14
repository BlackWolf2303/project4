package com.demo.entities;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

public class ProductConfirm {
	
	private int id;
	
	@Length(min = 3, max = 25)
	private String name;
	
	@NotNull
	@Range(min = 10, max = 500)
	private Double price;
	
	@NotNull
	@Range(min = 0, max = 50)
	private int quantity;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	} 
	
	
}
