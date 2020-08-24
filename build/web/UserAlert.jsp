<%-- 
    Document   : UserAlert
    Created on : Aug 22, 2020, 6:23:06 PM
    Author     : Azka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.xyzdriversassociation.dao.adminFunctionDAO"%>

<!DOCTYPE html>
<html>
    
   <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>User Alert</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,400,700" rel="stylesheet">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="Style/UserAlert.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>Sorry!</h1>
			</div>
                  
				<P>YOUR ACCOUNT HAS BEEN BLOCKED.PLEASE PAY YOUR DUE CLAIM AMOUNT FOR BEING TOUCH WITH US.</P>
			
			<a href="ClaimPayment.jsp">PAY YOUR CLAIM AMOUNT</a>
		</div>
	</div>

</body>

</html>