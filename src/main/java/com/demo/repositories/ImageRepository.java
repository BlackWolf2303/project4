package com.demo.repositories;

import com.demo.entities.Image;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("imageRepository")
public interface ImageRepository extends JpaRepository<Image, Integer> {
    
}
