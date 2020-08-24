/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/
package com.xyzdriversassociation.dao;

import com.xyzdriversassociation.controller.DatabaseConnection;
import com.xyzdriversassociation.model.UserDetails;
import java.sql.Connection;
import java.sql.Date;
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
public class UserDao {
    DatabaseConnection db = new DatabaseConnection();
    Connection con = db.getConnection();  
    Statement stmt;
    PreparedStatement prestmt;
    ResultSet rs;
    
    public int RegisterUser(UserDetails userDetails){
        int result = 0;
        try {
            String query = "INSERT INTO USERS"+"(USERNAME,PASSWORD,FIRSTNAME,LASTNAME,DOB,DOC,STATUS)VALUES"+" (?,?,?,?,?,?,?)";
            
            prestmt = con.prepareStatement(query);            
            prestmt.setString(1, userDetails.getUserName());
            prestmt.setString(2,userDetails.getPassword());
            prestmt.setString(3,userDetails.getFirstName());
            prestmt.setString(4,userDetails.getLastName());
            prestmt.setString(5,userDetails.getDob());
            prestmt.setDate(6, userDetails.getDoc());
            prestmt.setString(7, userDetails.getAccountStatus());
            
            result = prestmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    } 
    
    
}
