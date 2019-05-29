package com.demo.services;

import org.springframework.data.repository.CrudRepository;

import com.demo.entities.Product;

public interface ProductService extends CrudRepository<Product, Integer>{

//	public Iterable<Product> findAll();
//
//	public Product find(int id);
//
//	public Product save(Product product);
//
//	public void delete(int id);

}
