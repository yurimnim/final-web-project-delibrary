package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.ReplyVO;


public class ReplyManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		try {
		InputStream inputStream=Resources.getResourceAsStream(resource);		
		sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.print("예외발생:"+e.getMessage());
		}
	}
	
	//전체댓글 가져오기
	public static List<ReplyVO> findAll(HashMap map){
		List<ReplyVO> list = null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("reply.selectAll", map);
		session.close();
		return list;
	}
	//다음댓글번호
	public static int getNextNo() {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession();
		re=session.selectOne("reply.nextNo");
		session.close();
		return re;
	}
	
	//새로운 댓글
	public static int insert(HashMap map) {
		int re=-1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re=session.insert("reply.insert",map);
		session.close();
		return re;
	}
	
	//댓글 수정
	public static int update(HashMap map) {
		int re=-1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re=session.update("reply.update",map);
		session.close();
		return re;
	}
	
	//댓글 삭제
	public static int delete(HashMap map) {
		int re=-1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re=session.delete("reply.delete",map);
		session.close();
		return re;
	}
}




















