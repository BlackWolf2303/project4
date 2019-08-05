package com.demo.services;

import com.demo.entities.Product;
import com.demo.repositories.ProductRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.support.Repositories;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}
	
	@Override
	public Iterable<Product> findAll(Sort sort) {
		return productRepository.findAll(sort);
	}
	
	@Override
	public Iterable<Product> findAllWithActive(Sort sort) {
		return productRepository.findAllWithActive(sort);
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public void delete(int id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<Product> findByName(String name) {
		return productRepository.findByName(name);
	}

	@Override
	public List<Product> findByActive(boolean active) {
		return productRepository.findByActive(active);
	}

}
