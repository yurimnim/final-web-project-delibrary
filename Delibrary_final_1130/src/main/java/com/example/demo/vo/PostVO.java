package com.example.demo.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PostVO {
	private int p_id;
	private int p_no;
	private String p_title;
	private String p_writer;
	private String p_content;
	private int p_hit;
	private Date p_regdate;
	private int cust_no;
	private String fname;
//	private int fsize;
	private MultipartFile uploadFile;
	private int fol_no;
	private String p_option;
	
	
	public PostVO() {
		super();
	}
	
	public PostVO(int p_id, int p_no, String p_title) {
		super();
		this.p_id = p_id;
		this.p_no = p_no;
		this.p_title = p_title;
	}
	
	public PostVO(int p_id, int p_no, String p_title, String p_writer, String p_content, int p_hit, Date p_regdate,
			int cust_no, String fname, MultipartFile uploadFile, String p_option) {
		super();
		this.p_id = p_id;
		this.p_no = p_no;
		this.p_title = p_title;
		this.p_writer = p_writer;
		this.p_content = p_content;
		this.p_hit = p_hit;
		this.p_regdate = p_regdate;
		this.cust_no = cust_no;
		this.fname = fname;
//		this.fsize = fsize;
		this.uploadFile = uploadFile;
		this.p_option=p_option;
	}
	
	//용택 postVO 에 생성자 추가 
		public PostVO(int p_id, int p_no, String p_title, String p_writer, String p_content, int p_hit, Date p_regdate,
				int cust_no, int fol_no, String fname) {
			super();
			this.p_id = p_id;
			this.p_no = p_no;
			this.p_title = p_title;
			this.p_writer = p_writer;
			this.p_content = p_content;
			this.p_hit = p_hit;
			this.p_regdate = p_regdate;
			this.cust_no = cust_no;
			this.fol_no = fol_no;
			this.fname = fname;
		}
	public void setIdAndNo(int p_id, int p_no) {
		this.p_id=p_id;
		this.p_no=p_no;
	}
	public String getP_option() {
		return p_option;
	}
	
	public void setP_option(String p_option) {
		this.p_option = p_option;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_writer() {
		return p_writer;
	}
	public void setP_writer(String p_writer) {
		this.p_writer = p_writer;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_hit() {
		return p_hit;
	}
	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getFol_no() {
		return fol_no;
	}

	public void setFol_no(int fol_no) {
		this.fol_no = fol_no;
	}
	
//	public int getFsize() {
//		return fsize;
//	}
//	public void setFsize(int fsize) {
//		this.fsize = fsize;
//	}
}
