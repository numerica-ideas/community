package com.faelma.pattern.strategy;

public class CreditCardPayment implements StratagyPayment {
    @Override
    public void pay() {
        System.out.println("Payment with Credit card has been done successfully");
    }
}
