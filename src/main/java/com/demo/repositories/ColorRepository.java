package com.demo.repositories;

import com.demo.entities.Color;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("colorRepository")
public interface ColorRepository extends JpaRepository<Color, Integer> {
    
}
