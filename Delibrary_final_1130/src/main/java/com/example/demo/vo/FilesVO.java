package com.example.demo.vo;

public class FilesVO {
	private int f_no;
	private String f_name;
	private String f_volume;
	private int p_id;
	private int p_no;
	
	public FilesVO() {
		super();
	}
	
	public FilesVO(int f_no, String f_name, String f_volume, int p_id, int p_no) {
		super();
		this.f_no = f_no;
		this.f_name = f_name;
		this.f_volume = f_volume;
		this.p_id = p_id;
		this.p_no = p_no;
	}
	
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_volume() {
		return f_volume;
	}
	public void setF_volume(String f_volume) {
		this.f_volume = f_volume;
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
	
	
}
