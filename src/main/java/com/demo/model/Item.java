package com.demo.model;

import com.demo.entities.Product;
import com.demo.entities.TypeTemplate;
import com.demo.entities.TypeValue;

public class Item {

	private Product product;
	private int quantity;
	private int typeValueId1;
	private int typeValueId2;
	private TypeValue typeValue1;
	private TypeValue typeValue2;

	public Item(Product product, int quantity, int typeValueId1, int typeValueId2) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.typeValueId1 = typeValueId1;
		this.typeValueId2 = typeValueId2;
	}

	public TypeValue getTypeValue1() {
		return typeValue1;
	}

	public void setTypeValue1(TypeValue typeValue1) {
		this.typeValue1 = typeValue1;
	}

	public TypeValue getTypeValue2() {
		return typeValue2;
	}

	public void setTypeValue2(TypeValue typeValue2) {
		this.typeValue2 = typeValue2;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTypeValueId1() {
		return typeValueId1;
	}

	public void setTypeValueId1(int typeValueId1) {
		this.typeValueId1 = typeValueId1;
	}

	public int getTypeValueId2() {
		return typeValueId2;
	}

	public void setTypeValueId2(int typeValueId2) {
		this.typeValueId2 = typeValueId2;
	}

	public Item(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}

	public Item() {
	}

}
