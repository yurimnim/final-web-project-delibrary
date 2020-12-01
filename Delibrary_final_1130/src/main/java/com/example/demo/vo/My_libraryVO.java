package com.example.demo.vo;

import java.util.Date;

public class My_libraryVO {
	private int ml_no;
	private int cust_no;
	private String ml_title;
	private String ml_content;
	private Date ml_regdate;
	private String ml_file;
	
	public My_libraryVO() {
		super();
	}
	public My_libraryVO(int ml_no, int cust_no, String ml_title, String ml_content, Date ml_regdate, String ml_file) {
		super();
		this.ml_no = ml_no;
		this.cust_no = cust_no;
		this.ml_title = ml_title;
		this.ml_content = ml_content;
		this.ml_regdate = ml_regdate;
		this.ml_file = ml_file;
	}
	public int getMl_no() {
		return ml_no;
	}
	public void setMl_no(int ml_no) {
		this.ml_no = ml_no;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public String getMl_title() {
		return ml_title;
	}
	public void setMl_title(String ml_title) {
		this.ml_title = ml_title;
	}
	public String getMl_content() {
		return ml_content;
	}
	public void setMl_content(String ml_content) {
		this.ml_content = ml_content;
	}
	public Date getMl_regdate() {
		return ml_regdate;
	}
	public void setMl_regdate(Date ml_regdate) {
		this.ml_regdate = ml_regdate;
	}
	public String getMl_file() {
		return ml_file;
	}
	public void setMl_file(String ml_file) {
		this.ml_file = ml_file;
	}
	

}
