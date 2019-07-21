package com.demo.services;

import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.repositories.OrderDetailRepository;
import com.demo.repositories.OrderRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderRepository orderRepository;

	@Override
	public Iterable<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public Order find(int id) {
		return orderRepository.findById(id).get();
	}

	@Override
	public Order save(Order order) {
		return orderRepository.save(order);
	}

	@Override
	public void delete(int id) {
		orderRepository.deleteById(id);
	}

//	@Override
//	public List<OrderDetail> findByName(String name) {
//		return orderDetailRepository.findByName(name);
//	}
}
