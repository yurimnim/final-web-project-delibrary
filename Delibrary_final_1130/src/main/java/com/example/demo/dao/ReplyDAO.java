package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.ReplyManager;
import com.example.demo.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	
	//댓글 불러오기
	public List<ReplyVO> findAll(HashMap map){
		return ReplyManager.findAll(map);
	}
	
	//다음 댓글번호
	public int getNextNo() {
		return ReplyManager.getNextNo();
	}
	
	//새로운 댓글 작성
	public int insert(HashMap map) {
		return ReplyManager.insert(map);
	}

	//댓글수정
	public int update(HashMap map) {
		return ReplyManager.update(map);
	}
	
	//댓글삭제
	public int delete(HashMap map) {
		return ReplyManager.delete(map);
	}
	
}
