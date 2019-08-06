package com.demo.services;

import java.util.List;

import org.springframework.data.domain.Sort;

import com.demo.entities.Product;

public interface ProductService {

	public Iterable<Product> findAll();

	public Iterable<Product> findAll(Sort sort);

	public Iterable<Product> findAllWithActive(Sort sort);

	public Product find(int id);

	public Product save(Product product);

	public void delete(int id);

	public List<Product> findByName(String name);

	public List<Product> findByActive(boolean active);

}
