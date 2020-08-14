<%-- 
    Document   : userHomePage
    Created on : Aug 7, 2020, 7:28:03 PM
    Author     : Thailan Sendduran
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        try {
            if (session.getAttribute("username")==null){            
            response.sendRedirect("loginPage.jsp");            
            }
            else{
            String username = session.getAttribute("username").toString();
            String userId = session.getAttribute("userId").toString();
        %>

         
          
        
                 
        
      
        <h1>Hello World!</h1>
        Welcome <%=username + Integer.parseInt(userId)%>
        <a href="userSamplePage.jsp">sample page</a>
        
        <form action="<%=request.getContextPath() %>/logoutController">
            <input type="submit" value='Logout'>
        </form>
        <%    
        }
            
        } catch (NullPointerException e) {
            response.sendRedirect("loginPage.jsp");            
        }    
        %>
    </body>
</html>
