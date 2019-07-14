package com.demo;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import com.demo.services.StorageProperties;
import com.demo.services.StorageService;

@SpringBootApplication
@EnableConfigurationProperties(StorageProperties.class)
public class Prj4Application {

	public static void main(String[] args) {
		SpringApplication.run(Prj4Application.class, args);
	}
	
//	@Bean
//    CommandLineRunner init(StorageService storageService) {
//        return (args) -> {
//            //storageService.deleteAll();
//            storageService.init();
//        };
//    }

}
