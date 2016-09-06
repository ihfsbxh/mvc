package com.web.vo;

import java.io.Serializable;

public class MenuVo implements Serializable{
	/**
	 * 菜单属性
	 */
	private int mid;
	private String name;
	private String url;
	private int isshow;
	private int level;
	private String parentid;
	
	
	public String toString(){
		return "{\"mid\":"+mid+",\"name\":"+name+",\"url\":"+url+",\"isshow\":"+isshow+",\"level\":"+level+",\"parentid\":"+parentid+"}";
	}
	/**
	 * 无参构造器
	 */
	public MenuVo() {
		super();
	}
	
	
	/**
	 * 全属性构造器
	 * @param mid
	 * @param name
	 * @param url
	 * @param isshow
	 * @param level
	 * @param parentid
	 */
	public MenuVo(int mid, String name, String url, int isshow, int level,
			String parentid) {
		super();
		this.mid = mid;
		this.name = name;
		this.url = url;
		this.isshow = isshow;
		this.level = level;
		this.parentid = parentid;
	}
	/**
	 * 封装方法
	 * @return
	 */
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getIsshow() {
		return isshow;
	}
	public void setIsshow(int isshow) {
		this.isshow = isshow;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getParentid() {
		return parentid;
	}
	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	
	
	

}
