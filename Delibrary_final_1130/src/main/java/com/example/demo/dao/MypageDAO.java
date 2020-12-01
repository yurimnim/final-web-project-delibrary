package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.MyPageManager;
import com.example.demo.vo.FolderVO;
import com.example.demo.vo.PostVO;

@Repository
public class MypageDAO {

	public List<FolderVO> getUserFolder(HashMap map) {
		return MyPageManager.getUserFolder(map);
	}
	
	public int folder_cnt(int cust_no) {
		return MyPageManager.folder_cnt(cust_no);
	}
	
	public int file_cnt(int cust_no) {
		return MyPageManager.file_cnt(cust_no);
	}
	
	public int file_cnt_Infol(HashMap map) {
		return MyPageManager.file_cnt_Infol(map);
	}
	
	public List<PostVO> getFol_one(HashMap map) {
		return MyPageManager.finbyFol_no(map);
	}
	
	public int updateMemo(HashMap map) {
		return MyPageManager.updateMemo(map);
	}
	
	public int deleteMyPage_file(int p_id) {
		return MyPageManager.deleteMyPage_file(p_id);
	}

	public int deleteMyPage_folder(int fol_no) {
		return MyPageManager.deleteMyPage_folder(fol_no);
	}
	
	public int insertMypage_folder(HashMap map) {
		return MyPageManager.insertMypage_folder(map);
	}
	
	public int getNextFol_no() {
		return MyPageManager.getNextFol_no();
	}
}
