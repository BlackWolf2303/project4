package com.demo.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity //@IdClass(OrderDetailID.class)
@Table(name = "order_detail")
public class OrderDetail implements Serializable {

	private String quantity;
	private Double price;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;
	@Id
	@ManyToOne
	@JoinColumn(name = "ordert_id", nullable = false)
	private Order order;

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}
