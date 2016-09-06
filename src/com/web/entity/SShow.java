package com.web.entity;

import java.io.Serializable;

import javax.servlet.http.HttpServlet;

public class SShow implements Serializable{
	int sid;
	int sno;
	String name;
	String sex;
	int age;
	String stime;
	
	/**
	 * 构造方法
	 * @param sid
	 * @param sno
	 * @param name
	 * @param sex
	 * @param age
	 * @param stime
	 */
	public SShow(int sid, int sno, String name, String sex, int age,
			String stime) {
		super();
		this.sid = sid;
		this.sno = sno;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.stime = stime;
	}

	
	/**
	 * 封装
	 * @return
	 */
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}
	
	

}
