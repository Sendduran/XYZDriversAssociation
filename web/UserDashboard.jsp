<%-- 
    Document   : UserDashboard
    Created on : Aug 14, 2020, 5:56:50 PM
    Author     : Azka
--%>

<%@page import="com.xyzdriversassociation.controller.UserFunction"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.xyzdriversassociation.controller.DatabaseConnection"%>
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
    <title>User Dashboard</title>
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
              <a href="#" class="navbar-brand text-white d-block mx-auto text-center py-3 mb-4 bottom-border">XYZDriversAssociation</a>
              <div class="bottom-border pb-3">
                <img src="images/admin.jpeg" width="50" class="rounded-circle mr-3">
                <a href="#" class="text-white">USER</a>
              </div>
              <ul class="navbar-nav flex-column mt-4">
                <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 current"><i class="fas fa-home text-light fa-lg mr-3"></i>Dashboard</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-user text-light fa-lg mr-3"></i>Profile</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-envelope text-light fa-lg mr-3"></i>Inbox</a></li>
              
              </ul>
            </div>
            <!-- end of sidebar -->

            <!-- top-nav -->
            <div class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-dark fixed-top py-2 top-navbar">
              <div class="row align-items-center">
                <div class="col-md-4">
                  <h4 class="text-light text-uppercase mb-0"><b><i>-User Dashboard-</i></b></h4>
                </div>
                <div class="col-md-5">
                 
                </div>
                <div class="col-md-3">
                  <ul class="navbar-nav">                   
                    <li class="nav-item ml-md-auto">
                        <form action="<%=request.getContextPath() %>/logoutController">
                    <input type="submit" value='Logout'>
                    </form>
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
    <div class="modal fade" id="sign-out">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Want to leave?</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            Press logout to leave
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">Stay Here</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal">Logout</button>
          </div>
        </div>
      </div>
    </div>
    <!-- end of modal -->

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
                        <h5>Total Claims & Outstanding Balance</h5>
                
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
                        <h5>Claim Description</h5>
                      
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
                        <h5>Transaction History</h5>
                      
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
                        <h5>Claim Status</h5>
                        
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
                <h3 class="text-muted text-center mb-3"><i>Total Claims & <br> Outstanding balance</i></h3>
                <table class="table table-striped bg-light text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>#</th>
                      <th>Name</th>
                      <th>Salary</th>

                      <th>Contact</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th>1</th>
                      <td>John</td>
                      <td>$2000</td>
                    
                      <td><button type="button" class="btn btn-info btn-sm">Message</button></td>
                  </tbody>
                </table>

               
                
                <!-- end of - SEARCH MEMBERS -->


             <!-- table 02- NEWLY REGISTERED MEMBERS -->
              </div>

              
              <div class="col-xl-6 col-12">
                <h3 class="text-muted text-center mb-3"><i>Claims Description</i></h3>
                 
                <!-- Default form subscription -->
                   <form class="text-center border border-light p-5" action="#!">

                    <p class="h4 mb-4">Fill the form and submit us.</p>                   

                    <!-- Email -->
                    
                     <textarea id="w3review" name="w3review" rows="4" cols="55" placeholder="Claim Description"></textarea>
					 <br><br>
                    <!-- Name -->
                   <input type="text" id="defaultSubscriptionFormPassword" class="form-control mb-4" placeholder="Amount">
                    <!-- Sign in button -->
                    <button class="btn btn-info btn-block" type="submit">Send Claim Request</button>
                   </form>
                  </div>

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
                <h3 class="text-muted text-center mb-3"><i>Transaction History</i></h3>
                
                <table class="table table-striped bg-light text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>Payment ID</th>
                      <th>Payment Type</th>
                      <th>Payment Date</th>
                      <th>Amount</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                     <%
                                        
                  String userID = session.getAttribute("userId").toString();                    
                  UserFunction userFunction = new UserFunction();
                  ResultSet rs = userFunction.transactionHistory(Integer.parseInt(userID));
                   
     while(rs.next()){ %>
                    <tr>
                      <td><%=rs.getInt("PAYMENT_ID")%></td>
                      <td><%=rs.getString("PAYMENT_TYPE")%></td>
                      <td><%=rs.getString("PAYMENT_DATE")%></td>
                      <td><%=rs.getDouble("AMOUNT")%></td>
                                              
                    </tr>
                  </tbody>
                  <%
                      }
                  %>
                </table>
                  <%
                    rs.close();

                  %>
                 
 
 
                <!-- table 04- Annual turnover -->
              </div>
              <div class="col-xl-6 col-12">
                <h3 class="text-muted text-center mb-3"><i>Claim Status</i></h3>

                <table class="table table-dark table-hover text-center">
                  <thead>
                    <tr class="text-muted">
                      <th>ClaimID</th>
                      <th>ClaimRequest</th>
                      <th>ClaimDate</th>
                      <th>ClaimAmount</th> 
                      <th>ClaimStatus</th>
                      
                    </tr>
                  </thead>
                  <tbody>
             <%
                                        
                  userID = session.getAttribute("userId").toString();                    
                  userFunction = new UserFunction();
                  rs = userFunction.claimHistory(Integer.parseInt(userID));
                   
     while(rs.next()){ %>
                    <tr>
                      <td><%=rs.getInt("CLAIM_ID")%></td>
                      <td><%=rs.getString("CLAIM_REQ")%></td>
                      <td><%=rs.getString("CLAIM_DATE")%></td>
                      <td><%=rs.getDouble("CLAIM_AMOUNT")%></td>
                      <td><%=rs.getString("CLAIM_STATUS")%></td>                          
                    </tr>
                  </tbody>
                  <%
                      }
                  %>
                </table>
                  <%
                    rs.close();

                  %>
                 
                     <br></br>

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












