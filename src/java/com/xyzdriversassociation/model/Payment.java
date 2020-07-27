/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.model;

import java.util.Date;

/**
 *
 * @author Thailan Sendduran
 */
public class Payment {
    int PaymentId;
    String paymentType;
    Date paymentDate;
    float amount;

    public Payment(int PaymentId, String paymentType, Date paymentDate, float amount) {
        this.PaymentId = PaymentId;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.amount = amount;
    }

    public int getPaymentId() {
        return PaymentId;
    }

    public void setPaymentId(int PaymentId) {
        this.PaymentId = PaymentId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
    
    
}
