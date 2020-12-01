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
import com.example.demo.vo.FolderVO;



public class FolderManager {
	
public static SqlSessionFactory sqlSessionFactory;
	
	static {
		try {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory =
		  new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.println("?òà?ô∏Î∞úÏÉù:"+e.getMessage());
		}
	}
	
		
	public static List<FolderVO> findByNo(HashMap map) {
		List<FolderVO> f = null;
		SqlSession session
		= sqlSessionFactory.openSession();
		f = session.selectList("folder.selectByNo",map);
		session.close();
		return f;
	}
	
	public static int pageByfolder(int cust_no) {
		int n = -1;
		SqlSession session = sqlSessionFactory.openSession();
		n = session.selectOne("folder.pageByfolder",cust_no);
		session.close();
		return n;
	}
	
}