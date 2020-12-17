package com.gl.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gl.dao.QuizDAO;
import com.gl.model.Quiz;

@WebServlet("/taketest")
public class QuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private QuizDAO quizDao;
    //private Quiz quiz;
    private List<Quiz> quizlist;
	
    public QuizServlet() {
        super();
        quizDao = new QuizDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.isNew()) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}

		quizlist = quizDao.getQuiz();
		session.setAttribute("secureQuiz", "NotNull"); 
		session.setAttribute("quizlist", quizlist);
		response.sendRedirect("quiz.jsp");
	}
}