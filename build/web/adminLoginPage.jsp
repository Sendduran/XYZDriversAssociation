<%-- 
    Document   : adminLoginPage
    Created on : Aug 9, 2020, 11:39:23 AM
    Author     : Thailan Sendduran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="Style/loginStyle.css">
    </head>
<body style="background:url('images/adminBack.jpg')">
    <div class="loginbox" style="background: #4d4d4d; height: 350px">
    <img src="images/adminLogin.jpg" class="avatar">
        <h1>Admin Login</h1>
        
        <form action="<%=request.getContextPath() %>/adminLoginController" method="post">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password">
            <input type="submit" name="" value="Login">            
        </form>
        
    </div>

</body>
</html>
