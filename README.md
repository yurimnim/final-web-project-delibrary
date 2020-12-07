# final-web-project-delibrary
## 자바 웹개발 과정 파이널 팀 프로젝트 : 도서관 웹서비스 딜리브러리

### 1.구현기간
2020. 10.01 ~ 2020.11.30

### 2.개발개요
MVC패턴을 활용한 온라인 도서관 대여 서비스 제공하는 웹사이트 제작 

### 3.기술스택
  - 프론트: HTML/CSS, Javascript, Jquery, Bootstrap, JSP
  - 백: Java, OracleDB, SQLDeveloper, SpringMVC, MyBatis, Ajax

### 4. 주요구현기능
  #### A. 홈화면 검색창 디자인
  ![searchbar](delibraryGIF/01.home.gif)
  홈화면을 새로고침 할때마다 랜덤으로 도서관 도서에 관련된 헤드라인 글귀, 도서관 이미지, 이미지에 맞는 장소가
  나오는 디자인을 구현.
  ```javascript 
   //홈헤딩 이미지
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('../img/" + images[getImage] + "')";
      
         //홈헤딩 명언
         const home_display = document.getElementById('home-display');
         const quotes = ['무슨 책 읽을래?', '글짓기가 창조인 것처럼 글 읽기 또한 창조이다.', '진정한 책을 만났을 때 그것은 사랑에 빠지는 것과도 같다.', 
         '다다익선 다독익선.','책은 한 권, 한 권이 하나의 세계이다.','네가 읽는 책들이 너를 말해준다.', '한 시간 독서로 누그러지지 않은 걱정은 결코 없다.'];
         const getQuote = Math.floor(Math.random() * quotes.length);
         
         home_display.textContent = quotes[getQuote];
      
         //홈헤딩 장소
         const locEng  = ['Tianjin Binhai Library, Tianjin, China','George Peabody Library, Baltimore, USA', 
                        'Stuttgart City Library, Stuttgart, Germany', 'Trinity College Library, Dublin','Biblioteca Vasconcelos, Mexico City',
                        'Vennesla Library and Culture House, Norway', 'Starfield Library, Seoul, Korea', 'Admont Abbey Library, Admont, Austria' ];
         
         const locKor = ['텐진 빈하이 공공도서관, 텐진, 중국','조지 피바디 도서관, 볼티모어, 미국','슈트트가르트 도서관, 슈트트가르트, 독일',
                        '트리니티 컬리지 도서관, 더블린, 아일랜드','바스콘셀로스 도서관, 멕시코시티, 멕시코','베네슬라 도서관/문화의집, 베네슬라, 노르웨이',
                        '별마당 도서관, 서울, 대한민국','아드몬트 수도원 도서관, 아드몬트, 오스트리아'];
      
         const heroImageEng = document.getElementById('heroDesc');
         const heroDescKor = document.getElementById('heroDescKor');
         
         heroImageEng.textContent = locEng[getImage];
         heroDescKor.textContent = locKor[getImage];
  ```
  
  

   
  


