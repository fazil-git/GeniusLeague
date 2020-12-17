<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error-handler.jsp" %>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<head>
<title>Genius League</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: lightseagreen">
			<div>
				<a href="<%=request.getContextPath()%>" class="navbar-brand"> Genius League </a>
			</div>

			<ul class="navbar-nav">
				<li class="nav-item active">
        			<a class="nav-link" href="<%=request.getContextPath()%>">Home <span class="sr-only">(current)</span></a> </li>
        		<li class="nav-item active">
       		 		<a class="nav-link" href="leaderBoard">LeaderBoard <span class="sr-only">(current)</span></a> </li>
       		 	<li class="nav-item active">
	       		 		<a class="nav-link" href="#">About <span class="sr-only">(current)</span></a> </li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="login" method="post">
					<h2>User Login</h2>
				<fieldset class="form-group">
					<label>User ID:</label> 
					<input type="text"
						class="form-control"
						name="userid" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Password:</label> 
					<input type="password"
						class="form-control"
						name="password" required="required">
				</fieldset>
				<c:if test="${incorrectCredentials ne null }">
					<label style="color:red">${incorrectCredentials }</label><br>
				</c:if>
				<button type="submit" class="btn btn-success">Login</button>
				<a class="btn btn-link" href="#">Forgot password?</a>
				<a class="btn btn-info float-right" style="background-color: lightseagreen"
					 href="signup.jsp">Create a New Account</a>
				</form>
			</div>
		</div>
	</div>
	<%
	if(session.getAttribute("userid")!=null)
		session.invalidate();
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	response.setHeader("Expires", "0");  //proxy server
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	%>
</body>
</html>