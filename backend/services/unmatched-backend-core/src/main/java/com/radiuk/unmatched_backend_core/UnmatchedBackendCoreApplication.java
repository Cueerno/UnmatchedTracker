package com.radiuk.unmatched_backend_core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableCaching
@EnableJpaAuditing
@SpringBootApplication
public class UnmatchedBackendCoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(UnmatchedBackendCoreApplication.class, args);
	}

}
