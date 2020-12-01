<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
   <!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/faq.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
     <!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
     $(function(){
        $(".mypage").click(function(event){
           if(${cust_no == null}){
              event.preventDefault();
              const loginOk = confirm("로그인 후 사용 가능합니다. 로그인하시겠습니까?");
              console.log(loginOk);
              if(loginOk){
                 console.log("로그인하러갑니다.");
                 window.location.href = "LoginPage.do";
              }
           }else{
              window.location.href="Home.do";
           }
        });
     });
     </script>
  <title>도서관소개 - 딜리브러리</title>
</head>

<body class="d-flex flex-column">
   <div id="page-content">
      <nav class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
         <div class="container">
            <a href="Home.do" class="navbar-brand"><img alt="딜리브러리" src="img/logo_sm.png" height="20" class="pl-3 mb-1"></a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
               <ul class="navbar-nav ml-4">
                  <li class="nav-item dropdown">
                     <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
                        <ul class="dropdown-menu dropdown-menu-left fade-down">
                           <li><a class="dropdown-item" href="#"> 대출/반납/연장</a></li>
                           <li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=10"> 공지사항 </a></li>
                           <li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
                           <li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
                           <li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
                        </ul>
                  </li>
                  <li class="nav-item dropdown">
                     <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
                        <ul class="dropdown-menu dropdown-menu-left fade-down">
                   <li><a class="dropdown-item" href="SearchResult.do">도서검색</a></li>
                   <li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
                   <li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
                   <li><a class="dropdown-item" href="popularBook.do">이달의 인기도서</a></li>
                </ul>
                  </li>
                  <li class="nav-item dropdown">
                     <a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
                        <ul class="dropdown-menu dropdown-menu-left fade-down">
                           <li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
                           <li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=30">중고장터</a></li>
                           <li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=60">자유게시판</a></li>
                        </ul>
                  </li>
                  <li class="nav-item dropdown">
                     <a href="mypage_main.do?cust_no=${cust_no }" class="nav-link dropdown-toggle mypage" data-toggle="dropdown">나의도서</a>
                        <ul class="dropdown-menu dropdown-menu-left fade-down">
                           <li><a class="dropdown-item mypage" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
                           <li><a class="dropdown-item mypage" href="borrowList.do">대출현황</a></li>
                           <li><a class="dropdown-item mypage" href="return_borrowList.do">대출/반납이력</a></li>
                           <li><a class="dropdown-item mypage" href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
                           <li><a class="dropdown-item mypage" href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
                        </ul>
                  </li>
               </ul>
               <ul id="app" class="navbar-nav ml-auto">
               <c:if test="${cust_no == 1}">
                  <li class="nav-item" v-bind:title="mamagerpage">
                     <a href="ManagerPage.do" class="nav-link"><i class="fas fa-crown" style="color: #107637;"></i></a><p class="sr-only">관리자페이지</p>
                  </li>
               </c:if>
               <c:if test="${cust_no != 1 && cust_no != null }">
                   <li class="nav-item p-1"><small class="text-dark">${cust_name} 님</small></li>
               </c:if>
               <c:if test="${cust_no == null}">
                  <li class="nav-item" v-bind:title="login">
                     <a href="LoginPage.do" class="nav-link"><i class="fas fa-sign-in-alt"></i></a><p class="sr-only">로그인</p>
                  </li>
                  <li class="nav-item" v-bind:title="signup">
                     <a href="insertCustomer.do" class="nav-link"><i class="fas fa-user-plus"></i></a><p class="sr-only">회원가입</p>
                  </li>
               </c:if>
               <c:if test="${cust_no != null}">
                  <li class="nav-item" v-bind:title="logout">
                     <a href="logout.do" class="nav-link"><i class="fas fa-sign-out-alt"></i></a><p class="sr-only">로그아웃</p>
                  </li>
               </c:if>
               <li class="nav-item" v-bind:title="bookcart">
                  <a href="BookCart.do" class="nav-link mypage"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
               </li>
               <li class="nav-item" v-bind:title="sitemap">
                  <a href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a><p class="sr-only">사이트맵</p>
               </li>
               <script>
                  var app = new Vue({
                     el: '#app',   
                     data: {
                        login: '로그인',
                        signup: '회원가입',
                        bookcart: '북카트',
                        sitemap: '사이트맵',
                        logout: '로그아웃',
                        mamagerpage: '관리자페이지'
                     }});
               </script>
            </ul>
         </div>
      </div>
   </nav>
  
      <!-- PAGE HEADER -->
      <header id="page-header" class="noto-serif">
         <div class="page-header-overlay">
            <div class="container pt-5">
              <div class="row">
               <div class="col-md-6 m-auto text-center">
                 <h2>자주묻는질문</h2>
               </div>
              </div>
            </div>
         </div>
      </header>
   
      <!-- MAIN SECTION -->
      <section id="contact" class="py-3">
         <div class="container">
           <div class="row">
               <!-- 사이드바 -->
               <div class="col-md-3">
                 <div class="sidebar noto-serif">
                     <div class="side-head">
                        <h4 class="text-light text-center">도서관소개</h4>
                     </div>
                     <ul class="list-group list-group-flush mb-5">
                        <li class="list-group-item"><a href="howtoInfo.do">대출/반납/연장</a></li>
                        <li class="list-group-item"><a href="postList.do?group=10">공지사항</a></li>
                        <li class="list-group-item active"><a href="faqViewpage.do">자주묻는질문</a></li>                  
                        <li class="list-group-item"><a href="QnaList.do?option=p_title&search=">묻고답하기</a></li>
                        <li class="list-group-item"><a href="addrViewpageAPI.do">오시는길</a></li>
                     </ul>
                 </div>
               </div>
      
                  <!-- 메인내용 -->
                  <div class="col-md-9">
                    <div class="p-4">
                     <section id="main_section">      
                        <div class="faq">
                           <div class="search_btn_array form-inline">
                                  <form name="f1" action="" onSubmit="if(this.t1.value!=null && this.t1.value!='') findString(this.t1.value);return false">
                                  <input type="text" name=t1 placeholder="검색어를 입력하세요!" id="input_search" class="form-control">
                                  <button class="btn btn-outline-secondary button_search ml-2" name=b1><i class="fas fa-search"></i></button>
                              </form>
                           </div>
                           <hr>                  
                           <div class="accordion">
                              <input type="radio" name="accordion" id="answer01"> 
                                 <label for="answer01">Q : 회원가입을 하면 편리한 점이 무엇인가요?</label>
                                 <div><p><i class="fas fa-angle-right"></i>&nbsp;&nbsp; 도서관 홈페이지 이용시 반복되던 신분확인 절차가 회원가입시 한번의 인증으로 간소화 됩니다.<br>
                                       <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 홈페이지에서 등록된 아이디로 간편하게 도서관 서비스 신청이 가능합니다.<br>
                                       <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 회원가입시 입력하신 관심 주제분야의 추천도서를 제공 받을 수 있습니다.</p></div>
                              <input type="radio" name="accordion" id="answer02"> 
                                 <label for="answer02">Q : 등록된 내 정보를 변경하고 싶습니다.</label>
                                 <div><p>Delibrary의 회원정보 변경은 고객님께서 직접 홈페이지 로그인 후<br>
                                       [마이페이지 > 회원정보 > 회원 정보 조회/수정] 에서 정보를 변경하실 수 있습니다.</p></div>
                              <input type="radio" name="accordion" id="answer03"> 
                                 <label for="answer03">Q : 14세 미만은 법정대리인의 동의가 없으면 회원가입을 할 수 없나요?</label>
                                 <div><p>개인정보보호법에 의해 14세 미만 아동의 개인정보수집 시 반드시 법정대리인의 동의를 얻어야 하기 때문에<br>
                                       2011년 9월 30일 이후에는 법정대리인의 동의가 없으면 가입을 하실 수 없습니다.</p></div>   
                              <input type="radio" name="accordion" id="answer04"> 
                                 <label for="answer04">Q : 무엇이든 기증할 수 있나요?</label>
                                 <div><p>국내 발행 일반도서, 어린이·청소년도서, 학술도서, 연구보고서, 세미나·회의자료, 한국관련,외국자료 등을 기증받고 있으며, 기증 제외 자료는 다음과 같습니다.<br>
                                 <br>
                                 <기증 제외 자료><br>
                                 <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 외국서(한국관련 외국서는 기증 가능)<br>
                                 <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 개인복사물<br>
                                 <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 오・훼손자료<br>
                                 <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 3책 이상의 동일자료</p></div>   
                              <input type="radio" name="accordion" id="answer05"> 
                                 <label for="answer05">Q : 도서를 분실했는데 어떻게 하나요?</label>
                                 <div><p>동일도서로 변상하여야 합니다. 시중에 책이 없을 경우에는 시가상당 금액으로 변상하여야 합니다.</p></div>   
                              <input type="radio" name="accordion" id="answer06"> 
                                 <label for="answer06">Q : 도서를 연체한 경우에는 어떻게 되나요?</label>
                                 <div><p>도서의 연체일수 만큼 대출이 정지됩니다. 한 권만 연체해도 그 연체일수 사용할 수 없습니다.</p></div>   
                              <input type="radio" name="accordion" id="answer07"> 
                                 <label for="answer07">Q : 이사를 했는데 주소 변경은 어디에서 하나요?</label>
                                 <div><p>딜리브러리 홈페이지 로그인 후 나의도서->개인정보수정 에서 변경하실 수 있습니다.</p></div>
                              <input type="radio" name="accordion" id="answer08"> 
                                 <label for="answer08">Q : 서비스 이용에 비용이 발생하나요?</label>
                                 <div><p>딜리브러리 서비스는 우정사업본부(우체국)와 협약을 통하여 국가에서 제공하는 서비스이며,<br>
                                 이 과정에서 발생하는 왕복 택배비는 딜리브러리 도서관에서 지원하므로 무료로 이용하실 수 있습니다.</p></div>   
                              <input type="radio" name="accordion" id="answer09"> 
                                 <label for="answer09">Q : 희망도서 신청은 어떻게 하며, 도서구입은 얼마나 자주하나요?</label>
                                 <div><p>홈페이지 ‘묻고 답하기’ 에서 신청 가능합니다.<br>
                                       <br>
                                       <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 자료선정시 수험서, 학습교재, 오락성이 강한 출판물, 소장에 적합하지 않은 형태<br>
                                       (스프링제본, 색칠놀이책 등),시리즈・전집류 등은 신청이 제한될 수 있습니다.<br>
                                       <i class="fas fa-angle-right"></i>&nbsp;&nbsp; 도서구입은 매년 도서구입계획에 의해 정기적으로 구입하고 있습니다.</p></div>   
                              <input type="radio" name="accordion" id="answer10"> 
                                 <label for="answer10">Q : 탈퇴는 어떻게 하나요?</label>
                                 <div><p>Delibrary 홈페이지 로그인 => ‘회원정보수정’ => ‘회원탈퇴’ 메뉴 클릭</p></div>   
                           </div>
                        </div>
                     </section>
                 </div>
               </div>
               <!-- 메인내용 END -->
            </div>
         </div>
      </section>
   </div>
   
  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4 noto-serif">
    <div class="container">
      <div class="row">
         <div class="col-md-12 pb-2">
            <!--  책 관련된 명언 랜덤으로 보여주기 -->
            <p id="footer-display"></p>
          </div>
        <div class="col-md-12">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>

   <script>
      // Get the current year for the copyright
      $('#year').text(new Date().getFullYear());
   
      window.onload=function(){
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }

      //faq에서 ctrl+f 찾기 기능
       var TRange=null;

       function findString (str) {
        if (parseInt(navigator.appVersion)<4) return;
        var strFound;
        if (navigator.appName=="Netscape") {

         // NAVIGATOR-SPECIFIC CODE

         strFound=self.find(str);
         if (!strFound) {
         strFound=self.find(str,0,1);
         while (self.find(str,0,1)) continue;
         }
        }
        if (navigator.appName.indexOf("Microsoft")!=-1) {

         // EXPLORER-SPECIFIC CODE

         if (TRange!=null) {
         TRange.collapse(false);
         strFound=TRange.findText(str);
         if (strFound) TRange.select();
         }
         if (TRange==null || strFound==0) {
         TRange=self.document.body.createTextRange();
         strFound=TRange.findText(str);
         if (strFound) TRange.select();
         }
        }
        if (!strFound) alert ("String '"+str+"' not found!");
       }
       
   </script>
</body>

</html>