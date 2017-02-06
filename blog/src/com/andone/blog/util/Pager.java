package com.andone.blog.util;

import java.util.List;

public class Pager<T> {

	private int pageSize;
	private int currentPage;
	private int totalSize;
	private int totalPage;
	private List<T> resultList;
	
	
	public Pager(int pageSize, int currentPage, int totalSize, int totalPage, List<T> resultList) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalSize = totalSize;
		this.totalPage = totalPage;
		this.resultList = resultList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public List<T> getResultList() {
		return resultList;
	}
	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
