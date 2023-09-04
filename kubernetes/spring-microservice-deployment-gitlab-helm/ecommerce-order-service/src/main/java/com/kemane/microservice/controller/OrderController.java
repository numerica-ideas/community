package com.kemane.microservice.controller;


import com.kemane.microservice.model.Order;
import com.kemane.microservice.model.User;
import com.kemane.microservice.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping(value = "/create")
    public ResponseEntity<Order> saveOrder(@RequestBody Order order){
        Order newOrder = orderService.addOrder(order);

        if(newOrder != null){
            return new ResponseEntity<>(newOrder, HttpStatus.CREATED);
        }else{
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "/all", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Order> getAllOrders (){
        return orderService.getAllOrders();
    }

    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Order> getProductsById(@PathVariable int id){
        Optional<Order> getOrder = orderService.getOrderById(id);

        if(getOrder.isPresent()){
            return new ResponseEntity<>(getOrder.get(), HttpStatus.OK);
        }else{
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

    }
}
