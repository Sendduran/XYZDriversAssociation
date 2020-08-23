/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;

/**
 *
 * @author Thailan Sendduran
 */
public class searchUser extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/XYZDriversAssociationWS/DriverEligibleWS.wsdl")
    private DriverEligibleWS_Service service;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        String search = request.getParameter("search");
        Vector v = new Vector(getUserInfo(search));
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchUser</title>");            
            out.println("</head>");
          
            out.println("<body>");
            Iterator itr = v.listIterator(); 
            while(itr.hasNext()){
                int id = Integer.parseInt(itr.next().toString()); 
            out.print("<table border=1><tr><td>User_id</td><td>UserName</td><td>Password</td><td>Firstname</td><td>Lastname</td></tr>");
            out.println("<tr><td>"+id+"</td><td>"+itr.next()+"</td><td>"+itr.next()+"</td><td>"+itr.next()+"</td><td>"+itr.next()+"</td><td>"+
                     "<a href='update.jsp?id="+id+"'><button type='button' class='btn btn-info btn-sm'>update</button></a>"+"</td></tr>"+"</table>");            
            out.println("</body>");
            out.println("</html>");
            }
        }
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

    private java.util.List<java.lang.Object> getUserInfo(java.lang.String userId) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        com.xyzdriversassociation.controller.DriverEligibleWS port = service.getDriverEligibleWSPort();
        return port.getUserInfo(userId);
    }

}
