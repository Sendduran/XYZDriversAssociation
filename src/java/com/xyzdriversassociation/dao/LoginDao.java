/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.dao;

import com.xyzdriversassociation.controller.DatabaseConnection;
import com.xyzdriversassociation.model.Admin;
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
public class LoginDao {
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.getConnection();  
    Statement stmt;
    PreparedStatement prestmt;
    ResultSet rs;
    
    public String authenticate(UserDetails userdetails){
        try {
            String query = "SELECT * FROM USERS WHERE USERNAME = ? and PASSWORD = ?";             
            prestmt = con.prepareStatement(query);
            
            prestmt.setString(1, userdetails.getUserName());
            prestmt.setString(2, userdetails.getPassword());
            
            rs = prestmt.executeQuery();
            
            if (rs.next()){
                return "true";
            }
            else {
                return "false";
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "error";
    }
    
    public String adminAuthenticate(Admin admin){
        try {
            String query = "SELECT * FROM ADMIN WHERE USERNAME = ? and PASSWORD = ?";             
            prestmt = con.prepareStatement(query);
            
            
            prestmt.setString(1, admin.getUsername());
            prestmt.setString(2, admin.getPassword());
            
            rs = prestmt.executeQuery();
            
            if (rs.next()){
                return "true";
            }
            else {
                return "false";
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "error";
    }
        
    }

