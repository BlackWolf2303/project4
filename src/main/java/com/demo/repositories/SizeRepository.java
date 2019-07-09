package com.demo.repositories;

import com.demo.entities.Size;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("sizeRepository")
public interface SizeRepository extends JpaRepository<Size, Integer> {
  
}
