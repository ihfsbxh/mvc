package com.web.entity;

import java.io.Serializable;

public class Role implements Serializable{

	//角色id
	int rid;
	//角色名称
	String name;
	
	
	/**
	 * 无参构造器
	 */
	public Role() {}


	/**
	 * 全参构造器
	 * @param rid
	 * @param name
	 */
	public Role(int rid, String name) {
		super();
		this.rid = rid;
		this.name = name;
	}
	
	
	/**
	 * 封装
	 * @return
	 */
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
