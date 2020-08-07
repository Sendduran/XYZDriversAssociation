<%-- 
    Document   : loginPage
    Created on : Aug 7, 2020, 3:15:09 PM
    Author     : Thailan Sendduran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>`
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="<%=request.getContextPath() %>/loginController" method="post">
            <table border="0">                
                <tbody>
                    <tr>
                        <td>Username</td>
                        <td>
                            <input type="text" name="username" value="" />
                        </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td>
                            <input type="password" name="password" value="" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="Login" />

        </form>
        
    </body>
</html>
