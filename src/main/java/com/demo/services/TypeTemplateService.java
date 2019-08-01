package com.demo.services;

import com.demo.entities.TypeTemplate;

public interface TypeTemplateService {

	public Iterable<TypeTemplate> findAll();

	public TypeTemplate find(int id);

	public TypeTemplate save(TypeTemplate typeTemplate);

	public void delete(int id);

}
