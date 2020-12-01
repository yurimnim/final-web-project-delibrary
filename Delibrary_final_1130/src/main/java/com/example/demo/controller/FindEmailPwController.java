package com.example.demo.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.dao.FindEmailPwDao;
import com.example.demo.service.UserSha256;
import com.google.gson.Gson;

@Controller
public class FindEmailPwController {
	
	//깃깃깃깃깃깃깃깃깃
	@Autowired
	private FindEmailPwDao dao;
	
	
	@Autowired
	private MailSender javamailMailSender;

	public void setDao(FindEmailPwDao dao) {
		this.dao = dao;
	}
	
	public void setJavamailMailSender(MailSender javamailMailSender) {
		this.javamailMailSender = javamailMailSender;
	}
	

	//로그인: 가입 이메일 찾기
	@RequestMapping(value="/findEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String findEmail(String name, String m_phone) {
		System.out.println("이메일찾기 컨트롤러 동작함");
		System.out.println("이름:: " + name);
		System.out.println("전번:: " + m_phone);
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("m_phone", m_phone);
		String re = dao.FindEmail(map);
		System.out.println(re);
		return re;
	}
	
	@RequestMapping(value = "/emailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public void emailCheck() {
		
	}
	
	//회원가입: 이메일 중복체크
	@RequestMapping(value = "/emailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String emailCheck(@RequestParam (value="email")String email) {
		System.out.println("중복체크 동작함");
		System.out.println(email);
		String re = dao.checkEmail(email);
		System.out.println(re);
		return re;
	}
	
	
	//패스워드 이메일 보내는 메소드
	public String sendPwEmailExecute(String email, String name, String tempPw){
		String r  = "";
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject(name + " 님 Delibrary 계정 임시 비밀번호");
		mailMessage.setFrom("hello@delibrary.gov.kr");
		mailMessage.setText("안녕하세요. 회원님께 임시 비밀번호를 발급해드렸습니다.\n "
				+ "아래 임시 비밀번호로 로그인 뒤 회원정보 변경에서 비밀번호를 변경해 주세요!\n\n" + 
				 "임시 비밀번호: " + tempPw + "\n\n" + 
				"임시 비밀번호에 관련하여 궁금하신 점이나 개선사항 건의 시 hello@delibrary.gov.kr 으로 보내주시거나 \n"+
				 "사이트 내 Q&A 게시판을 이용해 주시기 바랍니다.\n\n"
				+"감사합니다. \n\n" + 				 
				"-팀 딜리브러리-" + "\n\n" 
				+ "딜리브러리 이용하러가기: http://localhost:8088/LoginPage.do");
		mailMessage.setTo(email);
			try {
				javamailMailSender.send(mailMessage);
			}catch (Exception e) {
				// TODO: handle exception'
				System.out.println("이메일보내기 오류 " + e.getMessage());
			}
		return r;
	}	
	
	//로그인: 비번찾기 창 ㅇㅋ
	@RequestMapping(value = "/pwEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendPwEmail(String name, String email) {
		System.out.println("이름 들어감 ::::" + name);
		System.out.println("이메일 들어감::::" + email);
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		String re = dao.sendPwEmail(map);
		int result = Integer.parseInt(re);
		System.out.println(result);
		if(result > 0) {
			String tempPw = randomPwGenerator();
			HashMap map2 = new HashMap();
			map2.put("email", email);
			map2.put("pw", UserSha256.encrypt(tempPw));
			dao.updatePw(map2);
			sendPwEmailExecute(email, name, tempPw);
		}
		return re;		
	}
	
	//패스워드변경 메소드
	@RequestMapping(value = "/pwChangeInEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String updatePw(String email, String pw) {
		HashMap map = new HashMap();
		pw = UserSha256.encrypt(pw);
		map.put("email", email);
		map.put("pw", pw);
		int re = dao.updatePw(map);
		return re + "";
	}
			
	//임시 비밀번호 만들기
	public String randomPwGenerator() {
		Random rand = new Random();
		String[] capital = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X","Y", "Z"};
		String[] smallLetter = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
		int a = rand.nextInt(capital.length);
		int b = rand.nextInt(smallLetter.length);
		String randNo = "";
		
		for(int i=0; i<5; i++) {
			randNo += rand.nextInt(9) + "";
		}
		
        String randomPw = smallLetter[b]+ randNo + capital[a];
		return randomPw;
	}
	
	@RequestMapping(value = "/pwChangeInEmail.do", method=RequestMethod.GET)
	public void updatePw() {

	}
	
	
//	@RequestMapping(value="/insertCustomerSuccess.do", method=RequestMethod.POST)
//	public void insertCustomerOk(String email, String pw){
//		
//	}
	
}
