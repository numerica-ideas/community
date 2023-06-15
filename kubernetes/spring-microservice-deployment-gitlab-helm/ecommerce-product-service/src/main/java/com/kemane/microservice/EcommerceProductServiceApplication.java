package com.kemane.microservice;

import com.kemane.microservice.model.Product;
import com.kemane.microservice.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@EnableEurekaClient
@SpringBootApplication
public class EcommerceProductServiceApplication  implements CommandLineRunner {

	@Autowired
	private ProductService productService;
	public static void main(String[] args) {
		SpringApplication.run(EcommerceProductServiceApplication.class, args);
	}


	@Override
	public void run(String... args) throws Exception {

		Product products = new Product(1, "Chaussure", "chaussure homme", 20000);
		Product products1 = new Product(2, "Chemise", "chaussure homme", 8000);

		productService.addProduct(products);
		productService.addProduct(products1);
	}

}
