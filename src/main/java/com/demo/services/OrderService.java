package com.demo.services;

import com.demo.entities.Order;

public interface OrderService {
	public Iterable<Order> findAll();

	public Order find(int id);

	public Order save(Order order);

	public void delete(int id);
	
//	public List<OrderDetail> findByName(String name); 
}
