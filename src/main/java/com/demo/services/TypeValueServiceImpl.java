package com.demo.services;

import com.demo.entities.TypeValue;
import com.demo.repositories.TypeValueRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("typeValueService")
@Transactional
public class TypeValueServiceImpl implements TypeValueService {

	@Autowired
	private TypeValueRepository typeValueRepository;

	@Override
	public Iterable<TypeValue> findAll() {
		return typeValueRepository.findAll();
	}

	@Override
	public TypeValue find(int id) {
		return typeValueRepository.findById(id).get();
	}

	@Override
	public TypeValue save(TypeValue typeValue) {
		return typeValueRepository.save(typeValue);
	}

	@Override
	public void delete(int id) {
		typeValueRepository.deleteById(id);
	}

}
