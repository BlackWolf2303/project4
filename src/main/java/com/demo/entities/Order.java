package com.demo.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int userid;
	private String shipaddress;
	private int createdate;

	
	private List<OrderDetail> orderDetais;

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

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getShipaddress() {
		return shipaddress;
	}

	public void setShipaddress(String shipaddress) {
		this.shipaddress = shipaddress;
	}

	public int getCreatedate() {
		return createdate;
	}

	public void setCreatedate(int createdate) {
		this.createdate = createdate;
	}

}
