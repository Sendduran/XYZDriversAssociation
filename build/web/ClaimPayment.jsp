<%-- 
    Document   : ClaimPayment
    Created on : Aug 22, 2020, 6:50:33 PM
    Author     : Azka Naheem
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.xyzdriversassociation.dao.UserFunctionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="Style/ClaimPayment.css">

</head>
<body>
        <% 
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        try {
            if (session.getAttribute("username")==null){            
            response.sendRedirect("loginPage.jsp");            
            }
            else{
            String username = session.getAttribute("username").toString();
            String userId = session.getAttribute("userId").toString();
        %>
        <% 
        String userID = session.getAttribute("userId").toString();                    
        UserFunctionDAO userFunction = new UserFunctionDAO();
        ResultSet rs;
        %>

<h2>Claim Payment</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
        <form action="<%=request.getContextPath()%>/paymentServlet" method="post">      
        <div class="row">
          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>                 
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
              <%
               int claimId = Integer.parseInt(request.getParameter("ClaimId"));
               rs = userFunction.getClaimAmount(Integer.parseInt(userId), claimId);
               while(rs.next()){
              %>  
              <div class="row">
            <div class="col-50">
                <label for="cvv">Amount</label>
                <input type="number" id="cvv" name="amount" value="<%=rs.getDouble("CLAIM_AMOUNT")%>">
            </div>
            <div class="col-50">
                <label for="cvv">Claim ID</label>
                <input type="text" id="cvv" name="claimId" value="<%=claimId%>">
            </div>
            </div>
            <%
            }
            rs.close();
            %>
            </div>
          </div>          
        </div>
        <input type="submit" value="Make Payment" class="btn">
        </form>
      </div>
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
