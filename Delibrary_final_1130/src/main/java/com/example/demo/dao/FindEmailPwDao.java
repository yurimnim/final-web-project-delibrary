package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.db.EmailPwCheckManager;

@Repository
public class FindEmailPwDao {
	
	//로그인: 가입 이메일 찾기
	public String FindEmail(HashMap map) {
		return EmailPwCheckManager.findEmail(map);
	}
	
	//로그인: 비번 바꿔주는 링크 보내주는 메일
	public String sendPwEmail(HashMap map) {
		return EmailPwCheckManager.sendPwEmail(map);
	}
	
	//로그인:메일로 보낸 페이지 링크에서 비밀번호 변경
	public int updatePw(HashMap map) {
		return EmailPwCheckManager.updatePw(map);
	}

	//회원가입: 이메일 중복체크
	public String checkEmail(String email) {
		return EmailPwCheckManager.checkEmail(email);
	}
	
}
