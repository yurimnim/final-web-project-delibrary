<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>   

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
	<link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
  <title>도서정보 - 딜리브러리</title>
  <style>

 	.img-fluid {
	  height: 250px;
      width: 244px;
	  
	}

  
  </style>
  
  <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
</script>
  
</head>

<body>
	<nav class="navbar sticky-top navbar-expand-sm navbar-dark bg-dark p-0">
		<div class="container">
			<a href="home.html" class="navbar-brand"><img alt="딜리브러리" src="img/logo_bg_dark.jpg" height="20" class="pl-3 mb-1"></a>
			<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav ml-4">
					<li class="nav-item dropdown">
						<a href="howtoInfo.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="howtoInfo.do"> 대출/반납/연장</a></li>
								<li><a class="dropdown-item" href="#"> 공지사항 </a></li>
								<li><a class="dropdown-item" href="#"> 자주묻는질문</a></li>
								<li><a class="dropdown-item" href="#"> 묻고답하기 </a></li>
								<li><a class="dropdown-item" href="#"> 오시는길 </a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="SearchResult.do" class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="SearchResult.do">도서검색</a></li>
								<li><a class="dropdown-item" href="#">사서추천도서</a></li>
								<li><a class="dropdown-item" href="#">신착도서</a></li>
								<li><a class="dropdown-item" href="#">이달의 인기도서</a></li>
							</ul>
					</li>
					<li class="nav-item dropdown">
						<a href="postList.do?option=p_title&search=&group=20" class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
							<ul class="dropdown-menu dropdown-menu-left fade-down">
								<li><a class="dropdown-item" href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
								<li><a class="dropdown-item" href="#">중고장터</a></li>
								<li><a class="dropdown-item" href="#">자유게시판</a></li>
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
	<header id="page-header">
		<div class="container">
		  <div class="row">
			<div class="col-md-6 m-auto text-center">
			  <h1>내서재</h1>
			</div>
		  </div>
		</div>
	</header>
	
  <!-- MAIN SECTION -->
  <!-- 사이드바 -->
	<section id="contact" class="py-3">
		<div class="container">
		  <div class="row">
			<div class="col-md-3">
			  <div class="sidebar">
					<div class="side-head">
						<h4 class="text-light">내서재</h4>
					</div>
					<ul class="list-group list-group-flush mb-5">
						<a href="#"><li class="list-group-item active">내서재</li></a>
						<a href="#"><li class="list-group-item">대출현황/이력</li></a>
						<a href="#"><li class="list-group-item">나의도서정보</li></a>						
						<a href="#"><li class="list-group-item">개인정보수정</li></a>
					</ul>
			  </div>
			</div>
			
			<!-- 메인내용 -->
			<div class="col-md-9">
			  <div class="p-4">
				  <!-- CARD WITH NAV -->
					<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs">
							
									<li class="nav-item">
									
											<a class="nav-link active" href="#">대출현황</a>
									</li>
									<li class="nav-item">
											<a class="nav-link" href="#">예약현황</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">연체도서</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="">대출/반납이력</a>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">폴더:${pageStr } </a>
									</li>
							</ul>
					</div>
						
					<!-- CARD COLUMNS -->
					
					<div class="card-columns">
						<c:forEach var="p" items="${p }"> 
						<div class="card">
							
							
							<img class="card-img-top img-fluid" src="${p.fname }"  alt="">
							<div class="card-body">
									<a href="#"><h4 class="card-title">${p.p_title }</h4></a>
									<p class="card-text">
										저자 :  ${p.p_writer } <br>
										
										<small class="text-muted">책</small>
									</p>
									
							</div>
						</div>
						
						</c:forEach>
						
	</section>
  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4">
    <div class="container">
      <div class="row">
        <div class="col">
          <p>Copyright &copy;
            <span id="year"></span> Glozzom</p>
        </div>
      </div>
    </div>
  </footer>


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
      <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    $('.slider').click({
      infinite: true,
      slideToShow: 1,
      slideToScroll: 1
    });

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
</body>

</html>