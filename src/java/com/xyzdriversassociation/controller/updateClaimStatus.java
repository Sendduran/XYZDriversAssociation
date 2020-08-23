/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.adminFunctionDAO;
import com.xyzdriversassociation.model.Claims;
import com.xyzdriversassociation.model.UserDetails;
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
public class updateClaimStatus extends HttpServlet {
private adminFunctionDAO adminFunction = new adminFunctionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId =Integer.parseInt(request.getParameter("userId"));
        int claimId =Integer.parseInt(request.getParameter("claimId"));
        String status = request.getParameter("claimStatus");        
       
        
        Claims claim = new Claims();
        claim.setUserId(userId);
       claim.setClaimId(claimId);
       claim.setClaimStatus(status);
        
        adminFunction.updateClaimStatus(claim);
        
        response.sendRedirect("AdminDashboard.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
