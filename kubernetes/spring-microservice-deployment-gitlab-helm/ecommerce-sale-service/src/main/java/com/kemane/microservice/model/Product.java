package com.kemane.microservice.model;

import lombok.Data;

@Data
public class Product {

    private int id;

    private String name;

    private String description;

    private int price;
}
