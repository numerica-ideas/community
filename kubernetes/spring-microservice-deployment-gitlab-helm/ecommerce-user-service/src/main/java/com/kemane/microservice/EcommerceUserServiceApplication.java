package com.kemane.microservice;

import com.kemane.microservice.model.User;
import com.kemane.microservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@EnableEurekaClient
@SpringBootApplication
public class EcommerceUserServiceApplication implements CommandLineRunner {

	@Autowired
	private UserService userService;
	public static void main(String[] args) {
		SpringApplication.run(EcommerceUserServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		User user = new User(1, "donfack", "kemane");
		User user1 = new User(2, "nafack", "ivan");

		userService.addUser(user);
		userService.addUser(user1);
	}
}
