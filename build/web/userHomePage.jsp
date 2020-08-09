<%-- 
    Document   : userHomePage
    Created on : Aug 7, 2020, 7:28:03 PM
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
        String data = session.getAttribute("username").toString();
        %>
        <h1>Hello World!</h1>
        Welcome <%= data %>
    </body>
</html>
