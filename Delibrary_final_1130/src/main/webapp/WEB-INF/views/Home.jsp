<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>딜리브러리 - 메인페이지</title>

<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
   integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
   rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" href="css/style.css">
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
   integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
   crossorigin="anonymous"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
   integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
   crossorigin="anonymous"></script>

<!-- 외부 CSS, JS 파일 링크 -->
<link rel="stylesheet" href="css/HomeCSS.css">
<script type="text/javascript" src="/js/HomeJS.js"></script>

<!-- 관리자 페이지 script, css -->
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

   $("#phone_a").click(function(){
		alert("고객센터 : 070) 1234-5678 \n"
			+ "이용시간 : 평일 9:00 - 18:00, 점심시간 12:00 - 13:30 \n              ( 주말/공휴일 휴무 ) \n"	
			+ "팩스번호 : 0504-123-1234 \n"); 
   });
});

</script>

</head>
<body>
   <nav
      class="navbar sticky-top navbar-expand-sm navbar-light bg-light p-0">
      <div class="container container-fluid">
         <a href="Home.do" class="navbar-brand"><img alt="딜리브러리"
            src="img/home/logo_home.png" height="30" class="pl-3 mb-1"></a>
         <button class="navbar-toggler" data-toggle="collapse"
            data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse noto-serif" id="navbarCollapse">
            <ul class="navbar-nav ml-0" id="home-nav">
               <li class="nav-item dropdown"><a href="howtoInfo.do"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서관소개</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="howtoInfo.do">
                           대출/반납/연장</a></li>
                     <li><a class="dropdown-item" href="postList.do?group=10">
                           공지사항 </a></li>
                     <li><a class="dropdown-item" href="faqViewpage.do">
                           자주묻는질문</a></li>
                     <li><a class="dropdown-item" href="QnaList.do"> 묻고답하기 </a></li>
                     <li><a class="dropdown-item" href="addrViewpageAPI.do">
                           오시는길 </a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="SearchResult.do"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">도서정보</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item" href="SearchResult.do">도서
                           검색</a></li>
                     <li><a class="dropdown-item" href="recommendedBooks.do">사서추천도서</a></li>
                     <li><a class="dropdown-item" href="Newbooks.do">신착도서</a></li>
                     <li><a class="dropdown-item" href="popularBook.do">이달의
                           인기도서</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a href="postList.do?group=20"
                  class="nav-link dropdown-toggle" data-toggle="dropdown">커뮤니티</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=20">창작물게시판</a></li>
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=30">중고장터</a></li>
                     <li><a class="dropdown-item"
                        href="postList.do?option=p_title&search=&group=60">자유게시판</a></li>
                  </ul></li>
               <li class="nav-item dropdown"><a
                  href="mypage_main.do?cust_no=${cust_no }"
                  class="nav-link dropdown-toggle mypage" data-toggle="dropdown">나의도서</a>
                  <ul class="dropdown-menu dropdown-menu-left fade-down">
                     <li><a class="dropdown-item mypage"
                        href="mypage_main.do?cust_no=${cust_no }"> 나의도서정보</a></li>
                     <li><a class="dropdown-item mypage" href="borrowList.do">대출현황</a></li>
                     <li><a class="dropdown-item mypage"
                        href="return_borrowList.do">대출/반납이력</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>
                     <li><a class="dropdown-item mypage"
                        href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
                  </ul></li>
            </ul>
            <ul id="app" class="navbar-nav ml-auto">
               <c:if test="${cust_no == 1}">
                  <li class="nav-item" v-bind:title="mamagerpage"><a
                     href="ManagerPage.do" class="nav-link"><i
                        class="fas fa-crown" style="color: #107637;"></i></a>
                  <p class="sr-only">관리자페이지</p></li>
               </c:if>
               <c:if test="${cust_no != 1 && cust_no != null }">
                  <li class="nav-item p-1"><small class="text-dark">${cust_name}
                        님</small></li>
               </c:if>
               <c:if test="${cust_no == null}">
                  <li class="nav-item" v-bind:title="login"><a
                     href="LoginPage.do" class="nav-link"><i
                        class="fas fa-sign-in-alt"></i></a>
                  <p class="sr-only">로그인</p></li>
                  <li class="nav-item" v-bind:title="signup"><a
                     href="insertCustomer.do" class="nav-link"><i
                        class="fas fa-user-plus"></i></a>
                  <p class="sr-only">회원가입</p></li>
               </c:if>
               <c:if test="${cust_no != null}">
                  <li class="nav-item" v-bind:title="logout"><a
                     href="logout.do" class="nav-link"><i
                        class="fas fa-sign-out-alt"></i></a>
                  <p class="sr-only">로그아웃</p></li>
               </c:if>
               <li class="nav-item " v-bind:title="bookcart"><a
                  href="BookCart.do" class="nav-link mypage"><i class="fas fa-book"></i></a>
               <p class="sr-only">북카트</p></li>
               <li class="nav-item" v-bind:title="sitemap"><a
                  href="siteMap.do" class="nav-link"><i class="fas fa-map"></i></a>
               <p class="sr-only">사이트맵</p></li>
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

   <!-- HOME HEADING SECTION -->
   <section id="home-heading" class="p-4 noto-serif">
      <div class="dark-overlay">
         <div class="row">
            <div class="col">
               <div class="container">
                  <div>
                     <h1 id="home-display"></h1>
                  </div>
               </div>
               <div class="container">
                  <div class="input-group mb-3" id="home-searchbar">
                     <input class="form-control searchbar" id="bookName" type="text"
                        placeholder="검색어를 입력하세요.">
                     <div class="input-group-append">
                        <button class="btn btn-outline-light btn-lg px-5" type="button"
                           id="search">
                           &nbsp;&nbsp;&nbsp;<b>도서검색</b> &nbsp;&nbsp;&nbsp;
                        </button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <p id="heroDesc">Admont Abbey Library, Admont, Austria</p>
         <p id="heroDescKor">아드몬트 수도원 도서관, 아드몬트, 오스트리아</p>
      </div>

   </section>

   <!-- PHOTO GALLERY -->
   <div class="home-gray">
      <section id="gallery" class="py-5">
         <div class="container">
            <hr>
            <div class="hr-green">
               <h4 class="text-center event-title pt-3 noto-serif">서울시 도서관 소식</h4>
            </div>
            <div class="row mb-4 pt-5">
               <div class="col-md-6 text-center pb-3">
                  <div class="row">
                     <div class="col">
                        <a href="https://www.nl.go.kr/"> <img width="100"
                           alt="국립중앙도서관"
                           src="../img/home/logo_national_library_of_korea.png"><br>
                        </a>
                     </div>
                     <div class="col">
                        <a href="https://lib.seoul.go.kr/"> <img width="100"
                           alt="서울도서관"
                           src="../img/home/logo_seoul_metropolitan_library.png"><br>
                        </a>
                     </div>
                     <div class="col">
                        <a href="https://www.nanet.go.kr/main.do"> <img width="100"
                           alt="국회도서관"
                           src="../img/home/logo_national_assembly_library.png">
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-md-6 text-center">
                  <div class="row">
                     <div class="col">
                        <a href="https://jnlib.sen.go.kr/jnlib/index.do?getContextPath=">
                           <img width="100" alt="종로도서관"
                           src="../img/home/logo_jongno_city_library.png"><br>
                        </a>
                     </div>
                     <div class="col">
                        <a href="https://www.ydplib.or.kr/intro/index.do"> <img
                           width="100" alt="영등포구립도서관"
                           src="../img/home/logo_yeongdeungpo_library.png"><br>
                        </a>
                     </div>
                     <div class="col">
                        <a href="https://www.nowonlib.kr/"> <img width="100"
                           alt="노원구 구립도서관" src="../img/home/logo_nowon_public_library.png"><br>
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>

   <!-- SHOWCASE SLIDER   -->
	<div class="container pt-5">
		<div class="row">
			<div class="col-md-6">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example">
					<div class="hr-green mb-4">
						<h3 class="d-inline-block mb-3 noto-serif">추천 도서</h3><!--Controls-->
						<div class="controls-bottom pull-right">
							<a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example"><i class="fa fa-chevron-right"></i></a>
						</div><!--/.Controls-->
					</div>
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-4">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5416922%3Ftimestamp%3D20201108134648">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">달러구트 꿈 백화점</div>
												<h6>이미예</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F532619%3Ftimestamp%3D20201108132924">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">아몬드(양장본 HardCover)</div>
												<h6>손원평</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F541125%3Ftimestamp%3D20201108132749">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">보건교사 안은영(오늘의 젊은 작가 9)(양장본 HardCover)</div>
												<h6>정세랑</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.First slide-->
						<!--Second slide-->
						<div class="carousel-item">
							<div class="row">
								<div class="col-md-4">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5439518%3Ftimestamp%3D20201108133930">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">그 환자</div>
												<h6>재스퍼 드윗</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5487218%3Ftimestamp%3D20201108133757">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">나의 하루는 4시 30분에 시작된다</div>
												<h6>김유진</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5450043%3Ftimestamp%3D20201108133956">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">철학의 숲</div>
												<h6>브렌던 오도너 휴</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.Second slide-->
					</div><!--/.Slides-->
				</div><!--/.Carousel Wrapper-->
			</div>

			<div class="col-md-6">
				<!--Carousel Wrapper-->
				<div class="carousel slide carousel-multi-item" data-ride="carousel" id="multi-item-example2">
					<div class="hr-green mb-4">
						<h3 class="d-inline-block mb-3 noto-serif">이번달 신작 도서</h3><!--Controls-->
						<div class="controls-bottom pull-right">
							<a class="btn btn-outline-success prev" data-slide="prev" href="#multi-item-example2"><i class="fa fa-chevron-left"></i></a> <a class="btn btn-outline-success next" data-slide="next" href="#multi-item-example2"><i class="fa fa-chevron-right"></i></a>
						</div><!--/.Controls-->
					</div>
					<!--Slides-->
					<div class="carousel-inner" role="listbox">
						<!--First slide-->
						<div class="carousel-item active">
							<div class="row">
								<div class="col-md-4">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5495847%3Ftimestamp%3D20201106153628">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">얼마나 닮았는가</div>
												<h6>김보영</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508720%3Ftimestamp%3D20201106153718">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">먹을수록 강해지는 폭식투수. 5</div>
												<h6>키르슈</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508612%3Ftimestamp%3D20201103160903">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">하늘과 땅의 수호자. 2(수호자 시리즈 9)</div>
												<p class="">우에하시 나호코</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.First slide-->
						<!--Second slide-->
						<div class="carousel-item">
							<div class="row">
								<div class="col-md-4">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5508519%3Ftimestamp%3D20201106141009">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">그대의 강</div>
												<h6>전진우</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507591%3Ftimestamp%3D20201103160737">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">하조대 해수욕장에서 생긴 일</div>
												<h6>꿀데이</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 clearfix d-none d-md-block">
									<div class="card">
										<img alt="Card image cap" class="img-fluid" src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5507544%3Ftimestamp%3D20201103160931">
										<div class="card-body">
											<div class="card-title">
												<div class="book-title" id="book-title">정조의 비밀사관, 은서</div>
												<h6>베이다</h6>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!--/.Second slide-->
					</div><!--/.Slides-->
				</div><!--/.Carousel Wrapper-->
			</div>
		</div>
	</div>

   <!-- TODAY, ADs -->
   <div class="container pb-5">
      <div class="row">
         <div class="col-md-4 mb-3">
            <!-- 오늘날짜 -->
            <div id="home-today" class="noto-serif">
               <p id="year-month" class="d-inline"></p>
               &nbsp;
               <p id="date" class="text-center p-0 m-0"></p>
            </div>
            <!-- 정기휴관일 -->
            <div id="home-holiday" class="text-center">
               <h6>정기휴관일</h6>
               <p id="holiday-fisrt" class="m-0 noto-serif"></p>
               <p id="holiday-last" class="m-0 noto-serif"></p>
            </div>
         </div>
         <div class="col-md-4 mb-3 noto-serif">
            <a href="addrViewpageAPI.do"><div class="home-tag mb-2">
                  <img class="pr-4 m-0" alt="찾아오시는 길" src="../img/home/map.png"
                     height="30px">찾아오시는 길
               </div></a><div class="home-tag mb-2" id="phone_a" >
                  <img class="pr-4 m-0" alt="찾아오시는 길"
                     src="../img/home/telephone.png" height="30px">전화번호
               </div> <a href="QnaList.do"><div class="home-tag mb-2">
                  <img class="pr-4 m-0" alt="찾아오시는 길" src="../img/home/question.png"
                     height="30px">묻고답하기
               </div></a> <a href="faqViewpage.do"><div class="home-tag mb-0">
                  <img class="pr-4 m-0" alt="찾아오시는 길" src="../img/home/faq.png"
                     height="30px">자주묻는질문
               </div></a>
         </div>
         <div class="col-md-4 mb-3">
            <!-- TESTIMONIALS -->
            <section id="showcase">
               <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1"></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>
                  <div class="carousel-inner">
                     <div class="carousel-item carousel-image-1 active">
                        <div class="container">
                           <div class="carousel-caption d-none d-sm-block mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item carousel-image-2">
                        <div class="container">
                           <div class="carousel-caption d-none d-sm-block mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                     <div class="carousel-item carousel-image-3">
                        <div class="container">
                           <div class="carousel-caption mb-5">
                              <p></p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <a href="#myCarousel" data-slide="prev"
                     class="carousel-control-prev"> <span
                     class="carousel-control-prev-icon"></span>
                  </a> <a href="#myCarousel" data-slide="next"
                     class="carousel-control-next"> <span
                     class="carousel-control-next-icon"></span>
                  </a>
               </div>
            </section>
         </div>
      </div>
   </div>

   <!--HOME TABLES  -->
   <div class="home-gray">
      <section id="home-icons" class="py-5">
         <div class="container">
            <div class="row">
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>공지사항</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="postList.do?option=p_title&search=&group=10"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${HNlist}" var="notice" begin="0" end="4"
                              step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="postDetail.do?p_id=${notice.p_id}&&group=10">${notice.p_title }</a></td>
                                 <td class="home_post_date"><fmt:formatDate
                                       value="${notice.p_regdate }" pattern="YYYY-MM-dd" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>창작물게시판</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="postList.do?option=p_title&search=&group=20"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${HMakinglist}" var="making" begin="0"
                              end="4" step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="postDetail.do?p_id=${making.p_id}&&group=20">${making.p_title }</a></td>
                                 <td class="home_post_date"><fmt:formatDate
                                       value="${making.p_regdate }" pattern="YYYY-MM-dd" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
               <div class="col-md-4 mb-4 text-left">
                  <!-- HOVERABLE -->
                  <div class="home-table p-4">
                     <div class="hr-green">
                        <div class="row">
                           <div class="col noto-serif">
                              <h4>중고장터</h4>
                           </div>
                           <div class="text-right mr-4">
                              <a href="postList.do?option=p_title&search=&group=30"><small
                                 class="text-muted">전체보기 &gt;</small></a>
                           </div>
                        </div>
                     </div>
                     <table class="table table-hover">
                        <tbody>
                           <c:forEach items="${HMarketlist}" var="market" begin="0"
                              end="4" step="1">
                              <tr>
                                 <td class="home_post_title ellipsis"><a
                                    href="postDetail.do?p_id=${market.p_id}&&group=30">${market.p_title }</a></td>
                                 <td class="home_post_date"><fmt:formatDate
                                       value="${market.p_regdate }" pattern="YYYY-MM-dd" /></td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
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
               <p>
                  Copyright &copy; <span id="year"></span> Delibrary
               </p>
            </div>
         </div>
      </div>
   </footer>

   <script type="text/javascript">
   
      window.onload = function() {
         //홈헤딩 이미지
         const home_heading = document.getElementById('home-heading');
      
         const images = ['library1.png','library2.png','library3.png','library4.png','library5.png','library6.png','library7.png','library8.jpg'];
         const getImage = Math.floor(Math.random() * images.length);
         
         home_heading.style.background = "url('../img/" + images[getImage] + "')";
      
         //홈헤딩 명언
         const home_display = document.getElementById('home-display');
         const quotes = ['무슨 책 읽을래?', '글짓기가 창조인 것처럼 글 읽기 또한 창조이다.', '진정한 책을 만났을 때 그것은 사랑에 빠지는 것과도 같다.', '다다익선 다독익선.','책은 한 권, 한 권이 하나의 세계이다.','네가 읽는 책들이 너를 말해준다.', '한 시간 독서로 누그러지지 않은 걱정은 결코 없다.'];
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

         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이 제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
         footer_display.textContent =footer_quotes[footer_getQuote];
      }   
      //오늘 날짜, 휴관일
      let today=new Date();
      const year1=today.getFullYear();
      const month=today.getMonth()+1;
      const date=today.getDate();

      document.getElementById('year-month').textContent=year1+"년 "+month+"월";
      document.getElementById('date').textContent=date+"일";

      const first=new Date(today.getFullYear(), today.getMonth(), 1);
      const last=new Date(today.getFullYear(), today.getMonth()+1,0);

      document.getElementById('holiday-fisrt').textContent=first.getFullYear()+"년 "+(first.getMonth()+1)+"월 "+first.getDate()+"일";
      document.getElementById('holiday-last').textContent=last.getFullYear()+"년 "+(last.getMonth()+1)+"월 "+last.getDate()+"일";
      
   </script>

</body>
</html>