package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

@RestController
public class ReplyController {

	@Autowired
	private ReplyDAO re_dao;
	public void setRe_dao(ReplyDAO re_dao) {
		this.re_dao = re_dao;
	}
	@Autowired
	private CustomerDAO c_dao;
	public void setC_dao(CustomerDAO c_dao) {
		this.c_dao = c_dao;
	}
   
	//새 댓글 작성
	@RequestMapping(value="replyInsert.do", method = RequestMethod.POST)
	public String insert(int cust_no, int p_id, int p_no, String re_content, HttpServletRequest request) {
		int re=-1;
		String re_writer=c_dao.findByCust_No(cust_no).getNickname();
		
		//로그인된 회원번호 받아오기
		HttpSession session=request.getSession(); 
		session.setAttribute("cust_no", session.getAttribute("cust_no"));
		int signed_custNo=(Integer)session.getAttribute("cust_no");
		System.out.println("REPLY 댓글 고객 사진 |  "+c_dao.findByCust_No(signed_custNo).getFname());
//		model.addAttribute("c", c_dao.findByCust_No(signed_custNo));
		
		int nextNo=re_dao.getNextNo();
		HashMap map=new HashMap();
		map.put("re_no", nextNo);
		map.put("p_id", p_id);
		map.put("p_no", p_no);
		map.put("re_writer", re_writer);
		map.put("re_content", re_content);
		map.put("cust_no", cust_no);
		map.put("fname", c_dao.findByCust_No(signed_custNo).getFname());
		System.out.println("REPLY INSERT map :  "+ map);
		
		re=re_dao.insert(map);
		System.out.println("REPLY INSERT re   :   "+re);
		return Integer.toString(re);
	}
	
	//댓글 수정
	@RequestMapping(value="replyUpdate.do", method = RequestMethod.POST)
	public String update(HttpServletRequest request,int re_no, int cust_no, String re_content) {
		int re=-1;
		System.out.println("UPDATE 받아온 re_no :  "+re_no);
		System.out.println("UPDATE 받아온 cust_no :  "+cust_no);
		HashMap map=new HashMap();
		map.put("re_no", re_no);
		map.put("cust_no", cust_no);
		map.put("re_content", re_content);
		System.out.println("REPLY UPDATE map  :  "+map);
		
		re = re_dao.update(map);
		System.out.println("REPLY UPDATE re  :  "+re);
  		return Integer.toString(re);
	}
   
	//댓글삭제
	@RequestMapping(value = "replyDelete.do", method = RequestMethod.POST)
	public String delete(int re_no, int cust_no, HttpServletRequest request) {
		int re=-1;
				
		System.out.println("DEL 받아온 cust_no :  "+cust_no);
		System.out.println("DEL 받아온 re_no  :  "+re_no);
		
		HashMap map=new HashMap();
		map.put("re_no",re_no);
		map.put("cust_no",cust_no);
		System.out.println("REPLY DEL map :  "+ map);
		
		re=re_dao.delete(map);
		System.out.println("REPLY DEL re:   "+re);
		
		return Integer.toString(re);
	}
	
}
