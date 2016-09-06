package com.web.entity;

import java.io.Serializable;

import javax.servlet.http.HttpServlet;

public class CShow implements Serializable{
	int cid;
	String ctime;
	/**
	 * 构造器
	 * @param cid
	 * @param ctime
	 */
	public CShow(int cid, String ctime) {
		super();
		this.cid = cid;
		this.ctime = ctime;
	}
	
	/**
	 * 封装
	 * @return
	 */
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	

}
