package com.faelma.pattern.strategy;

public class PaypalPayment implements StratagyPayment {
    @Override
    public void pay() {
        System.out.println("Payment with Paypal has been done successfully");
    }
}
