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

import com.gl.model.User;

public class EvaluateDAO {

	private static final String GET_ANSWERS_SQL = "select answer from quiz;";
	private static final String SET_SCORE_SQL = "update users set score=? where userid=?;";
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/myds");
			connection =  ds.getConnection();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return connection;
	}	
	
	public List<String> getKey() {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<String> keyList = new ArrayList<String>();
		try {
			preparedStatement = connection.prepareStatement(GET_ANSWERS_SQL);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				keyList.add(resultSet.getString(1));
			}
			preparedStatement.close();
			connection.close();
		}catch(SQLException e) {System.out.println(e.getMessage()); }
		return keyList;
	}
	
	public void updateScore(User user) {
		Connection connection = getConnection();
		System.out.println(connection);
		System.out.println("Score updated successfully!");
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(SET_SCORE_SQL);
			preparedStatement.setInt(1, user.getScore());
			preparedStatement.setString(2, user.getUserid());
			preparedStatement.executeUpdate();
			preparedStatement.close();
			connection.close();
		}catch(SQLException e) {System.out.println(e.getMessage()); }
	}

}
