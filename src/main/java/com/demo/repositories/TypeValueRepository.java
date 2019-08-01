package com.demo.repositories;

import com.demo.entities.TypeValue;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("typeValueRepository")
public interface TypeValueRepository extends JpaRepository<TypeValue, Integer> {
    
}
