package com.example.demo.controller;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.HomeDAO;
import com.example.demo.service.UserSha256;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.My_libraryVO;

@Controller
public class CustomerController {
   @Autowired
   private CustomerDAO dao;
   
   @Autowired
   private HomeDAO dao2;

   public void setDao(CustomerDAO dao) {
      this.dao = dao;
   }

   // 홈화면
   @RequestMapping("/Home.do")
   public void home(Model model, CustomerVO custVO, String loginOk, HttpServletRequest request) {
      if (request.getParameter("loginOk") != null) {
         HttpSession session = request.getSession();
         HashMap map = new HashMap();
         String email = request.getParameter("email");
         String password = request.getParameter("pw");
         
         System.out.println("password 시작::::::::::"+password); 
                  
       //패스워드 암호화
         
         password = UserSha256.encrypt(password);
         System.out.println("password 암호 이후~::::::::::"+password);            
         
         map.put("email",email);
         map.put("pw",password);
         System.out.println("email map.put함::::::::::"+email);
         System.out.println("password map.put함::::::::::"+password);

         custVO = dao.getLoginInfo(map);
         System.out.println("email 디비에서 겟함::::::::::"+custVO.getEmail());
         System.out.println("password 디비에서 겟함::::::::::"+custVO.getPw());
         
         if (email.equals(custVO.getEmail()) && password.equals(custVO.getPw())) {
            session.setAttribute("cust_no", custVO.getCust_no());

//            request.setAttribute("cust_no", custVO.getCust_no());
            session.setAttribute("cust_name", custVO.getName());
//            System.out.println(custVO.getName());
//            request.setAttribute("cust_name", custVO.getName());

         }
         
      }

      model.addAttribute("SRlist", dao2.getStaffRecommend());
      model.addAttribute("Newlist", dao2.getNewRecommend());
      model.addAttribute("HNlist", dao2.getHomePost(10));
      model.addAttribute("HMakinglist", dao2.getHomePost(20));
      model.addAttribute("HMarketlist", dao2.getHomePost(30));

//      HttpSession session = request.getSession();
//      request.setAttribute("cust_no", session.getAttribute("cust_no"));
//      request.setAttribute("cust_name", session.getAttribute("cust_name"));
   }

   
   //회원가입FORM
   @RequestMapping(value="/insertCustomer.do", method=RequestMethod.GET)
   public void insertCustomer() {
      
   }
   
   //회원가입 ok
   @RequestMapping(value="/insertCustomer.do", method=RequestMethod.POST)
   public ModelAndView insertCustomerOk(CustomerVO c, HttpServletRequest request, MultipartFile uploadFile, HttpSession session) {
      ModelAndView mav = new ModelAndView("redirect:/insertCustomerSuccess.do");
      
      // 파일 업로드
      String path = request.getRealPath("img");
      System.out.println(path);
      MultipartFile multipartFile = c.getUploadFile();
      String fname = uploadFile.getOriginalFilename();
    	  if(fname != null && !fname.equals("")) {
  			try {
  				byte[] data = uploadFile.getBytes();
  				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
  				fos.write(data);
  				fos.close();
  			}catch (Exception e) {
  				System.out.println("예외발생 insertCustomer 파일 : " + e.getMessage());
  			}
      }else {
    	  fname= "man1.png";
      }
    	  
      c.setFname(fname);
      System.out.println("fname : " + c.getFname());
      
      //비밀번호 암호화:SHA-256
      System.out.println("원래암호: " + c.getPw());
      String encPW = UserSha256.encrypt(c.getPw());
      c.setPw(encPW);
      System.out.println("바뀐암호: " + c.getPw());
      
      //주소addr1
      String addr1 = request.getParameter("addr1_a") + "," + request.getParameter("addr1_b");
      c.setAddr(addr1);
      
      //주소addr2
      String addr2 = request.getParameter("addr2_a") + "," + request.getParameter("addr2_b");
      c.setAddr2(addr2);
      
      
      //생일(있었는데요... 없었습니다)
      c.setBirthday(Date.valueOf("2020-01-01"));
      
      //매니저
     c.setManager("N");
      
      //장르선택
      String[] values = request.getParameterValues("genre");
    		String interest = "";
    	
    		for (int i = 0; i < values.length; i++) {
    			if (i == values.length-1) {
    				interest += values[i];
    			} else {
    				interest += (values[i] + ",");
    			}
    		}
    	 
    		c.setInterest(interest);
      
      int re = dao.insertCustomer(c);
      
      session.setAttribute("email", c.getEmail());
      
      //마이라이브러리 생성 
      My_libraryVO ml = new My_libraryVO();
      ml.setMl_no(c.getCust_no());
      ml.setCust_no(c.getCust_no());
      dao.insertMy_Library(ml);
  
      if(re<0) {
    	 mav.addObject("msg", "회원가입이 정상적으로 처리되지 않았습니다.");
         mav.setViewName("/error");
      }
      
      return mav;
   }

   
   
	//회원가입 환영
	@RequestMapping(value="/insertCustomerSuccess.do")
	public void insertCustomerOk(HttpSession session){
		String email = (String)session.getAttribute("email");
		System.out.println(email);
	}
	
   //로그인 FORM
   @RequestMapping(value="/LoginPage.do")
   public void logInForm() {
	
   }

   //로그아웃
   @RequestMapping(value="/logout.do")
   public ModelAndView logOut(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView("redirect:/LoginPage.do");
      HttpSession session = request.getSession();
      session.removeAttribute("cust_no");
      return mav;
   }
   
   
   //회원탈퇴ok
   @RequestMapping(value="/optOutCustomer.do")
   @ResponseBody
   public int deleteCustomerOk(String email, String pw, HttpSession session) {
      HashMap map = new  HashMap();
      pw = UserSha256.encrypt(pw);
      map.put("email",email);
      map.put("pw",pw);
      int result = dao.deleteCustomer(map);
      session.removeAttribute("cust_no");
      return result;
   }

   // 회원정보 디테일 and 수정
   @RequestMapping("/MyPage_Info.do")
   public void detail(int cust_no, Model model, HttpServletRequest request) {
      
      CustomerVO c = dao.findByCust_No(cust_no);
      
      request.setAttribute("c", c);
      String Email = c.getEmail();
      String id = Email.substring(0, Email.indexOf("@"));
      String email = Email.substring(Email.indexOf("@")+1);
      request.setAttribute("id", id);
      request.setAttribute("email", email);
      
   // 현왕 주소 유지되게끔 설정
   		// ==================================================================================
   		String addr2 = c.getAddr2();
   		String addr_num = addr2.substring(0, addr2.indexOf(","));
   		String addr_ref = addr2.substring(addr2.indexOf(",") + 1);
   		
   		String addr = c.getAddr();
   		String addr_1 = addr.substring(0, addr.indexOf(","));
   		String addr_2 = addr.substring(addr.indexOf(",") + 1);
   		
   		request.setAttribute("addr_1", addr_1);
   		request.setAttribute("addr_2", addr_2);
   		request.setAttribute("addr_num", addr_num);
   		request.setAttribute("addr_ref", addr_ref);
   		// =====================================================================================================>
      
      model.addAttribute("c",dao.findByCust_No(cust_no));
   }
}