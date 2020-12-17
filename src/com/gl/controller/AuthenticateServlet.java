package com.gl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gl.dao.UserDAO;
import com.gl.model.User;

@WebServlet("/")
public class AuthenticateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao;
	private User user;
	private String userid;
	private String password;
	private String name;
	private String action;
	
	
    public AuthenticateServlet() {
        userDao = new UserDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	action = request.getServletPath();
    	if(action.equals("/leaderBoard")) {
	    	List<User> leaderBoardList = userDao.getLeaderBoard();
			request.setAttribute("LeaderBoardList", leaderBoardList);
			RequestDispatcher rd = request.getRequestDispatcher("leader-board.jsp");
			rd.forward(request, response);
    	}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		action = request.getServletPath();
		switch (action){
		case "/login":
			login(request, response);
			break;
		case "/signup":
			if(request.getAttribute("userid") != null && request.getAttribute("name") != null && request.getAttribute("password") != null) 
				signup(request, response);
			break;
		default:
			System.out.println("getServletPath causing problem");
			break;
		}
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userid = request.getParameter("userid");
		password = request.getParameter("password");
		
		user = userDao.findUser(userid, password);
		
		if(userid.equals(user.getUserid()) && password.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("user", user);
			response.sendRedirect("welcome.jsp");
		}else {
			request.setAttribute("incorrectCredentials","Incorrect Username or Password");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");            
			rd.include(request, response);
		}
	}
	
	protected void signup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userid  = request.getParameter("userid");
		name = (String) request.getAttribute("name");
		password = request.getParameter("password");
		
		user = userDao.isTaken(userid);
		
		if(userid.equals(user.getUserid())) {
			request.setAttribute("ID_taken","This user id is already taken!");
			request.setAttribute("userid", userid);  //To show that userid is taken
			RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");            
			rd.include(request, response);
		}
		else { 
			user = userDao.addUser(userid, name, password);
			HttpSession session = request.getSession(); 
			session.setAttribute("userid", userid);
			session.setAttribute("user", user);
			response.sendRedirect("welcome.jsp");
		}
	}

}