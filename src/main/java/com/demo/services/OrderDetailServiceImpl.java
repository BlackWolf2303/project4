package com.demo.services;

import com.demo.entities.OrderDetail;
import com.demo.repositories.OrderDetailRepository;

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

@Service("orderDetailService")
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailRepository orderDetailRepository;

	@Override
	public Iterable<OrderDetail> findAll() {
		return orderDetailRepository.findAll();
	}

	@Override
	public OrderDetail find(int id) {
		return orderDetailRepository.findById(id).get();
	}

	@Override
	public OrderDetail save(OrderDetail orderdetail) {
		return orderDetailRepository.save(orderdetail);
	}

	@Override
	public void delete(int id) {
		orderDetailRepository.deleteById(id);
	}

//	@Override
//	public List<OrderDetail> findByName(String name) {
//		return orderDetailRepository.findByName(name);
//	}
}
