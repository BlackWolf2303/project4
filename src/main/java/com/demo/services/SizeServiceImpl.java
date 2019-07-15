package com.demo.services;

import com.demo.entities.Size;
import com.demo.repositories.SizeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("sizeService")
@Transactional
public class SizeServiceImpl implements SizeService {

	@Autowired
	private SizeRepository sizeRepository;

	@Override
	public Iterable<Size> findAll() {
		return sizeRepository.findAll();
	}

	@Override
	public Size find(int id) {
		return sizeRepository.findById(id).get();
	}

	@Override
	public Size save(Size size) {
		return sizeRepository.save(size);
	}

	@Override
	public void delete(int id) {
		sizeRepository.deleteById(id);
	}

}
