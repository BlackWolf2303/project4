package com.demo.repositories;

import com.demo.entities.Product;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {

	@Query("FROM Product t WHERE t.name like %:name%")
	List<Product> findByName(@Param("name") String name);
			
}
