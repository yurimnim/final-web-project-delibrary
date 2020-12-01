package com.example.demo.vo;

import java.sql.Date;

public class BookVO {
	
	private int b_no;
	private String b_title;
	private String b_publisher;
	private String b_writer;
	private Date b_year;
	private int b_price;
	private String b_image;
	private String b_detail;
	private String b_index;
	private int b_count;
	private int c_no;
	
	public BookVO() {
		super();
	}
	
	public BookVO(int b_no, String b_title, String b_writer, String b_image) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_writer = b_writer;
		this.b_image = b_image;
	}

	public BookVO(int b_no, String b_title, String b_publisher, String b_writer, Date b_year, int b_price,
			String b_image, String b_detail, String b_index, int b_count, int c_no) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_publisher = b_publisher;
		this.b_writer = b_writer;
		this.b_year = b_year;
		this.b_price = b_price;
		this.b_image = b_image;
		this.b_detail = b_detail;
		this.b_index = b_index;
		this.b_count = b_count;
		this.c_no = c_no;
	}
	

	public BookVO(int b_no, String b_title, String b_publisher, String b_writer, Date b_year, int b_price,
			String b_image, String b_detail, String b_index, int b_count) {
		super();
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_publisher = b_publisher;
		this.b_writer = b_writer;
		this.b_year = b_year;
		this.b_price = b_price;
		this.b_image = b_image;
		this.b_detail = b_detail;
		this.b_index = b_index;
		this.b_count = b_count;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_publisher() {
		return b_publisher;
	}

	public void setB_publisher(String b_publisher) {
		this.b_publisher = b_publisher;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public Date getB_year() {
		return b_year;
	}

	public void setB_year(Date b_year) {
		this.b_year = b_year;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public String getB_detail() {
		return b_detail;
	}

	public void setB_detail(String b_detail) {
		this.b_detail = b_detail;
	}

	public String getB_index() {
		return b_index;
	}

	public void setB_index(String b_index) {
		this.b_index = b_index;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
}