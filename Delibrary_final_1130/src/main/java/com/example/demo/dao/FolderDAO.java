package com.example.demo.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.FolderManager;
import com.example.demo.vo.FolderVO;

@Repository
public class FolderDAO {
	
	//폴더 리스트 뽑아오기
	public List<FolderVO> findByNo(HashMap map) {
		return FolderManager.findByNo(map);
	}
	
	//폴더 관련/... 기억이잘...
	public int pageByfolder(int cust_no) {
		return FolderManager.pageByfolder(cust_no);
	}
}
