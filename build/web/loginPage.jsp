<%-- 
    Document   : loginPage
    Created on : Aug 7, 2020, 3:15:09 PM
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
<body style="background: url('images/pic1.jpg')">
    
    <div class="loginbox">
    <img src="images/loginuser.jpg" class="avatar">
        <h1>Member Login</h1>
        <form action="<%=request.getContextPath() %>/loginController" method="post">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter Username" required>
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" name="" value="Login">            
            <a href="registerPage.jsp">Don't have an account?</a>
        </form>
        
    </div>

</body>
</html>
