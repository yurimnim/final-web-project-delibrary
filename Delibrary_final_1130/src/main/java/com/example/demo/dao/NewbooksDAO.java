package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.NewbooksManager;
import com.example.demo.vo.BookVO;


@Repository
public class NewbooksDAO {
	public List<BookVO> findAll(){
		return NewbooksManager.findAll();
	}
}
