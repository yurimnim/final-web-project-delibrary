package com.example.demo.vo;

public class BookstoreVO {
	private int bs_no;
	private String bs_name;
	private String website;
	
	public BookstoreVO() {
		super();
	}
	public BookstoreVO(int bs_no, String bs_name, String website) {
		super();
		this.bs_no = bs_no;
		this.bs_name = bs_name;
		this.website = website;
	}
	public int getBs_no() {
		return bs_no;
	}
	
	public void setBs_no(int bs_no) {
		this.bs_no = bs_no;
	}
	public String getBs_name() {
		return bs_name;
	}
	public void setBs_name(String bs_name) {
		this.bs_name = bs_name;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}		
}
