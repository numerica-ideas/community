package com.faelma.pattern.strategy;

public class CashPayment implements StratagyPayment {
    @Override
    public void pay() {
        System.out.println("Payment with Cash has been done successfully");
    }
}
