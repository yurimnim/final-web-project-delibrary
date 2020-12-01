<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
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
  <!-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
  <title>도서정보 - 딜리브러리</title>
<!-- kakao 검색 API -->
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {
		let booklist;

		let search = function(pageNUM) {
			if(pageNUM === undefined){
				pageNUM = 1;
			}
			let size = 48;
			$.ajax({
				method: "GET",
				url: "https://dapi.kakao.com/v3/search/book?target=title&size=" + size + "&page=" + pageNUM,
				data: { query:  $("#query").val() },
				headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
			})
				.done(function(msg) {
					console.log('count : ' + msg.meta["pageable_count"]);

					if(msg.meta["pageable_count"] === 0) {
						let h3 = $('<h3></h3>').text('검색 결과가 없습니다.');
						h3.attr("style","margin: 20% 0% 0% 35%;");
						$('.searchResult-body').append(h3);
					}
					
					if(pageNUM == 1){
						booklist = msg;
					}
// 					alert(msg.documents[0].title);
					var ul = $('<ul></ul>').addClass('card-list');
					var totalPage;
	
					for(let i = 0; i < msg.documents.length; i++) {
						var li = $('<li></li>').addClass('card');
						var a = $('<a></a>').addClass('card-image')
						$(a).css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
						$(a).attr('data-image-full', msg.documents[i].thumbnail);
						a.css("width", "120px");
						a.css("height","174px");

						<!-- 책 검색에서 제목 받아서 디테일북으로 옮기게 동적노드 생성 1단계 시작 [현왕] -->
						var book_title = msg.documents[i].title;
						var a_href = $('<a href="detailBook.do?b_no=1&query='+book_title+'"></a>');
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 생성 1단계 종료 [현왕] -->

						var img = $('<img>').attr('src', msg.documents[i].thumbnail);
						var a2 = $('<a></a>');
						$(a2).addClass('card-description');
						$(a2).attr('target', '_blank');
						
						var h4 = $('<h4></h4>').text(msg.documents[i].title);
						var p = $('<p></p>').text(msg.documents[i].authors);
	
						$(a).append(img);
						$(li).append(a);
						
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 li에 넣기 시작 [현왕] -->
						$(a_href).append(a);
						$(li).append(a_href);
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 li에 넣기 종료 [현왕] -->
						
						$(a2).append(h4);
						$(a2).append(p);
						$(li).append(a2);
	
						$(ul).append(li);
						$('.searchResult-body').append(ul);
					}
					
					let totalCount = msg.meta["pageable_count"];
					if(pageNUM != 1){
						totalCount = booklist.meta["pageable_count"];
					}
					console.log(pageNUM);
					console.log(size);
					console.log(totalCount);
					totalPage = totalCount / size + 1;
					if(totalCount / size === 0){
						totalPage = totalCount / size;
					}
					
					for(let i = 1; i <= totalPage; i++) {
						$('.paging').append($('<a></a>').addClass('paging-num').text(i));
					}

					$('.paging-num').click(function() {
						let clickedPage = $(this).text();
						$('.searchResult-body').children().remove();
						$('.paging').children().remove();
						search(clickedPage);
					});
				});
		}

		search();

		// footer
		$('#year').text(new Date().getFullYear());
		
		$('#search').click(function() {
			$("#query").val($("#bookName").val());
			$('.searchResult-body').children().remove();
			$('.paging').children().remove();
			search();
		})
	});
</script>

<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		margin: 0 auto;
		/* filter: blur(3px); /* blur the lowres image */ */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
	
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
		margin: 0 auto;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		text-align: center;
		list-style: none;
		width: 825px;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 250px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 100px;
		text-align: center;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		float: left;
		width: 100%;
	}
	
	.searchResult-options {
		margin-left: 150px;
		float: left;
		width: 20%;
		text-align: center;
	}
	
	.paging {
		margin: 0 auto;
		text-align: center;
		width: 100%;
		float: left;
	}
	
	.paging-num {
		margin: 0 10px;
	}
	
	.input-group {
		height: 26px;
		padding: 25px 5px 25px 5px;
		border: 1px; 
		float: left;
	}
	
	.searchResult-body {
		float: left;
	}
</style>
</head>
<body class="d-flex flex-column">
	<input type="hidden" value="${query}" id="query">
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
					  <h2>도서검색</h2>
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
					<div class="col-md-3 noto-serif mb-3">
						<div class="sidebar">
							<div class="side-head">
								<h4 class="text-light">도서검색</h4>
							</div>
							<ul class="list-group list-group-flush mb-5">
                  <li class="list-group-item active"><a href="SearchResult.do">도서검색</a></li>
                  <li class="list-group-item"><a href="recommendedBooks.do">사서추천도서</a></li>
                  <li class="list-group-item"><a href="Newbooks.do">신착도서</a></li>                  
                  <li class="list-group-item"><a href="popularBook.do">이달의 인기도서</a></li>
               </ul>
						</div>
					</div>


					<!-- 메인내용 -->
			<div class="col-md-9">
				<div class="input-group noto-serif">
					<input class="form-control searchbar" id="bookName" type="text"
						placeholder="검색어를 입력하세요.">
					<div class="input-group-append">
						<button class="btn btn-outline-success btn-r" type="button"
							id="search">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>도서검색</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					</div>
				</div>
				<br><br><br>
				<!-- CARD COLUMNS -->
				<div class="searchResult-body">
					
				</div>
				<div class="paging">
					
				</div>
			</div>
		  </div>
		</div>
	</section>
	</div>
	
	<div style="clear: both"></div>

  <!-- FOOTER -->
  <footer id="main-footer" class="text-center p-4 noto-serif">
    <div class="container">
      <div class="row">
         <div class="col-md-12 pb-2">
            <!--  책 관련된 명언 랜덤으로 보여주기? -->
            <p id="footer-display"></p>
          </div>
        <div class="col-md-12">
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
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
      <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

    $('.slider').click({
      infinite: true,
      slideToShow: 1,
      slideToScroll: 1
    });
  </script>
  
  <script type="text/javascript">
      window.onload = function() {
         //푸터 명언
         const footer_display = document.getElementById('footer-display');
         const quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
         const getQuote = Math.floor(Math.random() * quotes.length);
         footer_display.textContent = quotes[getQuote];
      }   

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