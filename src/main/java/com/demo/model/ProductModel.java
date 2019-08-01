package com.demo.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.NumberFormat;

import com.demo.entities.TypeTemplate;

public class ProductModel {

	private int id;
	@Length(min = 3, max = 250)
	private String name;
	@NotNull
	@NumberFormat(pattern = "#,###,###.##")
	@Range(min = 0, max = 1000000)
	private String price;
	@NotNull
	@Range(min = 0, max = 50)
	private String quantity;
	private boolean active;
	private TypeTemplate typeTemplate1;
	private TypeTemplate typeTemplate2;

	public TypeTemplate getTypeTemplate1() {
		return typeTemplate1;
	}

	public void setTypeTemplate1(TypeTemplate typeTemplate1) {
		this.typeTemplate1 = typeTemplate1;
	}

	public TypeTemplate getTypeTemplate2() {
		return typeTemplate2;
	}

	public void setTypeTemplate2(TypeTemplate typeTemplate2) {
		this.typeTemplate2 = typeTemplate2;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

}
