<%-- 
    Document   : update
    Created on : Aug 21, 2020, 9:34:09 AM
    Author     : Thailan Sendduran
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.xyzdriversassociation.dao.adminFunctionDAO"%>
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
            response.sendRedirect("adminLoginPage.jsp");            
            }
            else{
            String username = session.getAttribute("username").toString();
            String adminId = session.getAttribute("userId").toString();
        %>
        <% 
        String adminID = session.getAttribute("userId").toString();                    
        adminFunctionDAO adminFunction = new adminFunctionDAO();
        ResultSet rs;
        %>
<link rel="stylesheet" type="text/css" href="Style/updateStyle.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container register-form">
            <div class="form">
                <div class="note">
                    <%
                    String userID = request.getParameter("id");
                    rs = adminFunction.userDetails(Integer.parseInt(userID));
                    while (rs.next()){                    
                    %>
                    <p>Update user details here:</p>
                </div>
                <form action="<%=request.getContextPath()%>/updateUserStatus" method="post">
                <div class="form-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="userId" class="form-control" placeholder="userId" value="<%=rs.getString("USER_ID")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username" value="<%=rs.getString("USERNAME")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Firstname" value="<%=rs.getString("FIRSTNAME")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="DOB" value="<%=rs.getString("DOB")%>"/>
                            </div>          
                            <div class="form-group">
                                <select name="status">
                                    <option>Normal</option>
                                    <option>Member</option>
                                    <option>Blocked</option>
                                </select>                               
                            </div>   
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Password" value="<%=rs.getString("PASSWORD")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Lastname" value="<%=rs.getString("LASTNAME")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="DOR" value="<%=rs.getString("DOC")%>"/>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                    <button type="submit" class="btnSubmit">Submit</button>
                </div>
                    </form>
            </div>
        </div>
               <%    
        }
            
        } catch (NullPointerException e) {
            response.sendRedirect("loginPage.jsp");            
        }    
        %>
    </body>
</html>
