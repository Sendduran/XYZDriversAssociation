<%-- 
    Document   : userSamplePage
    Created on : Aug 9, 2020, 4:30:27 PM
    Author     : Thailan Sendduran
--%>

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
            if (session.getAttribute("username")==null){
                response.sendRedirect("loginPage.jsp");
            }
         %>
        Hello iam here
        <h1>Hello World!</h1>
    </body>
</html>
