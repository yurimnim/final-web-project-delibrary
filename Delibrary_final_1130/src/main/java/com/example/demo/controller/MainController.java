package com.example.demo.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.HomeDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

@Controller
public class MainController {
	
	@Autowired
	private CustomerDAO cdao;
	
	@Autowired
	private BookDAO bdao;
	
	@Autowired
	private PostDAO pdao;

	@Autowired
	private BorrowDAO bo_dao;

	@Autowired
	private HomeDAO hdao;

	@RequestMapping("/SearchResult.do")
	public String searchResultPage(String query, Model model) {
		model.addAttribute("query", query);
		return "SearchResult";
	}
	
	// 관리자 페이지 로드할 때 테이블 정보 모두 가져오는 메소드
	@RequestMapping("/ManagerPage.do")
	public ModelAndView ManagerPage() {
		ModelAndView mav = new ModelAndView();
		
		// 전체 회원 정보 가져옴
		List<CustomerVO> clist = new ArrayList<CustomerVO>();
		clist = cdao.findAll();
		
		// 전체 도서 정보 가져옴
		List<BookVO> blist = new ArrayList<BookVO>();
		blist = bdao.findAll();
		
		// 전체 게시글 정보 가져옴
		List<PostVO> plist = new ArrayList<PostVO>();
		plist = pdao.findAll_manager();
		
		// 대여 정보 전체 가져옴
		List<BorrowVO> bo_list = new ArrayList<BorrowVO>();
		bo_list = bo_dao.findAll();
		
		
		mav.addObject("clist", clist);
		mav.addObject("blist", blist);
		mav.addObject("plist", plist);
		mav.addObject("bo_list", bo_list);
		
		mav.addObject("ob", bo_list.get(0));
		mav.setViewName("ManagerPage");
		
		return mav;
	}
	
	
	// 관리자 페이지에서 수정확인 버튼을 누르면 수정 작업을 수행하는 메소드
	@RequestMapping("/updatefrommanager.do")
	@ResponseBody
	public void updateFromManager(String i, HttpServletRequest request) {
		
		Map map = new HashMap();
		map.put("i", i);
		
		if (i.equals("0")) {
			String cust_no = request.getParameter("cust_no");
			String manager = request.getParameter("manager");
			System.out.println("before : " + manager);
			if (manager.equals("")) {
				manager = "N";
				System.out.println("after : " + manager);
			}
			
			map.put("cust_no", cust_no);
			map.put("manager", manager);
		}
		
		if (i.equals("1")) {
			String b_no = request.getParameter("b_no");
//			String b_title = request.getParameter("b_title");
			String b_count = request.getParameter("b_count");
			String c_no = request.getParameter("c_no");
			
			map.put("b_no", b_no);
//			map.put("b_title", b_title);
			map.put("b_count", b_count);
			map.put("c_no", c_no);
		}
		
		if (i.equals("2")) {
			String p_id = request.getParameter("p_id");
			String p_no = request.getParameter("p_no");
			String cust_no = request.getParameter("cust_no");
			
			map.put("p_id", p_id);
			map.put("p_no", p_no);
			map.put("cust_no", cust_no);
		}
		
		if (i.equals("3")) {
			String bor_no = request.getParameter("bor_no");
			String bor_date = request.getParameter("bor_date");
			String return_date = request.getParameter("return_date");
			String return_ok = request.getParameter("return_ok");
			String cust_no = request.getParameter("cust_no");
			String b_no = request.getParameter("b_no");
			
			map.put("bor_no", bor_no);
			map.put("bor_date", bor_date);
			map.put("return_date", return_date);
			map.put("return_ok", return_ok);
			map.put("cust_no", cust_no);
			map.put("b_no", b_no);
		}
		hdao.updateFromManager(map);
	}

	// 관리자 페이지에서 삭제 버튼을 누르면 수정 작업을 수행하는 메소드
	@RequestMapping("/deletefrommanager.do")
	@ResponseBody
	public void deleteFromManager(String i, String pk) {
		
		Map map = new HashMap();
		map.put("i", i);
		map.put("pk", pk);
		
		hdao.deleteFromManager(map);
	}
}