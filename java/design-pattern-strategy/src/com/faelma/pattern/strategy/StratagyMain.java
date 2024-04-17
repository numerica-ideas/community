package com.faelma.pattern.strategy;

public class StratagyMain {

    public static void main(String[] args) {
        PaymentContext paymentPaypalContext = new PaymentContext(new PaypalPayment());
        paymentPaypalContext.executePayment();

        PaymentContext paymentCreditCardtContext = new PaymentContext(new CreditCardPayment());
        paymentCreditCardtContext.executePayment();

        PaymentContext paymentBitcoinContext = new PaymentContext(new BitCoinPayment());
        paymentBitcoinContext.executePayment();

        PaymentContext context = new PaymentContext(null);
        context.executePayment();
    }
}
