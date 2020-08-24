/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.dao;

import com.xyzdriversassociation.controller.DatabaseConnection;
import com.xyzdriversassociation.model.Claims;
import com.xyzdriversassociation.model.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hp
 */
public class UserFunctionDAO {
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.getConnection();
    Statement stmt;
    PreparedStatement prestmt;
    ResultSet rs;                   
                                      
                        
                
     public ResultSet claimHistory(int userId){
        try {
            String query = "SELECT * FROM CLAIMS WHERE USER_ID="+userId;            
            stmt = con.createStatement();                
            rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;          
     }
     
     public ResultSet transactionHistory(int userId){
        try {
            String query = "SELECT * FROM PAYMENT WHERE USER_ID="+userId;
            
            stmt = con.createStatement();                
            rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;          
     }
     
     public String userFullName(int userId){
         String fullName ;
         try{
            String query="SELECT FIRSTNAME,LASTNAME FROM USERS WHERE USER_ID ="+ userId;
            stmt = con.createStatement();                
            rs = stmt.executeQuery(query);    
            while(rs.next()){
            fullName =  rs.getString("FIRSTNAME") +" "+ rs.getString("LASTNAME");
            return fullName;              
            }
           
                    
         }
         catch(SQLException ex){
             Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         fullName = "User";
         return fullName;
     }
     
     public int makeClaim(Claims claim) throws SQLException{
         int result = 0;
         String query = "INSERT INTO CLAIMS (USER_ID,CLAIM_REQ,CLAIM_DATE,CLAIM_STATUS,CLAIM_AMOUNT)VALUES(?,?,?,?,?)";
         prestmt = con.prepareStatement(query);
         prestmt.setInt(1, claim.getUserId());
         prestmt.setString(2,claim.getClaimRequest());
         prestmt.setString(3, claim.getClaimDate());
         prestmt.setString(4, claim.getClaimStatus());
         prestmt.setDouble(5, claim.getAmount());
         
         result = prestmt.executeUpdate();         
         
         return result;
    }
     
     public ResultSet getOutstandingClaim(int userId){
        try {             
        String query="SELECT CLAIM_ID,CLAIM_DATE,(CLAIM_AMOUNT * 25/100) as CLAIM_AMOUNT FROM CLAIMS WHERE CLAIM_STATUS = 'APRV' AND USER_ID="+userId;
        stmt = con.createStatement();                
        rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         
         
         
         return rs;
     }
     
     public ResultSet getClaimAmount(int userId, int claimId){
       try {             
        String query="SELECT (CLAIM_AMOUNT*25/100) as CLAIM_AMOUNT FROM CLAIMS WHERE  USER_ID="+userId+"AND CLAIM_ID = "+claimId;
        stmt = con.createStatement();                
        rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }         
         return rs;  
     }
     
     public int changeClaimStatus(Claims claim){
         int result =0;
         try {
         String query = "UPDATE CLAIMS SET CLAIM_STATUS = 'PAID' WHERE CLAIM_ID ="+claim.getClaimId();        
         stmt = con.createStatement();
         result = stmt.executeUpdate(query);         
        
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
     }
     
     public int makePayment(Payment payment){
         int result =0;
         try {
         String query = "INSERT INTO PAYMENT (USER_ID,PAYMENT_TYPE,PAYMENT_DATE,AMOUNT) VALUES (?,?,?,?)";        
         prestmt = con.prepareStatement(query);
         prestmt.setInt(1, payment.getUserId());
         prestmt.setString(2,payment.getPaymentType());
         prestmt.setString(3, payment.getPaymentDate());
         prestmt.setDouble(4, payment.getAmount());
         
         result = prestmt.executeUpdate();
         return result;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
     }
     
     
     
     public boolean checkRegisterPeriod(){
         boolean isValid = false;
          try {             
            String query="SELECT * FROM USERS WHERE DATEDIFF(m,DOC,GetDate())< 6";
            stmt = con.createStatement();                
            int result = stmt.executeUpdate(query);
            if (result > 0){
                isValid = true;
                return isValid;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }         
         
         return isValid;
     }
     
     public String checkStatus(int userId){
        String status="";
        try {             
        String query="SELECT STATUS FROM USERS WHERE  USER_ID="+userId;
        stmt = con.createStatement();                
        rs = stmt.executeQuery(query);
        while(rs.next()){
        status = rs.getString("STATUS");
        }            
        return status;
        } catch (SQLException ex) {
            Logger.getLogger(UserFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }         
        return status; 
     }
}