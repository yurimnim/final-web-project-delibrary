package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.PostVO;


public class QnaManager {
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
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//새글 번호 불러오기
	public static int getNextNo() {
	      int re =  -1;
	      SqlSession session=sqlSessionFactory.openSession();
	      re=session.selectOne("qna.nextNo");
	      session.close();
	      return re;
	}

	//새글 Id 불러오기
	public static int getNextId() {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession();
		re=session.selectOne("qna.nextId");
		session.close();
		return re;
	}
	//목록
	public static List<PostVO> findAll(HashMap map){
		List<PostVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("qna.selectAll", map);
		session.close();
		return list;
	}
	//총 글의 수
	public static int getTotalCount(HashMap map) {
		int re =  -1;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("qna.selectCount",map);
		session.close();
		return re;
	}
	//디테일
	public static PostVO findById(int p_id) {
		// TODO Auto-generated method stub
		PostVO p = null;
		SqlSession session = sqlSessionFactory.openSession();
		p = session.selectOne("qna.selectById",p_id);
		session.close();
		return p;
	}
	//조회수
	public static int updateHit(int p_id) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.update("qna.updateHit", p_id);
		session.close();
		return re;
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//글쓰기
	public static int insert(HashMap map) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.insert("qna.insert", map);
		session.close();
		return re;
	}
	//수정
	public static int update(PostVO p) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.update("qna.update", p);
		session.close();
		return re;
	}
	//삭제
	public static int delete(HashMap map) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.delete("qna.delete", map);
		session.close();
		return re;
	}

}

