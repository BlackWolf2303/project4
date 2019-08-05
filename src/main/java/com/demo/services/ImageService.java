package com.demo.services;

import com.demo.entities.Image;

public interface ImageService {

	public Iterable<Image> findAll();

	public Image find(int id);

	public Image save(Image image);

	public void delete(int id);

}
