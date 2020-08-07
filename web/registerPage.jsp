<%-- 
    Document   : registerPage
    Created on : Aug 7, 2020, 10:03:06 AM
    Author     : Thailan Sendduran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>        
        <form action="<%=request.getContextPath() %>/userController" method="post">
            <table border="0" width="8" cellspacing="5" cellpadding="5">
                <tbody>
                    <tr>
                        <td>Firstname:</td>
                        <td><input type="text" name="firstName"/></td>
                    </tr>
                    <tr>
                        <td>Lastname:</td>
                        <td><input type="text" name="lastName"/></td>
                    </tr>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="userName"/></td>
                    </tr>
                    <tr>
                        <td>Date of Birth:</td>
                        <td><input type="date" name="dob"/></td>
                    </tr>                   
                </tbody>
            </table>
            <input type="submit" value="Register" name="submit"/>
            <input type="reset" value="Reset" name="reset"/>
        </form>
        
    </body>
</html>
