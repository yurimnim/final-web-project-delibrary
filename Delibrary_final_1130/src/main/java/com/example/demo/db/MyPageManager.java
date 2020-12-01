package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.FolderVO;
import com.example.demo.vo.PostVO;

public class MyPageManager {

public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		try {
		InputStream inputStream=Resources.getResourceAsStream(resource);		
		sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.print("�삁�쇅諛쒖깮:"+e.getMessage());
		}
	}
	
	// 마이페이지 폴더목록
	public static List<FolderVO> getUserFolder(HashMap map){
		List<FolderVO> flist = null;
		SqlSession session = sqlSessionFactory.openSession();
		flist = session.selectList("mypage.selectAllFolder", map);
		session.close();
		return flist;
	}

	// 마이페이지 폴더개수
	public static int folder_cnt(int cust_no){
		int re = 0;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("mypage.selectFolder_cnt", cust_no);
		session.close();
		return re;
	}
	
	// 폴더 속 파일 목록
	public static List<PostVO> finbyFol_no(HashMap map) {
		List<PostVO> plist = null;
		SqlSession session = sqlSessionFactory.openSession();
		plist = session.selectList("mypage.selectByFolder", map);
		session.close();
		return plist;
	}
	
	// 나만의 게시판 메모 수정
	public static int updateMemo(HashMap map) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.update("mypage.updateMemo", map);
		session.close();
		return re;
	}
	
	// 마이페이지 전체 도서 개수
	public static int file_cnt(int cust_no) {
		int re = 0;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("mypage.selectFile_cnt", cust_no);
		session.close();
		return re;
	}
	
	// 마이페이지 전체 도서 개수
	public static int file_cnt_Infol(HashMap map) {
		int re = 0;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("mypage.selectFile_cnt_Infol", map);
		session.close();
		return re;
	}
	
	// 마이페이지 파일 삭제
	public static int deleteMyPage_file(int p_id) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.delete("mypage.deleteMyPage_file", p_id);
		session.close();
		return re;
	}

	
	// 마이페이지 폴더 삭제
	public static int deleteMyPage_folder(int fol_no) {
		int re =  -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.delete("mypage.deleteMyPage_folder", fol_no);
		session.close();
		return re;
	}
	
	//마이페이지 폴더 추가
	public static int insertMypage_folder(HashMap map) {
		int re = -1;
		SqlSession session=sqlSessionFactory.openSession(true);
		re = session.delete("mypage.insertMyPage_folder", map);
		session.close();
		return re;
	}
	
	public static int getNextFol_no() {
		int n = 0;
		SqlSession session=sqlSessionFactory.openSession();
		n = session.selectOne("mypage.getNextFolNo");
		session.close();
		return n;
	}
	
}
