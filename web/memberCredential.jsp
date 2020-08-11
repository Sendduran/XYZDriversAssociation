<%-- 
    Document   : memberCredential.jsp
    Created on : Aug 10, 2020, 1:08:05 PM
    Author     : Thailan Sendduran
--%>


<%@page import="com.xyzdriversassociation.model.UserDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="Style/loginStyle.css">
    </head>
    <body  style="background: url('images/credential.jpeg')">
        <div class="loginbox" style="width: 700px; height: 250px">
    <img src="images/loginuser.jpg" class="avatar">
    
    <%
        UserDetails ud = new UserDetails();
    %>
    
        <h1>Login Credentials</h1>        
            <p>Username</p>
            <br>
            <p>            
            </p>
            <br>
            <p>Password</p>
            <br>
            <p></p>
            <br>
    </div>
</body>
</html>
