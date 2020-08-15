/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thailan Sendduran
 */
public class DatabaseConnection {
    Connection con;

    public Connection getConnection(){
        
        try {           
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/XYZDriversAssociation","user1","user1");
           
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
         return con;
        
    }
}
