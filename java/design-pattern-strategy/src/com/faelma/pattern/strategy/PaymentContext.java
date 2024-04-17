package com.faelma.pattern.strategy;

public class PaymentContext {
    private final StratagyPayment stratagyPayment;

    public PaymentContext(StratagyPayment stratagyPayment) {
        this.stratagyPayment = stratagyPayment;
    }

    void executePayment() {
        if (stratagyPayment == null) {
            System.err.println("This payment method "+ stratagyPayment + " Not found");
            return;
        }
        stratagyPayment.pay();
    }
}
