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
    int paymentId;
    int userId;
    String paymentType;
    String paymentDate;
    Double amount;

    public Payment(int paymentId, String paymentType, String paymentDate, Double amount) {
        this.paymentId = paymentId;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.amount = amount;
    }

    public Payment() {
        //To change body of generated methods, choose Tools | Templates.
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int PaymentId) {
        this.paymentId = PaymentId;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
}
