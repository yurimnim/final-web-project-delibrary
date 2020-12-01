package com.example.demo.vo;

public class InsertCustomerVO {
	
	private String email1;
	private String email2;
	private String addr2;
	private String addr3;
	
	public InsertCustomerVO() {
		super();
	}

	public InsertCustomerVO(String email1, String email2, String addr2, String addr3) {
		super();
		this.email1 = email1;
		this.email2 = email2;
		this.addr2 = addr2;
		this.addr3 = addr3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
}