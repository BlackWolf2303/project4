package com.demo.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "order_detail")
public class OrderDetail {

	@EmbeddedId
	@JsonIgnore
	private OrderDetailID id;

	@Column(name = "qty")
	private int quantity;
	private double price;

//	@Id
//	@ManyToOne
//	@JoinColumn(name = "product_id", nullable = false)
//	private Product product;
//	@Id
//	@ManyToOne
//	@JoinColumn(name = "ordert_id", nullable = false)
//	private Order order;
	public OrderDetail() {
		super();
	}

	public OrderDetail(Order order, Product product, Integer quantity) {
		id = new OrderDetailID();
		id.setOrder(order);
		id.setProduct(product);
		this.quantity = quantity;
	}

	@Transient
	public Product getProduct() {
		return this.id.getProduct();
	}

	@Transient
	public Order getOrder() {
		return this.id.getOrder();
	}

	@Transient
	public Double getTotalPrice() {
		return getProduct().getPrice() * getQuantity();
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public OrderDetailID getId() {
		return id;
	}

	public void setId(OrderDetailID id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());

		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OrderDetail other = (OrderDetail) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}

		return true;
	}

}
