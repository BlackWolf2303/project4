package com.demo.services;

import org.springframework.data.domain.Sort;

import com.demo.entities.TypeTemplate;

public interface TypeTemplateService {

	public Iterable<TypeTemplate> findAll();
	
	public Iterable<TypeTemplate> findAll(Sort sort);

	public TypeTemplate find(int id);

	public TypeTemplate save(TypeTemplate typeTemplate);

	public void delete(int id);

}
