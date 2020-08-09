/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.LoginDao;
import com.xyzdriversassociation.model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thailan Sendduran
 */
public class adminLoginController extends HttpServlet {
    
   private LoginDao loginDao = new LoginDao();



    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
         Admin admin = new Admin();  
         admin.setUsername(username);
         admin.setPassword(password);

        
         String status = loginDao.adminAuthenticate(admin);
         
         if (status.equals("true")){
             response.sendRedirect("userHomePage.jsp");
         }
         else if (status.equals("false")){
             response.sendRedirect("adminLoginPage.jsp?status=false");
         }
         else {
             response.sendRedirect("loginPage.jsp?status=error");
         }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
