package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.FolderDAO;
import com.example.demo.dao.PostDAO;

//확인 Bookcart + borrowList page
@Controller
public class BookcartController {
	
	
	public static int pageSIZE =  12;   //한 페이지에 보여줄 게시글의 수
	   public static int pageMAX =  5;      //한 페이지에서 페이징바 수
	   public static int totalCount  = 0;   
	   public static int totalPage = 0;   
	   public static int updateHit = 0;
	   public static int nextId;
	   public static int nextNo;
	
	
	@Autowired
	BorrowDAO dao;
	

	public void setDao(BorrowDAO dao) {
		this.dao = dao;
	}


	@RequestMapping("/BookCart.do")
	public void list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		int cust_no  =  (int) session.getAttribute("cust_no");
		HashMap map=new HashMap();
		map.put("cust_no", cust_no);	
		model.addAttribute("b", dao.selectBycust_No(map));

	}	
	
	@RequestMapping("/borrowList.do")
	public void list2(Model model, HttpServletRequest request,@RequestParam(value = "pageNUM",defaultValue = "1") int pageNUM ) {
		HttpSession session = request.getSession(true);
        System.out.println("***pageNUM : "+   pageNUM);

		int cust_no  =  (int) session.getAttribute("cust_no");
		
		HashMap map=new HashMap();
		map.put("cust_no", cust_no);
		
        totalCount = dao.getTotalCount2(map);
		totalPage = (int)Math.ceil( (double)totalCount/pageSIZE );
		
		model.addAttribute("b", dao.selectBycust_No2(map));
		model.addAttribute("totalCount", totalCount);
	}
	
	
	
	@RequestMapping("/return_borrowList.do")
	public void list3(Model model, HttpServletRequest request,@RequestParam(value = "pageNUM",defaultValue = "1") int pageNUM ) {
		HttpSession session = request.getSession(true);
        System.out.println("***pageNUM : "+   pageNUM);

		int cust_no  =  (int) session.getAttribute("cust_no");
		//반납완료도서
		String return_ok = "Y";

		
		HashMap map=new HashMap();
		map.put("cust_no", cust_no);
//		map.put("return_ok", return_ok);
		
        totalCount = dao.getTotalCount3(map);
        
		totalPage = (int)Math.ceil( (double)totalCount/pageSIZE );
        
        //페이지 버튼 숫자
        int startPage = (pageNUM-1)/pageMAX*pageMAX+1;
        int endPage = startPage+pageMAX-1;
        if(endPage>totalPage) {
           endPage = totalPage;
        }
        
//        map.put("startPage", startPage);
//        map.put("endPage", endPage);
        
        //페이지에 출려되는 레코드번호
        int start = (pageNUM-1)*pageSIZE+1;
        int end = start + pageSIZE-1; 
        if (end > totalCount) {
           end = totalCount;
        }
        map.put("start", start);
        map.put("end", end);
        
        
        
        System.out.println("***start : "+start);
        System.out.println("***end : "+end);
        System.out.println("***startPage : "+startPage);
        System.out.println("***endPage : "+endPage);
        System.out.println("***totalPage : "+totalPage);
        
     
        
        
  

		
		model.addAttribute("b", dao.selectBycust_No3(map));

			model.addAttribute("totalCount", totalCount);
	        model.addAttribute("totalPage", totalPage);
	        model.addAttribute("startPage", startPage);
	        model.addAttribute("endPage", endPage);
//	        model.addAttribute("start", start);
//	        model.addAttribute("end", end);
	        model.addAttribute("pageNUM", pageNUM);
	}

}
