package com.web.entity;

import java.io.Serializable;

public class User implements Serializable{
	
	private int tid;
	//用户名
	private String userName;
	//密码
	private String password;
	//性别
	private String sex;
	//电子邮件
	private String email;
	//学历
	private String education;
	//爱好
	private String hobby;
	//简介
	private String synopsis;
	
	
	
	/**
	 * 用于用户注册
	 * @param userName 用户自定义名字
	 * @param password 用户密码
	 * @param sex 用户性别
	 * @param email 用户电子邮箱
	 * @param education 用户学历
	 * @param hobby 用户爱好
	 * @param synopsis 用户简介
	 */
	public User(String userName, String password, String sex, String email,
			String education, String hobby, String synopsis) {
		super();
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.education = education;
		this.hobby = hobby;
		this.synopsis = synopsis;
	}
	/**
	 * 
	 * @param tid
	 * @param userName
	 * @param password
	 * @param sex
	 * @param email
	 * @param education
	 * @param hobby
	 * @param synopsis
	 */
	public User(int tid, String userName, String password, String sex,
			String email, String education, String hobby, String synopsis) {
		super();
		this.tid = tid;
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.education = education;
		this.hobby = hobby;
		this.synopsis = synopsis;
	}
	//封装
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User() {
		super();
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserpass() {
		return password;
	}
	public void setUserpass(String userpass) {
		this.password = userpass;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	
	
}
