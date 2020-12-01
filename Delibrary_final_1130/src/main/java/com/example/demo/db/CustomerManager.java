package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.My_libraryVO;

public class CustomerManager {
	
public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			System.out.println("static 오류: "+e.getMessage());
		}
	}
	
	//회원가입
	public static int insertCustomer(CustomerVO c) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		int n = session.selectOne("customer.getNextNo");
		c.setCust_no(n);
		re = session.insert("customer.insertCustomer",c);
		session.close();
		return re;
	}
	
	//회원가입 시 마이라이브러리 추가 
	public static int insertMy_library(My_libraryVO ml) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.insert("customer.insert_library",ml);
		session.close();
		return re;
	}
	
	//회원탈퇴
	public static int deleteCustomer(HashMap map) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int re = session.delete("customer.deleteCustomer",map);
		session.close();
		return re;
	}
	
	//로그인정보
	public static CustomerVO getLoginInfo(HashMap map) {
		CustomerVO c = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		c  = session.selectOne("customer.getLoginInfo",map);
		session.close();
		return c;
	}
	
	//
	public static CustomerVO logInCustomer(HashMap map) {
		CustomerVO c = null;
		SqlSession session = sqlSessionFactory.openSession(true);
		c  = session.selectOne("customer.",map);
		session.close();
		return c;
	}
	
	//회원 전체 출력하기 [현왕]
	public static List<CustomerVO> findAll(){
		List<CustomerVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("customer.selectAll");
		session.close();
		return list;
	}
	
	//회원 갖고오기(detail)[현왕]
	public static CustomerVO findByCust_No(int cust_no) {
		CustomerVO c = null;
		SqlSession session = 
		sqlSessionFactory.openSession();
		c = session.selectOne("customer.selectByCust_No",cust_no);
		session.close();
		return c;
	}
	
	//회원 수정 [현왕]
	public static int update(CustomerVO c) {
		int re = -1;
		SqlSession session
		= sqlSessionFactory.openSession(true);
		re= session.update("customer.updateCustomer", c);
		session.close();
		return re;
	}
}