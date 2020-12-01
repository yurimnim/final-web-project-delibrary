package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.My_libraryVO;

@Repository
public class CustomerDAO {
	
	//회원가입
	public int insertCustomer(CustomerVO c) {
		return CustomerManager.insertCustomer(c);
	}
	
	//마이라이브러리
	public int insertMy_Library(My_libraryVO ml) {
		return CustomerManager.insertMy_library(ml);
	}
	
	//회원탈퇴
	public int deleteCustomer(HashMap map) {
		return CustomerManager.deleteCustomer(map);
	}

	//로그인
	public CustomerVO logIn(HashMap map) {
		return CustomerManager.logInCustomer(map);
	}

	//회원정보 전체 출력 확인용[현왕]
	public List<CustomerVO> findAll(){
		return CustomerManager.findAll();
	}
	
	//회원정보 받아오기[현왕]
	public CustomerVO findByCust_No(int cust_no) {
		return CustomerManager.findByCust_No(cust_no);
	}
	
	//회원정보 수정하기[현왕]
	public int update(CustomerVO c) {
		return CustomerManager.update(c);
	}
	
	// 재성씨가 넣은 부분
	public CustomerVO getLoginInfo(HashMap map) {
		// TODO Auto-generated method stub
		return CustomerManager.getLoginInfo(map);
	}
}