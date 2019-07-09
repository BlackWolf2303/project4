package com.demo.services;

import com.demo.entities.Color;
import com.demo.repositories.ColorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("colorService")
@Transactional
public class ColorServiceImpl implements ColorService {

	@Autowired
	private ColorRepository colorRepository;

	@Override
	public Iterable<Color> findAll() {
		return colorRepository.findAll();
	}

	@Override
	public Color find(int id) {
		return colorRepository.findById(id).get();
	}

	@Override
	public Color save(Color color) {
		return colorRepository.save(color);
	}

	@Override
	public void delete(int id) {
		colorRepository.deleteById(id);
	}

}
