package com.taskmanager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.flyway.FlywayDataSource;

@SpringBootApplication
public class TaskManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(TaskManagerApplication.class, args);
	}

}
