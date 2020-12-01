package com.example.demo.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.BorrowManager;
import com.example.demo.db.PostManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.PostVO;

@Repository
public class BookDAO {
	public BookVO findByNo(int b_no) {
		return BookManager.findByNo(b_no);
	}
	//북업데이트
	public int update(int b_no) {
		return BookManager.update(b_no);
	}
	 public int insertBook(BookVO b) {
		return BookManager.insertBook(b);
	}
	 //대여시 post 번호삽입
	public int getNextNo() {
		return BookManager.getNextNo();
	}
	 //대여시 post 번호삽입
	public int calB_count(int b_no) {
		return BookManager.calB_count(b_no);
	}
	//대여시 대여 책번호 삽입
	public int getNextNo2() {
		return BookManager.getNextNo2();
	}
	//내서재 목록 출력
	public List<BookVO> MyLibrary_list(HashMap map){
		return BookManager.MyLibrary_list(map);
	}
	
	// 도서테이블 모든 정보 출력[재성]
	public List<BookVO> findAll() {
		return BookManager.findAll();
	}
}

