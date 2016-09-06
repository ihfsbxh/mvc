package com.web.entity;

import java.io.Serializable;
import java.util.List;

public class page<T> implements Serializable{
	
	private int pageNo=1; 
	
	private int pageSize=10;
	
	private List<T> dataList;
	
	private long total;


	
	
	
	/**
	 * 无参构造方法
	 */
	public page() {}
	
	/**
	 * 全参构造方法
	 * @param pageNo
	 * @param pageSize
	 * @param dataList
	 * @param total
	 */
	public page(int pageNo, int pageSize, List<T> dataList, long total) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.dataList = dataList;
		this.total = total;
	}



	/**
	 * 封装
	 * @return
	 */
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getDataList() {
		return dataList;
	}

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
}
