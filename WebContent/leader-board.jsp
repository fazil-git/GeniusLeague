<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error-handler.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Leader Board</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: lightseagreen">
			<div>
				<a id="index" href="<%=request.getContextPath()%>/index.jsp" class="navbar-brand"> Genius League </a>
			</div>
			<ul class="navbar-nav">
				<li class="nav-item active">
        			<a class="nav-link" href="<%=request.getContextPath()%>/welcome.jsp">Home <span class="sr-only">(current)</span></a> </li>
        		<li class="nav-item active">
       		 		<a class="nav-link" href="<%=request.getContextPath()%>/leaderBoard" onclick="link.href=">LeaderBoard <span class="sr-only">(current)</span></a> </li>
       		 	<li class="nav-item active">
	       		 		<a class="nav-link" href="#">About <span class="sr-only">(current)</span></a> </li>
			</ul>
			<c:if test="${userid ne null}">
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
			    <script>
					var xhr = new XMLHttpRequest();
					document.getElementById('index').onclick = function changeContent() {
						xhr.open('GET', '${pageContext.request.contextPath}/logout', true);
					    xhr.send(null);
					}
					$(document).ready(function() {
					    $('.dropdown-toggle').dropdown()
					});
				</script>
		    </c:if>
		</nav>
	</header>
	<br>
	
	<div class="row">
		<div class="container">
			<h3 class="text-center">Leader Board List</h3>
			<hr>
			<br>
			<table class="table table-bordered table-striped text-center">
				<thead>
					<tr>
						<th>Rank</th>
						<th>Name</th>
						<th>Score</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${LeaderBoardList}">

						<tr>
							<td>#<c:out value="${user.number}"/></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.score}" /> 
									<c:if test="${user.score le 1  }">point</c:if>
									<c:if test="${user.score gt 1 }">points</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</body>
</html>