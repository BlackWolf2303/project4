package com.demo.services;

import com.demo.entities.OrderDetail;

public interface OrderDetailService {
	public Iterable<OrderDetail> findAll();

	public OrderDetail find(int id);

	public OrderDetail save(OrderDetail orderDetail);

	public void delete(int id);
	
//	public List<OrderDetail> findByName(String name); 
}
