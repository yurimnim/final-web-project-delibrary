package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.example.demo.vo.CustomerVO;

public class Mypage_main_Manager {
	
public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			System.out.println("static 예외발생: "+e.getMessage());
		}
	}
	
	//회원 전체 출력하기 [현왕]
	public static List<CustomerVO> findAll(){
		List<CustomerVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("cust.selectAll");
		session.close();
		return list;
	}
	
	//회원 갖고오기(detail)[현왕]
	public static CustomerVO findByCust_No(int cust_no) {
		CustomerVO c = null;
		SqlSession session = 
		sqlSessionFactory.openSession();
		c = session.selectOne("cust.selectByCust_No",cust_no);
		session.close();
		return c;
	}
	
}
