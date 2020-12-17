package com.gl.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.gl.model.Quiz;

public class QuizDAO {
	private static final String GET_QUIZ = "select question, option1, option2, option3, option4 from quiz;";

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/myds");
			connection =  ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return connection;
	}	
	
	public List<Quiz> getQuiz() {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<Quiz> quizList = new ArrayList<Quiz>();
		int i=1;
		try {
			preparedStatement = connection.prepareStatement(GET_QUIZ);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String question = resultSet.getString(1);
				String option1 = resultSet.getString(2);
				String option2 = resultSet.getString(3);
				String option3 = resultSet.getString(4);
				String option4 = resultSet.getString(5);
				String numberCount = String.valueOf(i++);
				quizList.add(new Quiz(question, option1, option2, option3, option4, numberCount));
			}
			preparedStatement.close();
			connection.close();
		}catch(SQLException e) {System.out.println(e.getMessage()); }
		return quizList;
	}
}