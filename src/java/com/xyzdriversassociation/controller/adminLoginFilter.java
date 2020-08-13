/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.xyzdriversassociation.controller;

import com.xyzdriversassociation.dao.LoginDao;
import com.xyzdriversassociation.model.Admin;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thailan Sendduran
 */
public class adminLoginFilter implements Filter {
    
    private static final boolean debug = true;
    private LoginDao loginDao = new LoginDao();
    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public adminLoginFilter() {
    }    
       
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        
        
         Admin admin = new Admin();  
         admin.setUsername(username);
         admin.setPassword(password);
         
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String status = loginDao.adminAuthenticate(admin);
         
         if (status.equals("true")){
            HttpSession session = req.getSession();               
            session.setAttribute("username",username);
            chain.doFilter(request, response);
                         
         }
         else if (status.equals("false")){
             res.sendRedirect("adminLoginPage.jsp?status=false");
         }
         else {
             res.sendRedirect("loginPage.jsp?status=error");
        } 
       
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

   
    public void destroy() {        
    }

    
    public void init(FilterConfig filterConfig) {        
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {                
                
            }
        }
    }

   
    
    
}
