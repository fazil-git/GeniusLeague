package com.gl.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/signup")
public class CheckSignupFilter implements Filter {
	private RequestDispatcher rd;
	private Pattern pattern;
	
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		rd = request.getRequestDispatcher("signup.jsp");
		pattern = Pattern.compile("[a-zA-Z0-9]*");
		
		checkUserID(request, response, rd);
		checkName(request, response, rd);
		checkPassword(request, response, rd);
		chain.doFilter(request, response);
	}



	private void checkUserID(ServletRequest request, ServletResponse response, RequestDispatcher rd) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		userid.trim();
		Matcher matcher = pattern.matcher(userid);
		if(!(matcher.matches())) {
			request.setAttribute("InvalidUserid", true);
			((RequestDispatcher) rd).forward(request, response);
		}
		else{
			request.setAttribute("userid", userid);   //Ok
		}
	}

	private void checkName(ServletRequest request, ServletResponse response, RequestDispatcher rd) throws ServletException, IOException {	
		String name = "";
		String capped;
		Matcher matcher;
		
		String rawName = request.getParameter("name");
		rawName.trim();
        String[] nameList = rawName.split(" ");
        
        for(String title : nameList){
        	matcher = pattern.matcher(title);
        	if(!(matcher.matches())) {
        		request.setAttribute("InvalidName", true);
    			((RequestDispatcher) rd).forward(request, response);
        	}
            capped = title.substring(0, 1).toUpperCase() + title.substring(1);
            name = name + capped +" ";
        }
        name = name.trim();
        System.out.println(name);
        request.setAttribute("name", name);   //Ok
		
	}
	
	private void checkPassword(ServletRequest request, ServletResponse response, RequestDispatcher rd) throws ServletException, IOException {
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirm_password");
		Matcher matcher = pattern.matcher(password);
		if(password.isEmpty() || (!matcher.matches())) {
			request.setAttribute("InvalidPassword", true);
			((RequestDispatcher) rd).forward(request, response);
		}
		if( (!(password.equals(confirmPassword)))) {
			request.setAttribute("PasswordMismatch", true);
			((RequestDispatcher) rd).forward(request, response);
		}
		else {
			request.setAttribute("password", password);   //Ok
		}
	}
}
