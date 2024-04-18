package com.faelma.pattern.strategy;

public class BitCoinPayment implements StratagyPayment {
    @Override
    public void pay() {
        System.out.println("Payment with Bitcoin has been done successfully");
    }
}
