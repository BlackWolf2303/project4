package com.demo.services;

import com.demo.entities.Product;
import com.demo.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
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

}
