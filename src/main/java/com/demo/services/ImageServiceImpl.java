package com.demo.services;

import com.demo.entities.Image;
import com.demo.repositories.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("imageService")
@Transactional
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageRepository imageRepository;

	@Override
	public Iterable<Image> findAll() {
		return imageRepository.findAll();
	}

	@Override
	public Image find(int id) {
		return imageRepository.findById(id).get();
	}

	@Override
	public Image save(Image image) {
		return imageRepository.save(image);
	}

	@Override
	public void delete(int id) {
		imageRepository.deleteById(id);
	}

}
