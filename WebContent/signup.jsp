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
        			<a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Home <span class="sr-only">(current)</span></a> </li>
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
				<form action="signup" method="post">
					<h2>Welcome to Sign Up</h2>
					<label>It's quick and easy!</label>
						<fieldset class="form-group">
							<label>User ID:</label> 
							<input type="text"
								class="form-control" value="${userid }"
								name="userid" required="required">
						</fieldset>
						<c:if test="${ID_taken ne null }">
							<label style="color:red">${ID_taken }</label><br>
						</c:if>
						<c:if test="${InvalidUserid ne null }">
							<label style="color:red">User id should be alpha-numeric, and should NOT contain empty spaces / specical characters</label><br>
						</c:if>
						
						<fieldset class="form-group">
							<label>Full Name:</label> 
							<input type="text"
								class="form-control"
								name="name" required="required">
						</fieldset>
						<c:if test="${InvalidName ne null }">
							<label style="color:red">Name field should NOT be empty! and It should NOT contain any numeric / special characters</label><br>
						</c:if>
		
						<fieldset class="form-group">
							<label>Password:</label> 
							<input id="password" type="password"
								class="form-control"
								name="password" required="required">
						</fieldset>
						<c:if test="${PasswordMismatch ne null }">
							<label style="color:red">Password NOT matching!</label><br>
						</c:if>
						<c:if test="${InvalidPassword ne null }">
							<label style="color:red">Invalid password!  Field should NOT be empty/ password should not contain any special characters</label><br>
						</c:if>
						
						<fieldset class="form-group">
							<label>Confirm Password:</label> 
							<input id="confirm_password" type="password"
								class="form-control"
								name="confirm_password" required="required" onkeyup='check()'>
						</fieldset><span id='message'></span><br><br>
					<input type="submit" class="btn btn-success" disabled="disabled" value="Create">
				</form>
			</div>
		</div>
	</div>
	<script>
		var form = document.querySelector('form');
 		var inputs = form.querySelectorAll('input');
		var required_inputs = form.querySelectorAll('input[required]');
		var register = document.querySelector('input[type="submit"]');
		var disabled;
		var checkSignal = false;
		function check() {
			checkSignal = true;  
			}
		form.addEventListener('keyup', function(e) {
			disabled = false
			required_inputs.forEach(function(input, index) {
	            if (input.value === '' || !input.value.replace(/\s/g, '').length) {
	            	disabled = true;
	            }
	            if(checkSignal){
		            if (document.getElementById('password').value == document.getElementById('confirm_password').value) {
					    document.getElementById('message').style.color = 'green';
					    document.getElementById('message').innerHTML = 'You\'re good to go!';  		   
				  } else {
					    document.getElementById('message').style.color = 'red';
					    document.getElementById('message').innerHTML = 'Password not matching';
					    disabled = true;
				  	}
				  }
	        })
	        if(disabled){
	        	register.setAttribute('disabled', 'disabled')
	        }else{
	        	register.removeAttribute('disabled')
	        }
		})
	</script>
</body>
</html>