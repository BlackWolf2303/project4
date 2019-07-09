package com.demo.services;

import com.demo.entities.Size;

public interface SizeService {

	public Iterable<Size> findAll();

	public Size find(int id);

	public Size save(Size size);

	public void delete(int id);

}
