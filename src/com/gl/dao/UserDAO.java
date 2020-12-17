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

public class UserDAO {
	User user;

	public UserDAO() {
		super();
		user = new User();
	}

	private static final String FIND_USER_SQL = "select * from users where userid=? && password=?;";
	private static final String SEARCH_USER_SQL = "select userid from users where userid=?;";
	private static final String ADD_USER_SQL = "insert into users(userid,name,password) values(?, ?, ?);";
	private static final String LEADER_BOARD_SQL = "select name, score from users order by score desc;";
	
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
	
	public User findUser(String userid, String password) {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		try {
			preparedStatement = connection.prepareStatement(FIND_USER_SQL);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user.setUserid(resultSet.getString(1));
				user.setName(resultSet.getString(2));
				user.setPassword(resultSet.getString(3));
				user.setScore(resultSet.getInt(4));
			}
			preparedStatement.close();
			connection.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User isTaken(String userid) {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		try {
			preparedStatement = connection.prepareStatement(SEARCH_USER_SQL);
			preparedStatement.setString(1, userid);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user.setUserid(resultSet.getString(1));
			}
			preparedStatement.close();
			connection.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public User addUser(String userid, String name, String password) {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(ADD_USER_SQL);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, password);
			preparedStatement.executeUpdate();
			preparedStatement.close();
			connection.close();
			user.setUserid(userid);
			user.setName(name);
			user.setPassword(password);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User> getLeaderBoard() {
		Connection connection = getConnection();
		System.out.println(connection);
		PreparedStatement preparedStatement;
		ResultSet resultSet;
		List<User> leaderBoardList = new ArrayList<User>();
		String numberCount = "0";
		int score = 0;
		int i=1;
		try {
			preparedStatement = connection.prepareStatement(LEADER_BOARD_SQL);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String name = resultSet.getString(1);
				if(score != resultSet.getInt(2)) {
					numberCount = String.valueOf(i++);
					score = resultSet.getInt(2);
				}
				leaderBoardList.add(new User(name, score, numberCount));
			}
			preparedStatement.close();
			connection.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return leaderBoardList;
	}
	
}