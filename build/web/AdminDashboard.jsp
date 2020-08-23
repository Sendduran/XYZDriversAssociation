<%-- 
    Document   : AdminDashboard
    Created on : Aug 14, 2020, 5:55:20 PM
    Author     : Azka
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.xyzdriversassociation.dao.adminFunctionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="title icon" href="images/title-img.png">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="Style/dashboardstyle.css">
    <title>Admin Dashboard</title>
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
    
    <!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
      <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#myNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNavbar">
        <div class="container-fluid">
          <div class="row">
            <!-- sidebar -->
            <div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top">
              <a href="#" class="navbar-brand text-white d-block mx-auto text-center py-3 mb-4 bottom-border"><b>XYZDriversAssociation</b></a>
              <div class="bottom-border pb-3">
                <img src="images/admin.jpeg" width="50" class="rounded-circle mr-3">
                <a href="#" class="text-white"><%=username%></a>
              </div>
              <ul class="navbar-nav flex-column mt-4">
                <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 current"><i class="fas fa-home text-light fa-lg mr-3"></i>Dashboard</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-user text-light fa-lg mr-3"></i>Profile</a></li>
                <li class="nav-item"><a href="AnnualTurnOver.jsp" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-envelope text-light fa-lg mr-3"></i>Generate Report</a></li>
              
              </ul>
            </div>
            <!-- end of sidebar -->

            <!-- top-nav -->
            <div class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-dark fixed-top py-2 top-navbar">
              <div class="row align-items-center">
                <div class="col-md-4">
                  <h4 class="text-light text-uppercase mb-0"><b><i>-Admin Dashboard-</i></b></h4>
                </div>
                <div class="col-md-5">
                 
                </div>
                <div class="col-md-3">
                  <ul class="navbar-nav">
                      <li class="nav-item ml-md-auto">
                          <form action="<%=request.getContextPath() %>/adminLogoutController">
                    <input type="submit" value='Logout'>
                      </li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- end of top-nav -->
          </div>
        </div>
      </div>
    </nav>
    <!-- end of navbar -->

    <!-- modal -->
    
    <!-- end of modal -->

    <!-- cards -->
    <section>
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row pt-md-5 mt-md-3 mb-5">
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-shopping-cart fa-3x text-warning"></i>
                      <div class="text-right text-secondary">
                        <h5>Search Members</h5>
                
                      </div>
                    </div>
                  </div>                 
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-money-bill-alt fa-3x text-success"></i>
                      <div class="text-right text-secondary">
                        <h5>Newly Registered Members</h5>
                      
                      </div>
                    </div>
                  </div>                 
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-users fa-3x text-info"></i>
                      <div class="text-right text-secondary">
                        <h5>Claim Request<br>(Accepted/Declined)</h5>
                      
                      </div>
                    </div>
                  </div>                  
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 p-2">
                <div class="card card-common">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <i class="fas fa-chart-line fa-3x text-danger"></i>
                      <div class="text-right text-secondary">
                        <h5>Annual TurnOver</h5>
                        
                      </div>
                    </div>
                  </div>                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of cards -->

    <!-- tables -->

     <!-- table 01_ SEARCH MEMBERS -->

    <section>
      <div class="container-fluid">
        <div class="row mb-5">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row align-items-center">
              <div class="col-xl-6 col-12 mb-4 mb-xl-0">                    
                <h3 class="text-muted text-center mb-3"><i>Search Members</i></h3>
                </form>
                    <form action="<%=request.getContextPath()%>/searchUser">
                    <input type="text" id="defaultSubscriptionFormPassword" class="form-control mb-4" name="search" placeholder="Search" required>
                    <button class="btn btn-info btn-block" type="submit">Search</button>
                    <br>
                    </form>
                <table class="table table-striped bg-light text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>#</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>Status</th>                    
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td></td>
                      <td></td>
                    
                      <td><button type="button" class="btn btn-info btn-sm">Message</button></td>
                  </tbody>
                </table>

               
                
                <!-- end of - SEARCH MEMBERS -->

                      
             <!-- table 02- NEWLY REGISTERED MEMBERS -->
              </div>
              <div class="col-xl-6 col-12">
                <h3 class="text-muted text-center mb-3"><i>Newly Registered Members</i></h3>
                <table class="table table-dark table-hover text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>User Id</th>
                      <th>Username</th>
                      <th>First Name</th>
                      <th>Last Name</th>
                      <th>DOB</th>
                      <th>DOC</th>
                      <th>Status</th>       
                    </tr>
                  </thead>
                  <tbody>
                      <%
                    rs = adminFunction.getNormalMember();                   
                    while(rs.next()){
                        int userID = rs.getInt("USER_ID");
                      %>
                    <tr>
                      <th><%=rs.getInt("USER_ID")%></th>
                      <td><%=rs.getString("USERNAME")%></td>
                      <td><%=rs.getString("FIRSTNAME")%></td>
                      <td><%=rs.getString("LASTNAME")%></td>
                      <td><%=rs.getString("DOB")%></td>
                      <td><%=rs.getString("DOC")%></td>
                      <td><%=rs.getString("STATUS")%></td>
                      <td><a href="update.jsp?id=<%=userID%>"><button type="button" class="btn btn-info btn-sm">update</button></a></td>
                      
                    </tr>
                  </tbody>
                    <%
                      }
                    %>
                </table>
                    <%
                     rs.close();
                    %>

                     <!-- END OF pagination - newly registered  TABLE-->
                 
                 
                     <br></br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>




    <!-- table 03- claim request -->
    <section>
      <div class="container-fluid">
        <div class="row mb-5">
          <div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
            <div class="row align-items-center">
              <div class="col-xl-6 col-12 mb-4 mb-xl-0">
                <h3 class="text-muted text-center mb-3"><i>Pending Claim Requests</i></h3>
                <table class="table table-striped bg-light text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>User ID</th>
                      <th>Date</th>
                      <th>Claim request</th>
                      <th>Amount</th>
                      <th>Approve</th>
                    </tr>
                  </thead>
                      <%
                    rs = adminFunction.pendingClaims();                   
                    while(rs.next()){
                    int userID = rs.getInt("USER_ID");
                    int claimID = rs.getInt("CLAIM_ID");
                      %>                  
                  <tbody>
                    <tr>
                      <th><%=userID%></th>
                      <td><%=rs.getString("CLAIM_DATE")%></td>
                      <td><%=rs.getString("CLAIM_REQ")%></td>
                      <td><%=rs.getDouble("CLAIM_AMOUNT")%></td>
                    
                      <td><a href="ApproveClaim.jsp?id=<%=userID%>&cid=<%=claimID%>"><button type="button" class="btn btn-info btn-sm">Approve</button></a></td>
                  </tbody>
                  <%
                  }
                    rs.close();
                  %>
                </table>
 
 
                <!-- table 04- Annual turnover -->
              </div>
              <div class="col-xl-6 col-12">
                <h3 class="text-muted text-center mb-3"><i>Annual Turnover</i></h3>
                <table class="table table-dark table-hover text-center">
                  <thead>
                    <tr class="text-muted">
                      
                      <th>Total Income</th>
                      <th>Total payout</th>
                      <th>Annual Turnover</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th></th>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>

                     <!-- END OF pagination - newly registered  TABLE-->
                 
                 
                     <br></br>

                     <!-- pagination -->
                 
                <!-- end of pagination -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end of tables -->  

               <%    
        }
            
        } catch (NullPointerException e) {
            response.sendRedirect("loginPage.jsp");            
        }    
        %>
   
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="script01.js"></script>

  </body>
</html>













