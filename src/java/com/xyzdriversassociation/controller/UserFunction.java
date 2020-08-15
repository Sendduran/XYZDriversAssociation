/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

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
public class UserFunction {
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
            Logger.getLogger(UserFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;          
     }
     
     public ResultSet transactionHistory(int userId){
        try {
            String query = "SELECT * FROM PAYMENT WHERE USER_ID="+userId;
            
            stmt = con.createStatement();                
            rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(UserFunction.class.getName()).log(Level.SEVERE, null, ex);
        }
         return rs;          
     }     
}