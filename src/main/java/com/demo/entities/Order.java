package com.demo.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "ordertbl")
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Length(max = 60)
	private String status;
	@Length(max = 60)
	private String type;
	@Length(max = 250)
	private String shipto;

	@ManyToOne
	@JoinColumn(name = "account_id", nullable = false)
	private Account account;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "id.order")
	private List<OrderDetail> orderDetais;

	public String getStatus() {
		return status;
	}

	public String getShipto() {
		return shipto;
	}

	public void setShipto(String shipto) {
		this.shipto = shipto;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<OrderDetail> getOrderDetais() {
		return orderDetais;
	}

	public void setOrderDetais(List<OrderDetail> orderDetais) {
		this.orderDetais = orderDetais;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
