package com.example.demo.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.Message;
import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.vo.BorrowVO;
import com.google.gson.Gson;

@RestController
public class BorrowController {
	@Autowired
	private BorrowDAO dao;
	
	public void setDao(BorrowDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	private BookDAO	bookdao;
	
	
	public void setBookdao(BookDAO bookdao) {
		this.bookdao = bookdao;
	}
	
	//책대여
	@RequestMapping(value = "/insertBorrow", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertBorrow(HttpSession session, HttpServletRequest request)  {
		session = request.getSession(true);

		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		int b_no = bookdao.getNextNo2();	
		BorrowVO b = new BorrowVO();
		int bor_no = dao.getNextNo();
		
		b.setBor_no(bor_no);
		b.setCust_no(cust_no);
		b.setB_no(b_no);
		int re = dao.insertBorrow(b);
		//???
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}

}
