package com.demo.services;

import com.demo.entities.TypeValue;

public interface TypeValueService {

	public Iterable<TypeValue> findAll();

	public TypeValue find(int id);

	public TypeValue save(TypeValue typeValue);

	public void delete(int id);

}
