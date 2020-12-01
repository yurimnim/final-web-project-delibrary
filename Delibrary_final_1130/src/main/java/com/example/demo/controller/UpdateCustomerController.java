package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.service.UserSha256;
import com.example.demo.vo.CustomerVO;

@Controller
@RequestMapping("/UpdateCustomer.do")
public class UpdateCustomerController {
	
	@Autowired
	private CustomerDAO dao;

	public void setDao(CustomerDAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public void form(int cust_no, Model model) {
		model.addAttribute("c", dao.findByCust_No(cust_no));
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, CustomerVO c, MultipartFile uploadFile) {
		String path = request.getRealPath("img");
		String Email = request.getParameter("id")+"@"+request.getParameter("email");

		String password = request.getParameter("pw");
		System.out.println("password:::::"+password);
		String encPW = UserSha256.encrypt(password);
		System.out.println("encPW:::::::"+encPW);
		
		if(password.length() > 16) {
			c.setPw(password);
		}else {
			c.setPw(encPW);
		}
		
// ==== 현왕 주소 값 받아와서 DB로 넘기게끔 설정 ========================================================================================
		String addr_ref = request.getParameter("addr_ref");
		
		String addr = request.getParameter("addr_1")+","+request.getParameter("addr_2");
		String addr2 = request.getParameter("addr_num")+","+request.getParameter("addr_ref");
		
		// 주소 변경안하고 그냥 변경하기 버튼 눌렀을때, addr_ref가 계속 추가되는 현상 방지하기 위한 if문
		// addr에 addr_ref가 포함되있으면 다시 리셋 시킨다는 if문
		if(addr.contains(addr_ref)) {
			addr = addr.substring(0, addr.indexOf(" (")) +","+request.getParameter("addr_2");
	     }
		
		c.setAddr2(addr2);
		c.setAddr(addr);
		c.setEmail(Email);
// ===========================================================================================================================
		
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
		
// ============= 현왕 oldFname 추가======
		String oldFname = c.getFname();
// ===================================
		
		String fname = uploadFile.getOriginalFilename();
		if(fname != null && !fname.equals("")) {
			c.setFname(fname);
			try {
				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				System.out.println("path:::::::" + path);
				System.out.println("fname:::::::" + fname);
				System.out.println("fos:::::::" + fos);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println("예외발생 updateCustomer : " + e.getMessage());
			}
			c.setFname(fname);
        } else{
// =========== oldFname set으로 추가====
           c.setFname(oldFname);
// ===================================
        }

		ModelAndView mav = new ModelAndView("redirect:/MyPage_Info.do?cust_no="+c.getCust_no());
		int re = dao.update(c);
		if(re <= 0) {
			mav.addObject("msg", "오류가 발생하였습니다.");
			mav.setViewName("error");
		}else {
			if(fname != null && !fname.equals("") && !c.getFname().equals("")) {
// ============================================ oldFname으로 변경 ==
				File file = new File(path + "/" + oldFname);
// ==============================================================
//				file.delete();
			}
		}
		return mav;
	}
}
