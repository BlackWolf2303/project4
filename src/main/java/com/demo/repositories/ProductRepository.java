package com.demo.repositories;

import com.demo.entities.Product;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("productRepository")
public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {

	@Query("FROM Product t WHERE t.name like %:name%")
	List<Product> findByName(@Param("name") String name);
	
	Iterable<Product> findAll(Sort sort);
	
	List<Product> findByActive(boolean active);
	
	@Query("FROM Product t WHERE t.active = 1")
	public Iterable<Product> findAllWithActive(Sort sort);
}
