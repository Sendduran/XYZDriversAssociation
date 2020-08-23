/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.dao;

import com.xyzdriversassociation.controller.DatabaseConnection;
import com.xyzdriversassociation.model.Claims;
import com.xyzdriversassociation.model.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thailan Sendduran
 */
public class adminFunctionDAO {
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.getConnection();
    Statement stmt;
    PreparedStatement prestmt;
    ResultSet rs; 
    
    public ResultSet getNormalMember(){
        try {          
            
        String query = "SELECT * FROM USERS WHERE STATUS = 'Normal'";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
            
        return rs;
    }
    
    public ResultSet userDetails(int userId){
        try {
            String query = "SELECT * FROM USERS WHERE USER_ID="+ userId;
            stmt = con.createStatement();
            rs=stmt.executeQuery(query);
        } catch (SQLException ex) {
                        Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return rs;
    }
    
    public int updateAccountStatus(UserDetails userDetails){
        int result = 0;
        try {
            String query = "UPDATE USERS SET STATUS = '"+userDetails.getAccountStatus()+"' WHERE USER_ID ="+userDetails.getUser_id();
            stmt = con.createStatement();
            result = stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public ResultSet pendingClaims(){
        try {          
            
        String query = "SELECT * FROM CLAIMS WHERE CLAIM_STATUS = 'PNDG'";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException ex) {
            Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
            
        return rs;
    }
    
    
    public ResultSet approveClaim(int userId,int claimId){        
        try{                 
        String query = "SELECT * FROM CLAIMS WHERE USER_ID="+ userId+"AND CLAIM_ID="+claimId;
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        }
        catch(SQLException ex){
        Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return rs;
    }
    
    public int updateClaimStatus(Claims claim){
        int result = 0;
        try{                 
        String query = "UPDATE CLAIMS SET CLAIM_STATUS = 'APRV' WHERE USER_ID ="+ claim.getUserId() +"AND CLAIM_ID="+ claim.getClaimId();
            stmt = con.createStatement();
            result = stmt.executeUpdate(query);
        }
        catch(SQLException ex){
        Logger.getLogger(adminFunctionDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
        
    }
}
