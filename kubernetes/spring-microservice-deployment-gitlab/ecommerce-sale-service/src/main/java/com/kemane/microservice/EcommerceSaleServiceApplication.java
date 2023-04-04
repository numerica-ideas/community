package com.kemane.microservice;

import com.kemane.microservice.model.Sale;
import com.kemane.microservice.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@EnableFeignClients
@EnableEurekaClient
@SpringBootApplication
public class EcommerceSaleServiceApplication implements CommandLineRunner {

	@Autowired
	private SaleService saleService;

	public static void main(String[] args) {
		SpringApplication.run(EcommerceSaleServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Sale sale = new Sale(1, 2,40000, 1,1);

		Sale sale1 = new Sale(2, 1,8000, 2,2);

		saleService.addVente(sale);
		saleService.addVente(sale1);
	}
}
