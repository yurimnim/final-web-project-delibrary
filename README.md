# final-web-project-delibrary📖
## 자바 웹개발 과정 파이널 팀 프로젝트 : 도서관 웹서비스 딜리브러리

## 1.구현기간
2020. 10.01 ~ 2020.11.30

## 2.개발개요
MVC패턴을 활용한 온라인 도서관 대여 서비스 제공하는 웹사이트 제작 

## 3.기술스택
  - 프론트: HTML/CSS, Javascript, Jquery, Bootstrap, JSP
  - 백: Java, OracleDB, SQLDeveloper, SpringMVC, MyBatis, Ajax

## 4. 주요구현기능

  ### A. 홈화면 검색창 디자인  
  
  ![searchbar](delibraryGIF/01.home.gif)
  
  ✔️ 홈화면을 새로고침 할때마다 랜덤으로 도서관 도서에 관련된 헤드라인 글귀, 
  도서관 이미지, 이미지에 맞는 장소가
  나오는 디자인을 구현.  
  
  ```javascript 
   //홈헤딩 이미지
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('../img/" + images[getImage] + "')";
  ```
  
  
  
  ### B. 회원가입
  ![insertCustomer](delibraryGIF/02.join.gif)
  
  회원가입 뷰페이지, 기능 구현.  
  
  __💡기능 하이라이트💡__  
  
   ✔️ Ajax를 이용한 메일 중복확인 기능
   ![insertCustomer](delibraryGIF/03.join_01.gif)
   
   ✔️ 정규식을 이용한 비밀번호 유효성 검사
   ![insertCustomer](delibraryGIF/04.join_02.gif)
   
   
   ✔️ KakaoAPI를 이용한 우편번호 검색기능
   ![insertCustomer](delibraryGIF/05.join_04.gif)
   
   ✔️ 세션유지를 통한 회원가입 성공 Welcome 페이지 구현
   ![insertCustomer](delibraryGIF/06.join_05.gif)
 
   
   
   
   
  
  
  
  

   
  


