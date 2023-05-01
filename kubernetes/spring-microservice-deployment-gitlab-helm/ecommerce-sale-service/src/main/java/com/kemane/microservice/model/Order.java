package com.kemane.microservice.model;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    private String customerName;

    private String productName;

    private int productQuantity;

    private int unitPrice;

    private double total;
}
