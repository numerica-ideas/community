package com.kemane.microservice.client;

import com.kemane.microservice.model.Order;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(name = "ecommerce-order-service", url = "localhost:8086")
public interface OrderClient {

    @PostMapping(value = "api/v1/orders/create")
    Order saveOrder(@RequestBody Order order);

}
