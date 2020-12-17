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
<title>Genius League</title>
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
				<a href="<%=request.getContextPath()%>" class="navbar-brand"> Genius League </a>
			</div>
			
			<ul class="navbar-nav">
				<li class="nav-item active">
        			<a class="nav-link" href="<%=request.getContextPath()%>/welcome.jsp">Home <span class="sr-only">(current)</span></a> </li>
        		<li class="nav-item active">
       		 		<a class="nav-link" href="leaderBoard">LeaderBoard <span class="sr-only">(current)</span></a> </li>
       		 	<li class="nav-item active">
	       		 		<a class="nav-link" href="<%=request.getContextPath()%>/about">About <span class="sr-only">(current)</span></a> </li>
			</ul>
			<ul class="navbar-nav ml-auto">
		      <li class="nav-item active dropdown show">
		      		<i class="fa fa-user-circle-o" style="font-size:48px;color:red"></i>
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
						Submitted Successfully
					</h2>
					<label class="font-weight-bold">Your score : ${user.score }</label><br><br><br>
					<c:if test="${user.score lt 5 }">
							<label class="font" style="color:blue">Try again, you can do it!</label><br>
							<label class="font-italic" >Never Give Up!</label><br>
							</c:if>
							<br><br>
						<button type="submit" class="btn btn-success">Take Quiz Again</button>
						<a type="button" href="<%=request.getContextPath()%>/logout" class="btn btn-outline-danger float-right">logout</a>
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