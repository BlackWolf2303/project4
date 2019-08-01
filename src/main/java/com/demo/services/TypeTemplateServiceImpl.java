package com.demo.services;

import com.demo.entities.TypeTemplate;
import com.demo.repositories.TypeTemplateRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("typeTemplateService")
@Transactional
public class TypeTemplateServiceImpl implements TypeTemplateService {

	@Autowired
	private TypeTemplateRepository typeTemplateRepository;

	@Override
	public Iterable<TypeTemplate> findAll() {
		return typeTemplateRepository.findAll();
	}

	@Override
	public TypeTemplate find(int id) {
		return typeTemplateRepository.findById(id).get();
	}

	@Override
	public TypeTemplate save(TypeTemplate typeTemplate) {
		return typeTemplateRepository.save(typeTemplate);
	}

	@Override
	public void delete(int id) {
		typeTemplateRepository.deleteById(id);
	}

}
