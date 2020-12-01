<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
   <title>회원가입 - 딜리브러리</title>
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
								<li><a class="dropdown-item" href="howtoInfo.do"> 대출/반납/연장</a></li>
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
					  <h2>회원가입</h2>
					  <small style="color: Gainsboro;">딜리브러리의 도서를 온라인으로 대여하세요.</small>
					</div>
			  </div>
			</div>
		</div>
	</header>
	
  <!-- MAIN SECTION -->
	<section id="insertCustomer">
		<!-- 폼 시작 -->
		<form action="insertCustomer.do" method="post" enctype="multipart/form-data">
		
		<!-- 이메일 INPUT START -->
		<label class="mt-4" for="m_phone">이메일</label>
		<span class="signup_required">*</span>
		<div class="input-group mb-3">
			<input class="form-control" type="email" id="email" name="email" placeholder="예시)hello@delibrary.com" required>
			<div class="input-group-append">
				<button class="btn btn-outline-success btn-Customer" id="btn_emailCheck" type="button">중복체크</button>
			</div>
		</div>
		<small class="form-text email_message" id="email_ok" style="color: red;">이미 가입되어있는 이메일 입니다. 다른 이메일로 중복확인을 다시 해주세요.</small>
        <small class="form-text email_message" id="email_ok_ok" style="color: green;">사용 가능한 이메일입니다. </small>
		<small class="form-text text-muted email" id="email_msg"><span class="signup_required">실제 사용하시는 이메일을</span> 입력해주세요.</small>	
		<!-- 이메일 INPUT END -->
	
		<!-- 비번 INPUT START -->
		<div class="form-group mt-2">
			<label for="pw">비밀번호</label> <span class="signup_required">*</span>
			<input class="form-control" type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
			<small class="form-text text-muted">비밀번호는 <span class="signup_required">8~16자, 영문 대문자, 소문자, 숫자 </span>를 포함해야 합니다.</small>
			
		</div>
		<!-- 비번 INPUT END -->

		<!-- 비번확인 INPUT START -->
		<div class="form-group mt-3">
			<label for="pw-check">비밀번호 확인</label> <span class="signup_required">*</span>
			<input class="form-control" type="password" id="pw_check" placeholder="비밀번호를 다시 입력해주세요" required>
			<span class="signup_required">
				<small class="form-text pw_message" id="pw_match">비밀번호가 일치하지 않습니다.</small>
				<small class="form-text pw_message" id="pw_length">8~16자로 설정해주세요. </small>
				<small class="form-text pw_message" id="pw_ok">영문 대문자, 소문자, 숫자 조합으로 해주세요.</small>
			</span>	
		</div>
		<!-- 비번확인 INPUT END -->


		<!-- 이름 INPUT START -->
		<div class="form-group mt-2">
			<label for="name">이름</label> <span class="signup_required">*</span>
			<input class="form-control" type="text" id="name" name="name" placeholder="이름을 입력해주세요" required>
			<small class="form-text text-muted">반드시 <span class="signup_required">한글 실명</span>으로 기입해주세요.<br>
			실명이 아닐 경우, 서비스 이용에 제약이 생길 수 있습니다.<br>
			- 띄어쓰기, 특수 문자 사용 불가</small>
		</div>
		<!-- 이름 INPUT END -->

		<!-- 닉네임 INPUT START -->
		<div class="form-group my-4">
			<label for="name">닉네임</label> <span class="signup_required">*</span>
			<input class="form-control" type="text" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요" required>
			<small class="form-text text-muted">딜리브러리에서 커뮤니티 활동시 사용할 닉네임을 입력해주세요.<br>
				<span class="signup_required">한글 6자 혹은 알파벳 12자 </span>이내로 기입해주세요.<br>
				- 띄어쓰기, 특수 문자 사용 불가<br>
				- 욕설, 비속어 사용시 이용이 제한될 수도 있습니다.</small>
		</div>
		<!-- 닉네임 INPUT END -->

		<!-- 프사 INPUT START -->
		<label for="file">프로필사진</label>
		<div class="custom-file">
			<input type="file" id="myfile" class="custom-file-input" name="uploadFile">
			<label class="custom-file-label" for="myfile">파일찾기</label>
			<small class="form-text text-muted">딜리브러리에서 커뮤니티 활동시 사용할 프로필사진을 업로드 해주세요.<br>
				(업로드 가능 최대파일사이즈: 10MB)
			</small>
		</div>
		<!-- 프사 INPUT END -->

		<!-- 폰번호 INPUT START -->
		<label class="mt-4" for="m_phone">휴대폰번호</label>
		<span class="signup_required">*</span>
		<div class="form-group mb-3">
			<input class="form-control" type="tel" id="m_phone" name="m_phone" placeholder="예시)010-1234-5678">
		</div>
		<!-- 폰번호 INPUT END -->

		<!-- 주소 INPUT START -->
		<label for="m_phone mt-4">주소</label>
		<span class="signup_required">*</span>

		<div id="address_postcode">
			<div class="input-group">
				<input class="form-control" type="text" name="addr2_a" id="getPostcode_input" required>
				<input class="form-control" type="text" name="addr2_b" id="getDetail_addr">
				<div class="input-group-append">
					<button class="btn btn-outline-success btn-Customer" type="button" id="getPostcode">우편번호찾기</button>
				</div>
			</div>
		</div>
		<!-- 상세주소 INPUT START -->
		<div class="form-group mt-1">
			<input class="form-control" type="text" id="getAddr1" name="addr1_a">
			<input class="form-control mt-1" type="text" id="getAddr2" name="addr1_b" placeholder="상세주소를 입력해주세요." required>
		</div>
		<!-- 주소 INPUT END -->
		
			<div class="interest_check"><!-- 관심장르 CHECKBOX START -->
			<div class="form-group mt-4">
				<label class="mb-1">도서 관심장르를 모두 선택해주세요.</label> <br>
			
				<div class="row">
					<!-- 관심장르 CHECKBOX 1st ROW -->
					<div class="d-inline-block w-50 p-1 form-check">
						<input type="checkbox" value="1" class="d-none form-check-input" id="interest_check1" name="genre"/>
						<div class="btn btn-light w-100 btn-Customer" id="interest1">인문</div>
						</label>
					</div>
			
					<div class="d-inline-block w-50 p-1 form-check"><input type="checkbox" value="2"
							class="d-none form-check-input" id="interest_check2" name="genre"/>
						<div class="btn btn-light w-100 btn-Customer" id="interest2">경영</div>
						</label>
					</div>
				</div> <!-- 관심장르 CHECKBOX 1st ROW END -->
			
				<div class="row">
					<!-- 관심장르 CHECKBOX 2nd ROW -->
					<div class="d-inline-block w-50 p-1 form-check"><label class="w-100 form-check-label"><input type="checkbox"
								value="3" class="d-none form-check-input" id="interest_check3" name="genre"/>
							<div class="btn btn-light w-100 btn-Customer" id="interest3">소설</div>
						</label></div>
			
					<div class="d-inline-block w-50 p-1 form-check"><label class="w-100 form-check-label"><input type="checkbox"
								value="4" class="d-none form-check-input" id="interest_check4" name="genre"/>
							<div class="btn btn-light w-100 btn-Customer" id="interest4">역사</div>
						</label></div>
				</div><!-- 관심장르 CHECKBOX 2nd ROW END -->
			
				<div class="row">
					<!-- 관심장르 CHECKBOX 3rd ROW -->
					<div class="d-inline-block w-50 p-1 form-check"><label class="w-100 form-check-label">
							<input type="checkbox" value="5" class="d-none form-check-input" id="interest_check5" name="genre"/>
							<div class="btn btn-light w-100 btn-Customer" id="interest5">순수과학</div>
						</label></div>
					<div class="d-inline-block w-50 p-1 form-check"><label class="w-100 form-check-label">
							<input type="checkbox" value="6" class="d-none form-check-input" id="interest_check6" name="genre"/>
							<div class="btn btn-light w-100 btn-Customer" id="interest6">응용과학</div>
						</label></div>
				 </div><!-- 관심장르 CHECKBOX 3rd ROW END -->
				</div><!-- 관심장르 CHECKBOX END -->
	
			<!-- 마케팅 동의 -->
				<div class="form-group form-check mt-4">
					<input type="checkbox" class="form-check-input" id="agreement">
					<label class="form-check-label" for="agreement">마케팅 정보 수신 동의(선택)</label>
					<small class="form-text text-muted mb-2">마케팅 정보 수신에 동의하시면 신간도서 및 이벤트 소식을 빠르게 전해드립니다.</small>
				</div>

		<!-- 가입버튼 -->
			<div class="form-group mt-2">
				<button class="btn btn-dark btn-block mb-1 btn-Customer" type="submit">가입하기</button>
				<small class="form-text text-muted text-center mb-4">회원가입 진행 시 딜리브러리의 <span class="signup_required">개인정보처리방침</span>에 동의하신 것으로 간주됩니다.</small>
			</div>
		</div>
		</form>
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
  

  <!---------------------- 자바스크립트 섹션 ----------------------->

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
	  <script type="text/javascript"	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript"	src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    // Get the current year for the copyright
    $('#year').text(new Date().getFullYear());

	//////////////////////////**우편번호**//////////////////////////////////
	window.onload=function(){
		document.querySelector('#getPostcode').addEventListener('click',function (){
			 new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("getDetail_addr").value = extraAddr;

					} else {
						document.getElementById("getAddr1").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('getPostcode_input').value = data.zonecode;
					document.getElementById("getAddr1").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("getAddr2").focus();
				}
			}).open();

		});


 	//////////////////////////**관심장르 체크박스**//////////////////////////////////
	let select = 0;
	let interestButton = ['#interest1','#interest2','#interest3','#interest4','#interest5','#interest6'];	
	let interestCheck = ['#interest_check1','#interest_check2','#interest_check3','#interest_check4','#interest_check5','#interest_check6'];	

	for(let i=0; i < interestButton.length; i++){	
		document.querySelector(interestButton[i]).addEventListener('click', function () {
				document.querySelector(interestButton[i]).classList.toggle('active');
				select += 1;
				if(select % 2 != 0) {
					document.querySelector(interestCheck[i]).setAttribute('checked', 'checked');
				} else {
					document.querySelector(interestCheck[i]).removeAttribute('checked');
				}
		})
	}
	//////////////////////////**이메일 중복체크:제이쿼리**//////////////////////////////////
	     
		$('#btn_emailCheck').click(function() {
			console.log('pleaassssssss');
			const email = $('#email').val();
			/* $('#emailck').removeClass('is-valid');
			$('#emailck').removeClass('is-invalid');
			$('#email_ok').css('display','none');
			$('#email_ok_ok').css('display','none'); */
			
			$.ajax({
				url:'/emailCheck.do',
				type:'POST',
				data:{
					"email":email
				},
				success:function(re){
					$('#email_msg').css('display','none');
					if(re>0){
						alert('이미 존재하는 이메일입니다.');
						$('#email').removeClass('is-valid');
						$('#email').addClass('is-invalid');
						$('#email_ok_ok').css('display','none'); 
						$('#email_ok').css('display','block');
						
					}else{
						alert('사용 가능한 이메일입니다.')
						$('#email').removeClass('is-invalid');
						$('#email').addClass('is-valid');
						$('#email_ok').css('display','none');
						$('#email_ok_ok').css('display','block');
						$('#email').val(email);
					}				
				},
				error:function(){
					alert("중복확인오류");
					$('#email_ok_ok').css('display','none'); 
					$('#email_ok').css('display','none');
				}						
			});
			
	});	

	//////////////////////////**비밀번호 및 비밀번호 확인**//////////////////////////////////
	
	let inputPw = document.getElementById('pw'); //패스워드 입력 
	let inputPw_check = document.getElementById('pw_check'); //패스워드 체크 입력

	let pw_length = document.getElementById('pw_length'); //패스워드 길이 메세지
	let pw_match = document.getElementById('pw_match'); // 패스워드 매치 메세지
	let pw_ok = document.getElementById('pw_ok'); // 패스워드 조합 메세지
	
	//패스워드창 클릭하면 메세지 띄우기
	inputPw.onfocus = function () {
		inputPw.classList.add('is-invalid');
		pw_match.style.display = 'block';
		pw_length.style.display = 'block';
		pw_ok.style.display = 'block';
	}

	//패스워드창 클릭 안하면 초록/빨강 인풋 테두리 없에기
	inputPw.onblur = function(){
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}

	//패스워드창 패스워드 체크
	inputPw.onkeyup = function(){
		let lowerCaseLetters = /[a-z]/g;
		let upperCaseLetters = /[A-Z]/g;
		let numbers = /[0-9]/g;

		//패스워드 8~16자, 대문자, 소문자 다 있으면 메세지 없에기
		if(inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers)){
			pw_ok.style.display = 'none';
		}

		//패스워드 길이 8자 이상이면 메세지 없에기
		if(inputPw.value.length >= 8) {
			pw_length.style.display = 'none';
		}

		//조건 다 맞으면 인풋 테두리 초록
		if (inputPw.value.match(lowerCaseLetters) && inputPw.value.match(upperCaseLetters) && inputPw.value.match(numbers) && (inputPw.value.length >= 8)) {
			inputPw.classList.remove('is-invalid');
			inputPw.classList.add('is-valid');
		}
	}

	//패스워드체크창 클릭하면 빨간테두리
	inputPw_check.onfocus = function() {
		inputPw_check.classList.add('is-invalid');
	}

	//패스워드체크창 나가면 테두리 빼기
	inputPw_check.onblur = function() {
		inputPw.classList.remove('is-invalid');
		inputPw.classList.remove('is-valid');
	}
	
	inputPw_check.onkeyup = function(){
		inputPw_val = document.getElementById('pw').value; //패스워드 입력값
		inputPw_check_val = document.getElementById('pw_check').value; // 패스워드 체크 입력값

		if(inputPw_val === inputPw_check_val) { //두개 값 같아지면 초록테두리 
			inputPw_check.classList.remove('is-invalid');
			inputPw_check.classList.add('is-valid');
			pw_match.style.display = 'none'; //불일치 메세지 없에기
		}
	}
	
}
  </script>
  
  <script type="text/javascript">
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