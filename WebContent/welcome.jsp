<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error-handler.jsp" %>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<title>Welcome!</title>
</head>
<body>
	
	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");  //proxy server
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		
		if(session.getAttribute("userid")==null)
			response.sendRedirect("index.jsp");
	%>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: lightseagreen">
			<div>
				<a id="index" href="<%=request.getContextPath()%>" class="navbar-brand"> Genius League </a>
			</div>
				<ul class="navbar-nav">
					<li class="nav-item active">
	        			<a class="nav-link" href="<%=request.getContextPath()%>/welcome.jsp">Home <span class="sr-only">(current)</span></a> </li>
	        		<li class="nav-item active">
	       		 		<a class="nav-link" href="<%=request.getContextPath()%>/leaderBoard">LeaderBoard <span class="sr-only">(current)</span></a> </li>
	       		 	<li class="nav-item active">
	       		 		<a class="nav-link" href="#">About <span class="sr-only">(current)</span></a> </li>
				</ul>
				<ul class="navbar-nav ml-auto">
		      <li class="nav-item active dropdown show">
       		 		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          ${user.name}
			        </a>
			        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
			          <a class="dropdown-item" href="<%=request.getContextPath()%>/profile.jsp">Profile</a>
			          <a class="dropdown-item" href="#">About</a>
			          <div class="dropdown-divider"></div>
			          <a class="dropdown-item" style="color:red" href="<%=request.getContextPath()%>/logout">Logout</a>
			        </div>
				</li>
		    </ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="taketest">
					<h2>
						Welcome ${user.name}
					</h2>
					<label class="font-weight-bold">About the test:</label>
					 <p>1. This test contains 10 multiple choice questions.<br>
						2. Each question carries 1 point.<br>
						3. For right answers 1 point will be given.<br>
						4. Unanswered and wrong answered questions will be given 0 point.<br>
						5. No negative marks. But try to answer all the questions.<br>
						</p>
						<label class="font-italic">Give it a shot!</label>
						 <div class="form-check">
						    <input type="checkbox" class="form-check-input" required="required">
						    <label class="form-check-label">I am ready to take the quiz!</label><br><br>
						  </div>
					<button type="submit" class="btn btn-success">Proceed</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	var xhr = new XMLHttpRequest();
	document.getElementById('index').onclick = function changeContent() {
		xhr.open('GET', '${pageContext.request.contextPath}/logout', true);
	    xhr.send(null);
	}
	</script>
	<script>
	$(document).ready(function() {
	    $('.dropdown-toggle').dropdown()
	});	
	</script>
</body>
</html>