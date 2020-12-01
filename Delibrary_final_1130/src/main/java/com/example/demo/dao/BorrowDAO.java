package com.example.demo.dao;



import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.BorrowManager;
import com.example.demo.db.CustomerManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.BorrowVO2;

@Repository
public class BorrowDAO {
   



   
   
    public int insertBorrow(BorrowVO b) {
      return BorrowManager.insertBorrow(b);
   }
   
   
   public int getNextNo() {
      return BorrowManager.getNextNo();
   }
   //遺곸뭅 듃 紐⑸줉 異쒕젰
   public List<BorrowVO2> selectBycust_No(HashMap map){
      return BorrowManager.selectBycust_No(map);
   }
   
   //  異쒗쁽 솴 紐⑸줉 異쒕젰[ 슜 깮]
   public List<BorrowVO2> selectBycust_No2(HashMap map){
      return BorrowManager.selectBycust_No2(map);
   }
   //諛섎궔 쁽 솴 異쒕젰[ 슜 깮]
   public List<BorrowVO2> selectBycust_No3(HashMap map) {
      return BorrowManager.selectBycust_No3(map);
   }

   public int update(BorrowVO b) {
      // TODO Auto-generated method stub
      return BorrowManager.update(b);
   }
   
   public int update2(int bor_no) {
      return BorrowManager.update2(bor_no);
   }


   public int delete(int bor_no) {
      // TODO Auto-generated method stub
      return BorrowManager.delete(bor_no);
   }
   public int calB_no(int cust_no) {
      return BorrowManager.calB_no(cust_no);
   }
   // 紐⑤뱺  젙蹂  媛  졇 삤湲 [ 옱 꽦]
   public List<BorrowVO> findAll() {
      return BorrowManager.findAll();

   }


   public int getTotalCount2(HashMap map) {
      // TODO Auto-generated method stub
      return BorrowManager.getTotalCount2(map);
   }
   
   public int getTotalCount3(HashMap map) {
      // TODO Auto-generated method stub
      return BorrowManager.getTotalCount3(map);
   }
   
   // 현왕 나의도서 정보 대출현황 개수 세기
   public int getTotalCount_hw(HashMap map) {
	   // TODO Auto-generated method stub
	   return BorrowManager.getTotalCount_hw(map);
   }
   
   public int delay(int cust_no) {
      // TODO Auto-generated method stub
      return BorrowManager.delay(cust_no);
   }
   public int delay2(int cust_no) {
      // TODO Auto-generated method stub
      return BorrowManager.delay2(cust_no);
   }

}