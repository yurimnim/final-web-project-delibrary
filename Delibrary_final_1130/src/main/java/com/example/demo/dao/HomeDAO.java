package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.PostVO;

@Repository
public class HomeDAO {
   
   // Ȩȭ�� �缭��õ���� ����Ʈ �̾ƿ���  �޼ҵ�
   public List<BookVO> getStaffRecommend() {
      return DBManager.getStaffRecommend();
   }
   
   // Ȩȭ�� ���۵��� ����Ʈ �̾ƿ��� �޼ҵ�
   public List<BookVO> getNewRecommend() {
      return DBManager.getNewRecommend();
   }
   
   // Ȩȭ�鿡 �Խñ� ����Ʈ �̾ƿ��� �޼ҵ�
   public List<PostVO> getHomePost(int group) {
      return DBManager.getHomePost(group);
   }
   
   // 관리자 페이지에서 수정할 때 사용하는 메소드
   public void updateFromManager(Map map) {
	   DBManager.updateFromManager(map);
   }

   // 관리자 페이지에서 삭제할 때 사용하는 메소드
   public void deleteFromManager(Map map) {
	   DBManager.deleteFromManager(map);
   }
}