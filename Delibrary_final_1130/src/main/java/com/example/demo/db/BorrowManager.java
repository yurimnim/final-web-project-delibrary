package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.BorrowVO2;

public class BorrowManager {
   
public static SqlSessionFactory sqlSessionFactory;
   
   static {
      String resource = "com/example/demo/db/sqlMapConfig.xml";
      InputStream inputStream;
      try {
         inputStream = Resources.getResourceAsStream(resource);
         sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
      } catch (Exception e) {
         System.out.println("static  삁 쇅諛쒖깮: "+e.getMessage());
      }
   }
   
   
   public static int insertBorrow(BorrowVO b) {
      int re = -1;
      SqlSession session = sqlSessionFactory.openSession(true);
      re = session.insert("borrow.insertBorrow",b);
      session.close();
      return re;
   }
   
   
   public static int getNextNo() {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.getNextNo");
      session.close();
      return n;
   }
   //遺곸뭅 듃 異쒕젰


   //遺곸뭅 듃 異쒕젰
   public static List<BorrowVO2> selectBycust_No(HashMap map) {
      // TODO Auto-generated method stub
      List<BorrowVO2> list = null;
      SqlSession session=sqlSessionFactory.openSession();
      list=session.selectList("borrow.selectBycust_No", map);
      session.close();
      return list;
   }
   //  異쒗쁽 솴 異쒕젰
   public static List<BorrowVO2> selectBycust_No2(HashMap map) {
      // TODO Auto-generated method stub
      List<BorrowVO2> list = null;
      SqlSession session=sqlSessionFactory.openSession();
      list=session.selectList("borrow.selectBycust_No2", map);
      session.close();
      return list;
   }


   public static int update(BorrowVO b) {
      // TODO Auto-generated method stub
      int re = -1;
      SqlSession session
      = sqlSessionFactory.openSession(true);
      re= session.update("borrow.updateBorrow", b);
      session.close();
      return re;
      
   }
   
   //반납기능..
   public static int update2(int bor_no) {
      int re =  -1;
      SqlSession session=sqlSessionFactory.openSession(true);
      re = session.delete("borrow.updateBorrow2", bor_no);
      session.close();
      return re;
   }


   public static int delete(int bor_no) {
      int re = 1;
      SqlSession session = sqlSessionFactory.openSession(true);
      session.delete("borrow.deleteBorrow",bor_no);
      session.close();
      return re; 
   }
   
   public static int calB_no(int cust_no) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.calB_no",cust_no);
      session.close();
      return n;
   }
   
   // 紐⑤뱺  젙蹂  媛  졇 삤湲 [ 옱 꽦]
   public static List<BorrowVO> findAll() {
      List<BorrowVO> list = null;
      SqlSession session = sqlSessionFactory.openSession();
      list = session.selectList("borrow.findAll");
      System.out.println(" 뜲 씠 꽣  닔 : " + list.size());
      session.close();
      return list;
   }


   public static int getTotalCount(int cust_no) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.getTotalCount",cust_no);
      session.close();
      return n;
   }
   //  異  以  紐⑸줉
   public static int getTotalCount2(HashMap map) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.getTotalCount2",map);
      session.close();
      return n;
   }
   // 현왕 [ 나의도서 정보 대출현황 개수 세기 ]
   public static int getTotalCount_hw(HashMap map) {
	   int n = -1;
	   SqlSession session = sqlSessionFactory.openSession();
	   n = session.selectOne("borrow.getTotalCount_hw",map);
	   session.close();
	   return n;
   }
   //諛섎궔 쁽 솴 以  紐⑸줉
   public static int getTotalCount3(HashMap map) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.getTotalCount3",map);
      session.close();
      return n;
   }

   //諛섎궔 씠 젰 異쒕젰
   public static List<BorrowVO2> selectBycust_No3(HashMap map) {
      // TODO Auto-generated method stub
      List<BorrowVO2> list = null;
      SqlSession session=sqlSessionFactory.openSession();
      list=session.selectList("borrow.selectBycust_No3", map);
      session.close();
      return list;
   }
   //연체여부확인
   public static int delay(int cust_no) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.delay",cust_no);
      session.close();
      return n;
   }
   //연체일수 계산
   public static int delay2(int cust_no) {
      int n = -1;
      SqlSession session = sqlSessionFactory.openSession();
      n = session.selectOne("borrow.delay2",cust_no);
      session.close();
      return n;
   }
}