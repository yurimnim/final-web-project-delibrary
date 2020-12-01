package com.example.demo.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.CustomerDAO;
import com.example.demo.vo.CustomerVO;

@Controller
public class Mypage_main_Controller {
	
  	 public static int pageSIZE =  12;   
     public static int pageMAX =  5;
	 public static int totalCount_N  = 0; 
	 public static int totalCount_ALL  = 0; 
	 public static int totalPage_N = 0;   
	 public static int totalPage_ALL = 0;   
	
	@Autowired
	private CustomerDAO cust_dao;

	public void setDao(CustomerDAO dao) {
		this.cust_dao = dao;
	}
	
	@Autowired
	private BorrowDAO borrow_dao;
	
	public void setBorrow_dao(BorrowDAO borrow_dao) {
		this.borrow_dao = borrow_dao;
	}

	//나의도서정보 연결
	@RequestMapping("/mypage_main.do")
	public void detail2(Model model, HttpServletRequest request, @RequestParam(value = "pageNUM",defaultValue = "1") int pageNUM) {
		HttpSession session = request.getSession();
		
		int cust_no = (int) session.getAttribute("cust_no");
		CustomerVO c = cust_dao.findByCust_No(cust_no);
		
		System.out.println(cust_no);
		
		request.setAttribute("c", c);
		
		//-----------------------------------------------------------------------------------------------------
		String Email = c.getEmail();
		String id = Email.substring(0, Email.indexOf("@"));
		String email = Email.substring(Email.indexOf("@")+1);
		request.setAttribute("id", id);
		request.setAttribute("email", email);

		// 현왕 주소 유지되게끔 설정 ==================================================================================
		String addr2 = c.getAddr2();
		String addr_num = addr2.substring(0, addr2.indexOf(","));
		String addr_ref = addr2.substring(addr2.indexOf(",")+1);

		String addr = c.getAddr();
		String addr_1 = addr.substring(0, addr.indexOf(","))+addr_ref;
		String addr_2 = addr.substring(addr.indexOf(",")+1);

		request.setAttribute("addr_1", addr_1);
		request.setAttribute("addr_2", addr_2);
		request.setAttribute("addr_num", addr_num);
		request.setAttribute("addr_ref", addr_ref);
		// =====================================================================================================>
		
		//================ 대출 건수 확인 부분 시작 ======================
		HashMap map_N=new HashMap();
		map_N.put("cust_no", cust_no);
		
		HashMap map_ALL=new HashMap();
		map_ALL.put("cust_no", cust_no);
		
		totalCount_N = borrow_dao.getTotalCount_hw(map_N);
		totalCount_ALL = borrow_dao.getTotalCount3(map_ALL);
		totalPage_N = (int)Math.ceil( (double)totalCount_N/pageSIZE );
		totalPage_ALL = (int)Math.ceil( (double)totalCount_ALL/pageSIZE );
		
		//페이지 버튼 숫자_N
		int startPage_N = (pageNUM-1)/pageMAX*pageMAX+1;
		int endPage_N = startPage_N+pageMAX-1;
		if(endPage_N>totalPage_N) {
			endPage_N = totalPage_N;
		}
		//페이지에 출려되는 레코드번호_N
		int start_N = (pageNUM-1)*pageSIZE+1;
		int end_N = start_N + pageSIZE-1; 
		if (end_N > totalCount_N) {
			end_N = totalCount_N;
		}
		//페이지 버튼 숫자_ALL
		int startPage_ALL = (pageNUM-1)/pageMAX*pageMAX+1;
		int endPage_ALL = startPage_ALL+pageMAX-1;
		if(endPage_ALL>totalPage_ALL) {
			endPage_ALL = totalPage_ALL;
		}
		//페이지에 출려되는 레코드번호_ALL
		int start_ALL = (pageNUM-1)*pageSIZE+1;
		int end_ALL = start_ALL + pageSIZE-1; 
		if (end_ALL > totalCount_ALL) {
			end_ALL = totalCount_ALL;
		}
		
		map_N.put("start", start_N);
		map_N.put("end", end_N);
		
		map_ALL.put("start", start_ALL);
		map_ALL.put("end", end_ALL);
		
		//================ 대출 건수 확인 부분 종료 ======================//
		
		
		model.addAttribute("b_N", borrow_dao.selectBycust_No2(map_N));
		model.addAttribute("b_ALL", borrow_dao.selectBycust_No3(map_ALL));
		model.addAttribute("totalCount_N", totalCount_N);
		model.addAttribute("totalCount_ALL", totalCount_ALL);

		model.addAttribute("c",cust_dao.findByCust_No(cust_no));
		
	}

}