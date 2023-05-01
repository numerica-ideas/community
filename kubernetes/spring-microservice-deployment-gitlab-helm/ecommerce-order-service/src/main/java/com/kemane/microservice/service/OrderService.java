package com.kemane.microservice.service;

import com.kemane.microservice.model.Order;
import com.kemane.microservice.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public List<Order> getAllOrders(){
        return orderRepository.findAll();
    }

    public Optional<Order> getOrderById(int id){
        return orderRepository.findById(id);
    }

    public Order addOrder(Order order){
        return orderRepository.save(order);
    }

}
