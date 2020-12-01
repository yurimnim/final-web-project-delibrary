package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BookVO;
import com.example.demo.vo.BookstoreVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.PostVO;



public class BooklistManager {
	
public static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory =
		  new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	// 사서추천도서 목록
	public static List<BookVO> findAllRecom() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("book.findAllRecom");
		session.close();
		return list;
	}
	
	// 이달의 인기도서 목록
	public static List<BookVO> getPopBook() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("book.getPopBook");
		session.close();
		return list;
	}
	
	// 신착도서 목록
	public static List<BookVO> findAllNew(){
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("book.selectAllNew");
		session.close();
		return list;
	}

}