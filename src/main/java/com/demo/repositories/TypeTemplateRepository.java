package com.demo.repositories;

import com.demo.entities.TypeTemplate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("typeTemplateRepository")
public interface TypeTemplateRepository extends JpaRepository<TypeTemplate, Integer> {
    
}
