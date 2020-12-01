package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BooklistDAO;
import com.example.demo.vo.BookVO;

@Controller
public class SimpleController {
	
	@Autowired
	private BooklistDAO dao;
	public void setDao(BooklistDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("/faqViewpage.do")
	public void faq() {
		
	}
	
	@RequestMapping("/addrViewpageAPI.do")
	public void addr() {
		
	}
	
	@RequestMapping("/siteMap.do")
	public void sitemap() {
		
	}
	
	
	// �궗�꽌異붿쿇�룄�꽌 紐⑸줉
	@RequestMapping("/recommendedBooks.do")
	public void recommendedBooks(Model model) {
		model.addAttribute("list",dao.findAllRecom());
	}
	
	// �씠�떖�쓽 �씤湲곕룄�꽌 紐⑸줉
	@RequestMapping("/popularBook.do")
	public void popBookController(Model model) {
		List<BookVO> list = null; 
		list = dao.getPopBook();
		model.addAttribute("list", list);	
	}
	
	@RequestMapping(value = "/howtoInfo.do")
	public void howToInfo() {
	}
	
	// �떊李⑸룄�꽌 紐⑸줉
	@RequestMapping("/Newbooks.do")
	public ModelAndView NewbookList(){
		ModelAndView mav = new ModelAndView();
		List<BookVO> newbooklist = new ArrayList<BookVO>();
		newbooklist = dao.findAllNew();
		mav.addObject("newbooklist", newbooklist);
		return mav;
	}
	
}
