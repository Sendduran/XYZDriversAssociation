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

/**
 *
 * @author Thailan Sendduran
 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {

private LoginDao loginDao = new LoginDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
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
        
         UserDetails userDetails = new UserDetails();  
         userDetails.setUserName(username);
         userDetails.setPassword(password);
//         System.out.print(username + password);
        
         String status = loginDao.authenticate(userDetails);
         
         if (status.equals("true")){
             response.sendRedirect("userHomePage.jsp");
         }
         else if (status.equals("false")){
             response.sendRedirect("loginPage.jsp?status=false");
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
