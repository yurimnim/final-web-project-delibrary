package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BookStoreDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.FolderDAO;

@Controller
public class DetailBookController {
   @Autowired
   private BookDAO dao;

   public void setDao(BookDAO dao) {
      this.dao = dao;
   }

   @Autowired
   private FolderDAO fdao;
   
   public void setFdao(FolderDAO fdao) {
      this.fdao = fdao;
   }

   @Autowired
   private BorrowDAO bdao;
   
   public void setBdao(BorrowDAO bdao) {
      this.bdao = bdao;
   }





   @RequestMapping("/detailBook.do")
   public void list(int b_no, Model model, HttpServletRequest request) {
      HttpSession session = request.getSession(true);
      if (session.getAttribute("cust_no")==null) {
          model.addAttribute("days",0);
      }else {
    	  HashMap map = new HashMap();
    	  int cust_no  =  (int) session.getAttribute("cust_no");
    	  System.out.println(cust_no+":::::::::::::");
    	  int delay = bdao.delay(cust_no);
         //만약 연체가 있으면 값을 싣는다.
         System.out.println(delay + ":@:@:::::::::::::::::::::");
         if(delay > 0) {
            //연체일수를 넣습니다.
            model.addAttribute("days",bdao.delay2(cust_no));
         }else {
            model.addAttribute("days",0);

         }
         System.out.println("cust_no : ddddddddd?s" + cust_no);
         map.put("cust_no",cust_no);
         model.addAttribute("f",fdao.findByNo(map));


      }

      int b_count2 = bdao.calB_no(b_no);
      model.addAttribute("b", dao.findByNo(b_no));
      model.addAttribute("sumbook",b_count2);
      model.addAttribute("query", request.getParameter("query"));
      System.out.println(request.getParameter("query"));
   }
}