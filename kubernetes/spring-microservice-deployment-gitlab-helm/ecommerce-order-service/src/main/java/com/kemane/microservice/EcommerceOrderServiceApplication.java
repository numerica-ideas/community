package com.kemane.microservice;

import com.kemane.microservice.model.Order;
import com.kemane.microservice.service.OrderService;
import com.netflix.discovery.converters.Auto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@EnableEurekaClient
@SpringBootApplication
public class EcommerceOrderServiceApplication implements CommandLineRunner {

	@Autowired
	private OrderService orderService;
	public static void main(String[] args) {
		SpringApplication.run(EcommerceOrderServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Order order = new Order(1, "Kemane Donfack", "Chaussure", 2, 20000, 40000);

		orderService.addOrder(order);

	}
}
