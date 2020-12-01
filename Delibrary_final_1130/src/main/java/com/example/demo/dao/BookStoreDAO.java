package com.example.demo.dao;


import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BookstoreVO;

@Repository
public class BookStoreDAO {
	public BookstoreVO findByNo() {
		return BookManager.findByNo2();
	}
}
