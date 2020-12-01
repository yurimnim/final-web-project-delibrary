package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.QnaManager;
import com.example.demo.vo.PostVO;

@Repository
public class QnaDAO {
	//목록
	public List<PostVO> findAll(HashMap map){
		return QnaManager.findAll(map);
	}
	//총 글의 수
	public int getTotalCount(HashMap map) {
		return QnaManager.getTotalCount(map);
	}
	//디테일
	public PostVO getQna(int p_id) {
		return QnaManager.findById(p_id);
	}
	//새글 Id 불러오기
	public int getNextId() {
		return QnaManager.getNextId();
	}
	//새글 번호 불러오기
	public int getNextNo() {
		return QnaManager.getNextNo();
	}
	//게시글 조회수
	public int updateHit(int p_id) {
		return QnaManager.updateHit(p_id);
	}	
		
	//글쓰기
	public int insert(HashMap map) {
		return QnaManager.insert(map);
	}
	//글수정
	public int update(PostVO p) {
		return QnaManager.update(p);
	}
	//글삭제
	public int delete(HashMap map) {
		return QnaManager.delete(map);
	}
}
