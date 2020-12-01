package com.example.demo.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Message;
import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.PostVO;
import com.google.gson.Gson;

@Controller
public class InsertPostController {
   //용택 ajax - insert post and book
   @Autowired
   private PostDAO pdao;
      
   public void setPdao(PostDAO pdao) {
      this.pdao = pdao;
   }
   @Autowired
   private BookDAO bdao;
   
   
   
   public void setBdao(BookDAO bdao) {
      this.bdao = bdao;
   }
   @Autowired
   private BorrowDAO bbdao;
   

   public void setBbdao(BorrowDAO bbdao) {
      this.bbdao = bbdao;
   }

   @RequestMapping(value = "/insertPost", 
         produces = "application/json;charset=utf8")
   @ResponseBody
   public String insertPost(HttpSession session, HttpServletRequest request) {
      int group=50;
      int fol_no=Integer.parseInt(request.getParameter("FOL_NO"));
      //System.out.println(" 내용 가지나??"+fol_no);

      int p_id=pdao.getNextId(group);
      int p_no = pdao.getNextNo(group);
      
      String fname = request.getParameter("fname");
      String p_title = request.getParameter("b_title");
      String p_writer = request.getParameter("b_writer");
        int p_hit = 0;
      String p_content = "내용을 추가해주세요";
      int cust_no = Integer.parseInt(request.getParameter("cust_no"));
      
      
      
      PostVO p = new PostVO();
      p.setP_id(p_id);
      p.setP_no(p_no);
      p.setP_title(p_title);
      p.setP_writer(p_writer);
      p.setP_content(p_content);
      p.setP_hit(p_hit);
      p.setFname(fname);
      p.setCust_no(cust_no);
      p.setFol_no(fol_no);
      //      (#{p_id},#{p_no},#{p_title},#{p_writer},#{p_content},#{p_hit},sysdate,#{fname},#{cust_no})



      int re =pdao.insert2(p);      
      Gson gson = new Gson();
      return gson.toJson(new Message(re+""));
   }
   
   //대여시 추가되는 책
   @RequestMapping(value = "/insertBook", 
         produces = "application/json;charset=utf8")
   @ResponseBody
   public String insertBook(HttpSession session, HttpServletRequest request) {
      
      int b_no = bdao.getNextNo();
      String b_title = request.getParameter("b_title");
      String[] b_publisher_list = {"은행나무","시공주니어","보물창고","웅진주니어","주니어김영사","좋은책어린이","팩토리나인"
                            ,"지서연","흔들의자","더북컴퍼니","상상앤미디어","폭스코너","앨리스북클럽","흐름출판","델피노"
                            ,"문학동네","문학수첩","에듀윌","심슨북스","지식노마드","더퀘스트","민음사","부크크(Bookk)"
                            ,"전망","스토리존","창비"};
      Random random = new Random();
      int ran_num = random.nextInt(b_publisher_list.length);
      String b_publisher = b_publisher_list[ran_num];
      String b_writer = request.getParameter("b_writer");
      String String_b_year = request.getParameter("b_year");
      //2015-12-07T00:00:00.000+09:00 나와서 분리 시켜서 db에 넣어야한다.
      StringTokenizer tokenizer = new StringTokenizer(String_b_year, "T");
      String firstToken = tokenizer.nextToken();

      //DATE 변환
      java.sql.Date b_year = java.sql.Date.valueOf(firstToken);



      
      int b_price = Integer.parseInt(request.getParameter("b_price"));

      String b_image = request.getParameter("b_image");
      String b_detail = ""+request.getParameter("b_detail");

      System.out.println("값을 받아옵니다++"+b_detail);

      String b_index = "목차";
      int b_count = 10;

      
      //values(#{b_no},#{b_title},#{b_publisher},#{b_writer},#{b_year},#{b_price},#{b_image},#{b_detail})

      
      BookVO b = new BookVO();
      b.setB_no(b_no);
      b.setB_title(b_title);
      b.setB_publisher(b_publisher);
      b.setB_writer(b_writer);
      b.setB_year(b_year);
      b.setB_price(b_price);
      b.setB_image(b_image);
      b.setB_detail(b_detail);
      b.setB_index(b_index);
      b.setB_count(b_count);
      b.setC_no(1);



      int re =bdao.insertBook(b);      
      Gson gson = new Gson();
      return gson.toJson(new Message(re+""));
   }
   @InitBinder
   public void initBinder(WebDataBinder binder) {
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
   }
   
   //ajax -borrow 수정
   @RequestMapping(value = "/updateborrow", 
         produces = "application/json;charset=utf8")
   @ResponseBody 
   public String updateDept(HttpSession session, HttpServletRequest request) {
      session = request.getSession(true);
      int cust_no  =  (int) session.getAttribute("cust_no");
      int bor_no = Integer.parseInt(request.getParameter("bor_no"));

      int b_no = Integer.parseInt(request.getParameter("b_no"));

      String return_ok = request.getParameter("return_ok");
      String String_bor_date = request.getParameter("bor_date");
      String String_return_date = request.getParameter("return_date");
      java.sql.Date bor_date = java.sql.Date.valueOf(String_bor_date);
      java.sql.Date return_date = java.sql.Date.valueOf(String_return_date);
      

      BorrowVO b = new BorrowVO();
      b.setB_no(b_no);
      b.setBor_date(bor_date);
      b.setBor_no(bor_no);
      b.setCust_no(cust_no);
      b.setReturn_date(return_date);
      b.setReturn_ok(return_ok);
      int re =bbdao.update(b);      


      
      
      Gson gson = new Gson();
      return gson.toJson(new Message(re+""));
      //그성공여부를 제이슨으로 반환하고 싶다 인트-->스트링 변환
   }
   
   @RequestMapping(value = "/deleteborrow", 
         produces = "application/json;charset=utf8")
   @ResponseBody
   public String deleteDept(int bor_no) {
      System.out.println("수신된 데이터:"+bor_no);
      int re = bbdao.delete(bor_no);      
      Gson gson = new Gson();
      return gson.toJson(new Message(re+""));
   }
   
   
   
   // 반납대기 참조 현황 마이페이지 폴더 삭제
   @RequestMapping(value = "/update_borrow", method = RequestMethod.POST)
   @ResponseBody
   public int deleteMyPage_folder (@RequestParam(value = "fol_no_arr[]") List<Integer> fol_no_arr) {
      int[] result = new int[fol_no_arr.size()];
      
      int re = -1;
      for(int i=0; i<fol_no_arr.size(); i++) {
         result[i] = bbdao.update2(fol_no_arr.get(i)); //{1,1,1,-1}
      }
      
      root1:
         for(int i=0; i<result.length; i++) {
            
            // 만약 한개라도 지워지지 않은 것이 있는 것을 판별
            if(result[i] == -1) { //지워지지 않은게 있다는거잖아
               re = -1; // 일단 다 안지워졌다고 보는거지
               
               root2:
                  for(int j=0; j<result.length; j++) {
                     if(result[j] == 1) { //다 안지워진건 아니네
                        re = -2; // 일부만 지워졌네  
                        break root1;
                     }
                  }
               
            } else { //모두 지워졌을 경우
               re = 1;
               break;
            }
         }
      
      return re;
   }
   
}