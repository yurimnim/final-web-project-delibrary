<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
	<!-- 구글폰트 전체 기본적용 END -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/yurim.css">
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
								<li><a class="dropdown-item" href="SearchResult.do">도서검색</a></li>
								<li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
								<li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
								<li><a class="dropdown-item" href="popularBook.do">인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?option=p_title&search=&group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
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
					  <h2>사이트맵</h2>
					</div>
				  </div>
				</div>
			</div>
		</header>
	
	<!-- MAIN SECTION -->
    <section id="contact" class="py-5">
      <div class="container noto-serif">
        <div class="row">
        
          <div class="col-md-3">
            <div class="card p-4">
              <div class="card-body">
                <h4 class="siteMapTitle">도서관소개</h4>
                <hr>
                <a href="howtoInfo.do" class="siteMapAnchor"><p>대출/반납/연장</p></a>
                <a href="postList.do?option=p_title&search=&group=10" class="siteMapAnchor"><p>공지사항</p></a>
                <a href="faqViewpage.do" class="siteMapAnchor"><p>자주묻는질문</p></a>
                <a href="QnaList.do" class="siteMapAnchor"><p>묻고답하기</p></a>
                <a href="addrViewpageAPI.do" class="siteMapAnchor"><p>오시는 길</p></a>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card p-4">
              <div class="card-body">
                <h4 class="siteMapTitle">도서정보</h4>
                <hr>
                <a href="SearchResult.do" class="siteMapAnchor"><p>도서검색</p></a>
                <a href="recommendedBooks.do" class="siteMapAnchor"><p>사서추천도서</p></a>
                <a href="Newbooks.do" class="siteMapAnchor"><p>신착도서</p></a>
                <a href="popularBook.do" class="siteMapAnchor"><p>인기도서</p></a>
                <p>&nbsp;</p>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card p-4">
              <div class="card-body">
                <h4 class="siteMapTitle">커뮤니티</h4>
                <hr>
                <a href="postList.do?option=p_title&search=&group=20" class="siteMapAnchor"><p>창작물게시판</p></a>
                <a href="postList.do?option=p_title&search=&group=30" class="siteMapAnchor"><p>중고장터</p></a>
                <a href="postList.do?option=p_title&search=&group=60" class="siteMapAnchor"><p>자유게시판</p></a>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <div class="card p-4">
              <div class="card-body siteMap">
                <h4 class="siteMapTitle">나의도서</h4>
                <hr>
                <a href="mypage_main.do?cust_no=${cust_no }" class="siteMapAnchor"><p>나의도서정보</p></a>
                <a href="lentSearchResult.do" class="siteMapAnchor"><p>대출현황/이력</p></a>
                <a href="MyPage_Folder.do?cust_no=${cust_no }&group=50" class="siteMapAnchor"><p>내서재</p></a>
                <a href="MyPage_Info.do?cust_no=${cust_no }" class="siteMapAnchor"><p>개인정보수정</p></a>
                <p>&nbsp;</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	</div>
	
<!-- FOOTER -->
   <footer id="main-footer" class="p-5 noto-serif">
    <div class="container">
      <div class="row">
      	<div class="col-md-3 mb-3">
      		<p class="mb-1"><a href="howtoInfo.do">이용안내</a></p>
      		<p class="mb-1"><a href="postList.do?option=p_title&search=&group=10">공지사항</a></p>
      		<p class="mb-1"><a href="faqViewpage.do">자주묻는질문</a></p>
      		<p class="mb-1"><a href="QnaList.do">묻고답하기</a></p>
      	</div>
      	<div class="col-md-3 mb-3">
      		<p class="mb-1"><a href="postList.do?option=p_title&search=&group=20">창작물게시판</a></p>
      		<p class="mb-1"><a href="postList.do?option=p_title&search=&group=30">중고장터</a></p>
      		<p class="mb-1"><a href="postList.do?option=p_title&search=&group=60">자유게시판</a></p>
      		<p class="mb-1"><a href="http://localhost:8088/MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></p>
      	</div>
        <div class="col-md-6">
        	<table class="footer-table">
        		<tbody>
        			<tr>
        				<th>Delibrary</th>
        				<td>서울 마포구 백범로 23 구프라자 3층</td>
        			</tr>
        			<tr>
        				<th>고객센터</th>
        				<td>070-1234-5678</td>
        			</tr>
        			<tr>
        				<th>이용시간</th>
        				<td>평일 9:00 - 18:00, 점심시간 12:00 - 13:30 &nbsp;<small>( 주말/공휴일 휴무 )</small></td>
        			</tr>
        			<tr>
        				<th>팩스번호</th>
        				<td>0504-123-1234</td>
        			</tr>
        			<tr>
        				<th>이메일</th>
        				<td>delibrary@book.com</td>
        			</tr>
        		</tbody>
        	</table>
			<br>
			<br>
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>
 </body>
 </html>