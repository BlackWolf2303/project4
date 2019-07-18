package com.demo.repositories;

import com.demo.entities.Product;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {

	Product findByName(@Param("name") String name);
			
}
