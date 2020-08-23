<%-- 
    Document   : ApproveClaim
    Created on : Aug 21, 2020, 2:53:13 PM
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
                    String claimID = request.getParameter("cid");
                    rs = adminFunction.approveClaim(Integer.parseInt(userID),Integer.parseInt(claimID));
                    while (rs.next()){                    
                    %>
                    <p>Update Claim details here:</p>
                </div>
                <form action="<%=request.getContextPath()%>/updateClaimStatus" method="post">
                <div class="form-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="claimId" class="form-control" value="<%=rs.getInt("CLAIM_ID")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" value="<%=rs.getString("CLAIM_REQ")%>"/>
                            </div>
      
                            <div class="form-group">
                                <select name="claimStatus">
                                    <option>PNDG</option>
                                    <option>APRV</option>
                                    <option>RJCT</option>
                                </select>                               
                            </div>   
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="userId"class="form-control" value="<%=rs.getInt("USER_ID")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" value="<%=rs.getString("CLAIM_DATE")%>"/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" value="<%=rs.getDouble("CLAIM_AMOUNT")%>"/>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    rs.close();
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
