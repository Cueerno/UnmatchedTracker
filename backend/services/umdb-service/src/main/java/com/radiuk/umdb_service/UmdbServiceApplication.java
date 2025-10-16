package com.radiuk.umdb_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
public class UmdbServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(UmdbServiceApplication.class, args);
	}

}
