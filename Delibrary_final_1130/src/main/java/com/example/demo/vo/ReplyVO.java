package com.example.demo.vo;

import java.util.Date;

public class ReplyVO {
   private int re_no;
   private int p_id;
   private int p_no;
   private String re_content;
   private String re_writer;
   private Date re_regdate;
   private int re_ref;
   private int re_level;
   private int re_step;
   private int cust_no;
   private String fname;
   
   public ReplyVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   public ReplyVO(int re_no, int p_id, int p_no, String re_content, String re_writer, Date re_regdate, int re_ref,
         int re_level, int re_step, int cust_no, String fname) {
      super();
      this.re_no = re_no;
      this.p_id = p_id;
      this.p_no = p_no;
      this.re_content = re_content;
      this.re_writer = re_writer;
      this.re_regdate = re_regdate;
      this.re_ref = re_ref;
      this.re_level = re_level;
      this.re_step = re_step;
      this.cust_no = cust_no;
      this.fname=fname;
   }
   
   public String getFname() {
      return fname;
   }

   public void setFname(String fname) {
      this.fname = fname;
   }

   public int getRe_no() {
      return re_no;
   }
   public void setRe_no(int re_no) {
      this.re_no = re_no;
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
   public String getRe_content() {
      return re_content;
   }
   public void setRe_content(String re_content) {
      this.re_content = re_content;
   }
   public String getRe_writer() {
      return re_writer;
   }
   public void setRe_writer(String re_writer) {
      this.re_writer = re_writer;
   }
   public Date getRe_regdate() {
      return re_regdate;
   }
   public void setRe_regdate(Date re_regdate) {
      this.re_regdate = re_regdate;
   }
   public int getRe_ref() {
      return re_ref;
   }
   public void setRe_ref(int re_ref) {
      this.re_ref = re_ref;
   }
   public int getRe_level() {
      return re_level;
   }
   public void setRe_level(int re_level) {
      this.re_level = re_level;
   }
   public int getRe_step() {
      return re_step;
   }
   public void setRe_step(int re_step) {
      this.re_step = re_step;
   }
   public int getCust_no() {
      return cust_no;
   }
   public void setCust_no(int cust_no) {
      this.cust_no = cust_no;
   }
   
}