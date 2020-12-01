package com.example.demo.db;

import java.io.InputStream;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BookVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

public class DBManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/DB/sqlMapConfig.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {

			System.out.println("static 오류: "+e.getMessage());

		}
	}
	
	// Ȩȭ�� �缭��õ���� �̾ƿ��� �޼ҵ�
	public static List<BookVO> getStaffRecommend() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getStaffRecommend");
		session.close();
		return list;
	}
	
	// Ȩȭ�� ���۵��� �̾ƿ��� �޼ҵ�
	public static List<BookVO> getNewRecommend() {
		List<BookVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getNewRecommend");
		session.close();
		return list;
	}
	
	// Ȩȭ�� �Խñ� �̾ƿ��� �޼ҵ�
	public static List<PostVO> getHomePost(int group) {
		List<PostVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getHomePost", group);
		session.close();
		return list;
	}
	
	// �α��� �ÿ� ȸ�������� �ִ��� Ȯ���ϴ� �޼ҵ�
	public static CustomerVO getCustInfo(CustomerVO custVO) {
		CustomerVO vo = null;
		SqlSession session = sqlSessionFactory.openSession();
		vo = session.selectOne("main.getCustInfo", custVO);
		session.close();
		return vo;
	}
	
	// �Խ������� �̵�
	public static List<PostVO> getpostList(Map map) {
		List<PostVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("main.getpostList", map);
		session.close();
		return list;
	}
	
	// ����¡ ó���� ���� ��� ���ù� ������ �޾ƿ��� �޼ҵ�
	public static int getTotalCount(Map map) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("main.getTotalCount", map);
		session.close();
		return re;
	}
	
	// 관리자 페이지에서 수정할 때 사용하는 메소드
	public static void updateFromManager(Map map) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String i = (String) map.get("i");
		if (i.equals("0")) {
			session.update("main.update-cust", map);
		}
		
		if (i.equals("1")) {
			session.update("main.update-book", map);
		}
		
		if (i.equals("2")) {
			session.update("main.update-post", map);
		}
		
		if (i.equals("3")) {
			session.update("main.update-borrow", map);
		}
		session.close();
	}

	// 관리자 페이지에서 삭제할 때 사용하는 메소드
	public static void deleteFromManager(Map map) {
		SqlSession session = sqlSessionFactory.openSession(true);
		String i = (String) map.get("i");
		if (i.equals("0")) {
			session.delete("main.delete-cust", map);
		}
		
		if (i.equals("1")) {
			session.delete("main.delete-book", map);
		}
		
		if (i.equals("2")) {
			session.delete("main.delete-post", map);
		}
		
		if (i.equals("3")) {
			session.delete("main.delete-borrow", map);
		}
		session.close();
	}
}