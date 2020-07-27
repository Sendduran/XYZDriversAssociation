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
    String claimRequest;
    Date claimDate;
    boolean claimStatus;

    public Claims(int claimId, String claimRequest, Date claimDate, boolean claimStatus) {
        this.claimId = claimId;
        this.claimRequest = claimRequest;
        this.claimDate = claimDate;
        this.claimStatus = claimStatus;
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

    public Date getClaimDate() {
        return claimDate;
    }

    public void setClaimDate(Date claimDate) {
        this.claimDate = claimDate;
    }

    public boolean isClaimStatus() {
        return claimStatus;
    }

    public void setClaimStatus(boolean claimStatus) {
        this.claimStatus = claimStatus;
    }
    
    
}
