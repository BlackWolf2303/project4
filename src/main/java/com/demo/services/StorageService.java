package com.demo.services;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface StorageService {

    public void init(Path path);

    public void store(MultipartFile file, String filename);
    
    public void store(MultipartFile[] files, String fileName, int i);

    public Stream<Path> loadAll();

    public Path load(String filename);

    public Resource loadAsResource(String filename);

    public void deleteAll();

}
