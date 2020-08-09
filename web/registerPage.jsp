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
<body background='images/pic1.jpg'>
    <div class="loginbox" style="height: 530px">
        
    <img src="images/loginuser.jpg" class="avatar">
        <h1>Register Here</h1>
        <form action="<%=request.getContextPath() %>/userController" method="post">
            <p>Firstname</p>
            <input type="text" name="firstName" placeholder="Enter Firstname">
			<p>Lasstname</p>
            <input type="text" name="lastName" placeholder="Enter Lastname">
			<p>Username</p>
            <input type="text" name="userName" placeholder="Enter Username">
			<p>Date of Birth</p>
            <input type="date" name="dob" placeholder="Enter date of birth">            
            <input type="submit" value="Register" name="submit">            
            <a href="loginPage.jsp">Already have an account?</a>
        </form>
        
    </div>

</body>
</html>
