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
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
	<script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#btn_b_N").click(function(){
			window.location.href="borrowList.do";
		});
		$("#btn_b_ALL").click(function(){
			window.location.href="return_borrowList.do";
		});
	});
	</script>
  <title>나의도서 - 딜리브러리</title>
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
						<a href="howtoInfo.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="howtoInfo.do"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="faqViewpage.do"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="addrViewpageAPI.do"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서 검색</a></li>
								<li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
								<li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
								<li><a class="dropdown-item" href="popularBook.do">이달의 인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
								<li><a class="dropdown-item" href="Postlist.do?group=60">자유게시판</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="mypage_main.do?cust_no=${cust_no }" class="nav-link dropdown-toggle" data-toggle="dropdown">나의도서</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
								<li><a class="dropdown-item" href="borrowList.do">대출현황</a></li>
								<li><a class="dropdown-item" href="return_borrowList.do">대출/반납이력</a></li>
								<li><a class="dropdown-item" href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
								<li><a class="dropdown-item" href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
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
						<a href="BookCart.do" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
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
					  <h2>나의도서</h2>
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
			  <div class="sidebar noto-serif mb-3">
					<div class="side-head">
						<h4 class="text-light">나의도서</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<li class="list-group-item active"><a href="mypage_main.do?cust_no=${cust_no }">나의도서정보</a></li>
						<li class="list-group-item"><a href="borrowList.do">대출현황</a></li>
						<li class="list-group-item"><a href="return_borrowList.do">대출/반납이력</a></li>
						<li class="list-group-item"><a href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
						<li class="list-group-item"><a href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
					</ul>
			  </div>
      </div>

      <!-- 메인내용 -->
      <div class="col-md-9">
          <div class="card-body p-0">
            <!-- CARD GROUPS -->
            <div class="card-group">
              <div class="card">
              	<div class="d-flex align-items-center">
                	<div><img class="card-img-top img-fluid" src="img/${c.fname}"></div>
                </div>
              </div>
              <div class="card">
                <div class="card-body" style="padding-top: 50px; text-align: center;">
                    <h4 class="card-title">${c.nickname}</h4>
                    <p class="card-text">${id}@${email}</p>
                    <p class="card-text">${c.birthday}</p>
                    <p class="card-text">
                        <a href="MyPage_Info.do?cust_no=${c.cust_no }"><small class="text-muted">개인정보수정</small></a>
                    </p>
                </div>
              </div>
              <div class="card">
                <div class="card-body" style=" text-align: center;">
                    <p class="card-text tbody py-4"><a href="borrowList.do">대출현황 ${totalCount_N }건</a></p>
                    <hr>
                    <p class="card-text tbody py-4"><a href="return_borrowList.do">대출/반납이력 ${totalCount_ALL }건</a></p>
                </div>
              </div>
            </div>
            </div>
            <br><br>
            <!-- HOVERABLE -->
            <div class="row pb-2 noto-serif">
              <div class="col">
                <h5>대출현황</h5>
              </div>
              <div class="text-right mb-2 pr-3">
                <button class="btn btn-outline-secondary btn-sm" type="button" id="btn_b_N">전체보기</button>
              </div>
            </div>
            <table class="table table-hover">
              <thead>
                  <tr>
                      <th>&nbsp;</th>
                      <th>도서명</th>
                      <th>대출일자</th>
                      <th>반납예정일</th>
                  </tr>
              </thead>
              <tbody class="tbody">
	                <c:if test="${totalCount_N==0 }">
	                	<td colspan="4" style="text-align: center;">대출중인 도서가 없습니다.</td>
	                </c:if>
           		<c:forEach var="b_N" items="${b_N}" varStatus="status" begin="0" end="2">
                <tr>
                    <th scope="row" width="5%">${status.count }</th>
                   	<c:if test="${totalCount_N!=0 }">
	                    <td width="60%">${b_N.b_title }</td>
	                    <td>${b_N.bor_date }</td>
	                    <td>${b_N.return_date }</td>
                   	</c:if>
                </tr>
           		</c:forEach>
              </tbody>
            </table>
            <br>

            <!-- HOVERABLE -->
             <div class="row pb-2 noto-serif">
               <div class="col">
                 <h5>대출/반납이력</h5>
               </div>
               <div class="text-right mb-2 pr-3">
                 <button class="btn btn-outline-secondary btn-sm" type="button" id="btn_b_ALL">전체보기</button>
               </div>
             </div>
             <table class="table table-hover">
               <thead>
                 <tr>
                   <th>&nbsp;</th>
                   <th>도서명</th>
                   <th>대출일자</th>
                   <th>반납일자</th>
                 </tr>
               </thead>
               <tbody class="tbody">
               <c:forEach var="b_ALL" items="${b_ALL}" varStatus="status"  begin="0" end="2"> 
                 <tr>
                     <c:if test="${totalCount_ALL==0 }">
                    	<td colspan="4" style="text-align: center;">대출/반납 이력이 없습니다.</td>
                    </c:if>
                   <th scope="row" width="5%">${status.count }</th>
                   	<c:if test="${totalCount_ALL!=0 }">
	                    <td width="60%">${b_ALL.b_title }</td>
	                    <td>${b_ALL.bor_date }</td>
	                    <td>${b_ALL.return_date }</td>
                   	</c:if>
                 </tr>
               </c:forEach>
               </tbody>
             </table>
       </div>
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
	
		$(function(){
			//푸터 명언
			const footer_display = document.getElementById('footer-display');
			const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
			const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
			footer_display.textContent =footer_quotes[footer_getQuote];
		});
	</script>
</body>

</html>