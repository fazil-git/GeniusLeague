package com.gl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gl.dao.EvaluateDAO;
import com.gl.model.User;

@WebServlet("/quizSubmit")
public class EvaluateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<String> answerList;
	private List<String> keyList;
	private EvaluateDAO evaluateDao;
       
    public EvaluateServlet() {
        super();
        evaluateDao = new EvaluateDAO();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int count = 0;
		HttpSession session = request.getSession();
		if(session.isNew()) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}else {
			answerList = new ArrayList<String>(); 
			 
			keyList = evaluateDao.getKey();
			int j = 1;
			while(keyList.size() != answerList.size()) {
				answerList.add(request.getParameter("ans"+j));
				j++;
			}
			
			if(answerList != null) {
				for(int i=0; i<keyList.size(); i++) {
					if(keyList.get(i).equals(answerList.get(i))) {
						count++;
					}
				}
			}
			User user = (User) session.getAttribute("user");
			user.setScore(count);
			evaluateDao.updateScore(user);
			response.sendRedirect("result.jsp");
		}
	}
}