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
public class UserDetails {
    
    String firstName;
    String lastName;
    Date dob;
    Date doc;
    boolean accountStatus;

    public UserDetails(String firstName, String lastName, Date dob, Date doc, boolean accountStatus) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dob = dob;
        this.doc = doc;
        this.accountStatus = accountStatus;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getDoc() {
        return doc;
    }

    public void setDoc(Date doc) {
        this.doc = doc;
    }

    public boolean isAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(boolean accountStatus) {
        this.accountStatus = accountStatus;
    }
    
    
    
    
    
}
