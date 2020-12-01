package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.CustomerManager;
import com.example.demo.vo.CustomerVO;

@Repository
public class Mypage_main_DAO {

	//나의도서정보 회원 전체 출력 확인용[현왕]
	public List<CustomerVO> findAll(){
		return CustomerManager.findAll();
	}
	
	//나의도서정보 회원 받아오기[현왕]
	public CustomerVO findByCust_No(int cust_no) {
		return CustomerManager.findByCust_No(cust_no);
	}
}
