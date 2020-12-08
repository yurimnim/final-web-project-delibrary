# final-web-project-delibrary📖
## 자바 웹개발 과정 파이널 팀 프로젝트 : 도서관 웹서비스 딜리브러리
  
## 1.구현기간
2020. 10.01 ~ 2020.11.30
  
## 2. 참여인원 
[📘박재성](https://github.com/wotjd0860)  
[📗오김인](https://github.com/inhalin)  
[📒오나영](https://github.com/ohna93)  
📙이유림 👋me  
[📓양현왕](https://github.com/YangHyeonWang)  
[📔홍용택](https://github.com/yongtaek12)  
  
## 3.개발개요
MVC패턴을 활용한 온라인 도서관 대여 서비스 제공하는 웹사이트 제작 
  
## 4.기술스택
  - 프론트: HTML/CSS, Javascript, Jquery, Bootstrap, JSP
  - 백: Java, OracleDB, SQLDeveloper, SpringMVC, MyBatis, Ajax
  
## 5. 주요구현기능

  ### 🌱 홈화면 검색창 디자인  
  
  ![searchbar](delibraryGIF/01.home.gif)
  
  ✔️ 홈화면을 새로고침 할때마다 랜덤으로 도서관 도서에 관련된 헤드라인 글귀, 
  도서관 이미지, 이미지에 맞는 장소가  
  나오는 디자인을 구현.  
  
  ```javascript 
   //홈헤딩 이미지 랜덤출력 구현예시
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('../img/" + images[getImage] + "')";
  ```
  
    
  
  ### 🌱 회원가입/탈퇴
  ![insertCustomer](delibraryGIF/02.join.gif)
  
  회원가입 및 탈퇴 뷰페이지, 관련기능 전체구현.  
  
  **💡기능 하이라이트💡**
    
   ✔️ [Ajax를 이용한 메일 중복확인 기능🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/03.join_01.gif)  
   ✔️ [정규식을 이용한 비밀번호 유효성 검사 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/04.join_02.gif)  
   ✔️ [Sha256 을 이용한 DB 비밀번호 암/복호화 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/12.sha.png)  
   ✔️ [KakaoAPI를 이용한 우편번호 검색기능 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/05.join_04.gif)  
   ✔️ [세션유지를 통한 회원가입 성공 Welcome 페이지 구현 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/06.join_05.gif)  
   ✔️ [Ajax를 이용한 비밀번호 검증 뒤 회원탈퇴 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/08.out.gif)  
     
   
  ### ☑️ 로그인,아웃/이메일찾기/임시비밀번호 발급  
  
  ![login](delibraryGIF/07.login.gif)  
  로그인, 로그아웃 세션유지 및 부가 기능 뷰페이지와 기능 일체구현.  
    
      
   **💡기능 하이라이트💡**
    
   ✔️ [Ajax를 이용한 비밀번호 검증 뒤 회원탈퇴 🔗](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/09.email.gif)  
   ✔️ [임시비밀번호 발급, 메일전송 🔗 비밀번호찾기](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/09.pwd.gif)[🔗 이메일](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/10.pwdmail.gif) 
   
  
 ### 🌱 인기도서 페이지  
 ![insertCustomer](delibraryGIF/10.pop.gif)  
  DB에서 가장 빌린 도서가 많은 순으로 12개의 도서의 정보를 인기도서 페이지에 출력.  
   
  **👇인기도서 목록을 뽑아오기 위한 DB Select 문**
  ```xml
	<select id="getPopBook" resultType="bookVO">
		<![CDATA[select * from(select b_title, b_writer,b_image,count(bor_no) from book, 
		borrow where book.b_no = borrow.b_no group by b_title, b_writer, b_image order by count(bor_no) desc) 
		where rownum<=12 ]]>
	</select>
```
  
  
 ### 🌱 그 외 구현한 홈페이지 기능
   
   ✔️ [🔗 서비스 이용정보 페이지](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/11.etc_1.gif)  
   ✔️ [🔗 사이트맵](https://github.com/yurimnim/final-web-project-delibrary/blob/main/delibraryGIF/11.etc_2.gif)
 
 




  
  
  
  
  
  
  
   
 
     
   
  


