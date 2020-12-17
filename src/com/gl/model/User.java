package com.gl.model;

public class User {
	private String userid;
	private String name;
	private String password;
	private int score;
	private String number;
	
	public User(String userid, String name, String password, int score) {
		super();
		this.userid = userid;
		this.name = name;
		this.password = password;
		this.score = score;
	}
	
	public User(String name, int score, String number) {
		super();
		this.name = name;
		this.score = score;
		this.number = number;
	}

	public User() {
		super();
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
}
