/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.UserFunctionDAO;
import com.xyzdriversassociation.model.Claims;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thailan Sendduran
 */
public class claimRequest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            String userId = session.getAttribute("userId").toString();
            String claimDescription = request.getParameter("claimDescription");
            Double amount = Double.parseDouble(request.getParameter("amount"));
            
            
            Claims claims = new Claims();
            claims.setUserId(Integer.parseInt(userId));
            claims.setClaimRequest(claimDescription);
            claims.setClaimDate(today());
            claims.setClaimStatus("PNDG");
            claims.setAmount(amount);
            
            UserFunctionDAO userFunction = new UserFunctionDAO();   
            userFunction.makeClaim(claims);
            
            RequestDispatcher rd = request.getRequestDispatcher("UserDashboard.jsp");
            rd.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(claimRequest.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
    private String today(){
        Date today = new Date();
        SimpleDateFormat dateForamater = new SimpleDateFormat("yyyy-MM-dd");
        String dateToday = dateForamater.format(today);
        return dateToday;
    }

}
