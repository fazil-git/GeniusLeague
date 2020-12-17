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
<title>Quiz</title>
</head>
<body>

	<%
		response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");  //proxy server
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		
		if(session.getAttribute("secureQuiz")==null){
			response.sendRedirect("welcome.jsp");
		}
		
		if(session.getAttribute("userid")==null )
			response.sendRedirect("index.jsp");

		session.removeAttribute("secureQuiz");
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
	<div class="container-fluid">

	<form action="quizSubmit" method="post">
	    <c:forEach var="quiz" items="${quizlist}">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h3>Q${quiz.number }. ${quiz.question }</h3>
		            </div>
		            <div class="modal-body">
		                <div class="col-xs-3 5"> </div>
		                <div class="quiz" id="quiz" data-toggle="buttons">
		                	<label class="${quiz.number } btn btn-lg btn-outline-success btn-block">
		                 		<input type="radio" name="ans${quiz.number }" value="${quiz.option1 }" style="display:none;">${quiz.option1 }</label>
		                 	<label class="${quiz.number } btn btn-lg btn-outline-success btn-block">
		                 		<input type="radio" name="ans${quiz.number }" value="${quiz.option2 }" style="display:none;">${quiz.option2 }</label> 	
		                 	<label class="${quiz.number } btn btn-lg btn-outline-success btn-block">
		                 		<input type="radio" name="ans${quiz.number }" value="${quiz.option3 }" style="display:none;">${quiz.option3 }</label> 
		                 	<label class="${quiz.number } btn btn-lg btn-outline-success btn-block">
		                 		<input type="radio" name="ans${quiz.number }" value="${quiz.option4 }" style="display:none;">${quiz.option4 }</label>
		                </div>
		            </div>
					<script>
						$(document).ready(function(){
						    $('.${quiz.number }').click(function(){
						    		$('.${quiz.number }.active').removeClass('active');
							        $(this).addClass('active');
						    }); 
						});
					</script>
		        </div>
		    </div>
		    <hr>
	    </c:forEach>
		    <div class="container text-center">
			    <div class="form-check" style="align-center">
				    <input type="checkbox" class="form-check-input" required="required">
				    <label class="form-check-label">I am aware, clicking the button below will submit</label><br><br>
			  	</div>
			    <button type="submit" class="btn btn-success btn-lg">Submit</button><br><br><br>
			</div>
		</form>
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