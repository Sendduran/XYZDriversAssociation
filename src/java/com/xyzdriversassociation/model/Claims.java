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
public class Claims {
    int claimId;
    int userId;
    String claimRequest;
    String claimDate;
    String claimStatus;
    double amount;



    public Claims(int userId,String claimRequest, String claimDate, String claimStatus,double amount) {
        this.userId = userId;
        this.claimRequest = claimRequest;
        this.claimDate = claimDate;
        this.claimStatus = claimStatus;
        this.amount = amount;
    }

    public Claims() {
        
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }    
    

    public int getClaimId() {
        return claimId;
    }

    public void setClaimId(int claimId) {
        this.claimId = claimId;
    }

    public String getClaimRequest() {
        return claimRequest;
    }

    public void setClaimRequest(String claimRequest) {
        this.claimRequest = claimRequest;
    }

    public String getClaimDate() {
        return claimDate;
    }

    public void setClaimDate(String claimDate) {
        this.claimDate = claimDate;
    }

    public String getClaimStatus() {
        return claimStatus;
    }

    public void setClaimStatus(String claimStatus) {
        this.claimStatus = claimStatus;
    }
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }
    
}
