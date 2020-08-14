/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.LoginDao;
import com.xyzdriversassociation.model.UserDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thailan Sendduran
 */
//@WebServlet("/loginController")
public class LoginController extends HttpServlet {



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    
            HttpSession session = request.getSession();
            
            if(session.getAttribute("username") != null){            
            response.sendRedirect("UserDashboard.jsp");                
            }
            else{
            response.sendRedirect("loginPage.jsp?status=sessionError");    
            }
 

 
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
