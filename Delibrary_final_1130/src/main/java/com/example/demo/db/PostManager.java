package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.PostVO;


public class PostManager {
	
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
	
	//게시판 전체 게시글수
	public static int getTotalCount(HashMap map) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession();
		re=session.selectOne("post.selectCount", map);
		session.close();
		return re;
	}
	
	//게시판 전체글 가져오기
	public static List<PostVO> findAll(HashMap map){
		List<PostVO> list = null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("post.selectAll", map);
		session.close();
		return list;
	}
	
	//게시글 상세보기
	public static PostVO findById(HashMap map) {
		PostVO p = null;
		SqlSession session=sqlSessionFactory.openSession();
		p=session.selectOne("post.selectById", map);
		session.close();
		return p;
	}
	
	//게시글 조회수 
	public static int updateHit(int p_id) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.update("post.updateHit", p_id);
		session.close();
		return re;
	}
	
	//새글 Id 불러오기
	public static int getNextId(int group) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession();
		re=session.selectOne("post.nextId", group);
		session.close();
		return re;
	}
	//새글 번호 불러오기
	public static int getNextNo(int group) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession();
		re=session.selectOne("post.nextNo", group);
		session.close();
		return re;
	}
	//새글 작성
	public static int insert(HashMap map) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
//		//새글 Id
//		int p_id=session.selectOne("post.nextId");
//		p.setP_id(p_id);
//		//새글 No
//		int p_no=session.selectOne("post.nextNo");
//		p.setP_no(p_no);
		
		re=session.insert("post.insert", map);
		session.close();
		return re;
	}
	
	//게시글 수정
	public static int update(PostVO p) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.update("post.update", p);
		session.close();
		return re;
	}
	
	//게시글 삭제
	public static int delete(HashMap map) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.delete("post.delete", map);
		session.close();
		return re;
	}
	
/////////////////////////////////////////////////////////////////////////	
		//내서재 추가 용택
		public static int insert2(PostVO p) {
			int re =  -1;
			SqlSession session=sqlSessionFactory.openSession(true);		
			re=session.insert("post.insert2", p);
			session.close();
			return re;
		}
		
		//내서재 출력 용택
		public static List<PostVO> My_list(HashMap map){
			List<PostVO> list = null;
			SqlSession session=sqlSessionFactory.openSession();
			list=session.selectList("post.My_list", map);
			session.close();
			return list;
		}
/////////////////////////////////////////////////////////////////////////	
		
		//게시판 전체글 가져오기 현왕
	   public static List<PostVO> findAll_fol(HashMap map){
	      List<PostVO> list = null;
	      SqlSession session=sqlSessionFactory.openSession();
	      list=session.selectList("post.selectAll_fol", map);
	      session.close();
	      return list;
	   }
	  //게시판 전체글 가져오기[재성]
	 		public static List<PostVO> findAll_manager(){
	 			List<PostVO> list = null;
	 			SqlSession session=sqlSessionFactory.openSession();
	 			list=session.selectList("post.findAll");
	 			session.close();
	 			return list;
	 }
}




















