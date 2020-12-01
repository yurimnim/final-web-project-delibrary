package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.db.PostManager;
import com.example.demo.vo.PostVO;

@Repository
public class PostDAO {
	
	//게시판 전체 게시글수
	public int getTotalCount(HashMap map) {
		return PostManager.getTotalCount(map);
	}	
	
	//게시판 전체글 가져오기
	public List<PostVO> findAll(HashMap map){
		return PostManager.findAll(map);
	}
	
	//게시글 상세보기
	public PostVO findById(HashMap map) {
		return PostManager.findById(map);
	}
	
	//게시글 조회수
	public int updateHit(int p_id) {
		return PostManager.updateHit(p_id);
	}
	
	//새글 번호 불러오기
	public int getNextId(int group) {
		return PostManager.getNextId(group);
	}
	//새글 번호 불러오기
	public int getNextNo(int group) {
		return PostManager.getNextNo(group);
	}
	//새글 작성
	public int insert(HashMap map) {
		return PostManager.insert(map);
	}
	
	//글 수정
	public int update(PostVO p) {
		return PostManager.update(p);
	}
	
	//글 삭제
	public int delete(HashMap map) {
		return PostManager.delete(map);
	}
	
	// 홈화면에서 커뮤니티 클릭 or 공지사항으로 이동[재성]
		public List<PostVO> getpostList(Map map) {
			return DBManager.getpostList(map);
		}
	
	// 페이징 처리 시 총 게시물 목록을 받아오는 메소드[재성]
	public int getTotalCount(Map map) {
		return DBManager.getTotalCount(map);
	}
	
	//포스트 추가[용택]
	public int insert2(PostVO p) {
		return PostManager.insert2(p);
	}
	//내서재 목록 출력[용택]
	public List<PostVO> My_list(HashMap map){
		return PostManager.My_list(map);
	}
	
	// 폴더에 따른 게시판 전체글 가져오기[현왕]
   public List<PostVO> findAll_fol(HashMap map){
      return PostManager.findAll_fol(map);
   }
   
   // 관리자 게시판 전체글 가져오기[재성]
 	public List<PostVO> findAll_manager(){
 		return PostManager.findAll_manager();
 	}
}
