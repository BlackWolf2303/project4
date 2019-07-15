package com.demo.services;

import com.demo.entities.Color;

public interface ColorService {

	public Iterable<Color> findAll();

	public Color find(int id);

	public Color save(Color color);

	public void delete(int id);

}
