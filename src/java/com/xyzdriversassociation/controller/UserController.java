/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.UserDao;
import com.xyzdriversassociation.model.UserDetails;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thailan Sendduran
 */
@WebServlet("/userController")
public class UserController extends HttpServlet {

    private UserDao userDao = new UserDao();
    
    public UserController(){
        super();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/registerPage.jsp");
        dispatcher.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("userName");
        String dob = request.getParameter("dob");        
        
        
        UserDetails userDetails = new UserDetails();        
        userDetails.setFirstName(firstName);
        userDetails.setLastName(lastName);
        userDetails.setUserName(userName);
        userDetails.setDob(dob);
        userDetails.setPassword(randomPassword());
        userDetails.setDoc(today());
        userDetails.setAccountStatus("Normal");
        
        userDao.RegisterUser(userDetails);
        
        response.sendRedirect("loginPage.jsp");
        
               
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private String randomPassword()
    {
        Random rand = new Random();
        String password = "";
        for(int i = 10; i>0; i--)
        {
            int  n =rand.nextInt((126 - 33) + 1) +33;
            password+= (char)n;
        }
        
       return password;
    }
    
    private String today(){
        Date today = new Date();
        SimpleDateFormat dateForamater = new SimpleDateFormat("yyyy-MM-dd");
        String dateToday = dateForamater.format(today);
        return dateToday;
    }
}
