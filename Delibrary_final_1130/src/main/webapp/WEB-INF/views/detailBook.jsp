<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="jquery-ui-1.12.1/jquery-ui.min.css">
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
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
  <title>도서정보 - 딜리브러리</title>
  <style>
    /* 용택 - 마우스 갖다대면 효과*/
     .reverse {
   color: white;
   background-color: #58ACFA;
   border-radius: 10px;
   }
   
    /* 내서재 추가 / 바로대여*/
    .buttonadd {
      border-radius: 4px;
      background-color: #F2F2F2;
      color: black;
      
      text-align: center;
      font-size: 20px;
      width: 30%;
      height: 20%;
      transition: all 0.5s;
      cursor: pointer;
      margin: 5px;
    }
    /* 내서재 추가 / 바로대여*/
    .buttonadd span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }
    /* 내서재 버튼 효과/ 바로대여*/
    .buttonadd span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }
    
    .buttonadd:hover span {
      padding-right: 25px;
    }
    
    .buttonadd:hover span:after {
      opacity: 1;
      right: 0;
    }
    
    #card-no-border{
         border: none;
         border-right: 1px solid #DFDFDF;
      }
    </style>



  <style>
    /* 아코디안
Add a fold-out icon to any element, by adding a data-attribute:
`data-css-icon` with one of the following values:
- cross
- dots
- down
- equals
- menu
- plus
- right
AND a blank <i></i>-tag.
_Example:_
<span data-css-icon="cross">Title here<i></i><span>.
Extra modifiers are `fill`, `outline` and `square`.
_Example:_
<span data-css-icon="square cross outline">Title here<i></i><span>.
*/
[data-css-icon] {
   --animdur: .3s;
  --loading-animdur: 0.8s;
   --animtf: ease-in;
   --bdw: 2px;
  --bdrs: 50%;
  --bgc: transparent;
   --c: currentcolor;
  --dots-bgc: silver;
  --dots-size: 0.5rem;
  --icon-size: 1rem;
   --size: 3.0rem;
   align-items: center;
  cursor: pointer;
   display: flex;
   justify-content: space-between;
}
[data-css-icon] i {
  align-items: center;
  background-color: var(--bgc);
  border-radius: var(--bdrs);
  box-sizing: border-box;
  display: inline-flex;
  height: var(--size);
  justify-content: center;
  position: relative;
  transition: background-color var(--animdur) var(--animtf);
  width: var(--size);
}
[data-css-icon] i::after,
[data-css-icon] i::before {
  transform-origin: 50% 50%;
   transition: all var(--animdur) var(--animtf);
}
[data-css-icon*="down"] i::after,
[data-css-icon*="right"] i::after {
  background: transparent;
   border-color: var(--c);
   border-style: solid;
  box-sizing: border-box;
   content: '';
   display: inline-block;
   height: var(--icon-size) ;
   margin: 0;
  position: relative;
   width: var(--icon-size);
}
[data-css-icon*="down"] i::after {
   border-width: 0 var(--bdw) var(--bdw) 0;
  top: calc(0px - (var(--icon-size) / 4));
  transform: rotate(45deg);
}
[data-css-icon*="right"] i::after {
   border-width: var(--bdw) var(--bdw) 0 0;
  right: calc((var(--icon-size) / 4));
  top: 0;
   transform: rotate(45deg);
}
[data-css-icon*="equals"] i::after,
[data-css-icon*="equals"] i::before,
[data-css-icon*="cross"] i::after,
[data-css-icon*="cross"] i::before,
[data-css-icon*="menu"] i,
[data-css-icon*="menu"] i::after,
[data-css-icon*="menu"] i::before,
[data-css-icon*="plus"] i::after,
[data-css-icon*="plus"] i::before {
  /* Width need to be the diagonal of the down-arrow side-length (--size): sqrt(2) * --size. */
   --w: calc(var(--icon-size) * 1.4142135623730950488016887242097);
   background: var(--c);
   content: '';
   height: var(--bdw);
   position: absolute;
   width: var(--w);
}
[data-css-icon*="cross"] i::before,
[data-css-icon*="plus"] i::before {
   transform: rotate(90deg);
}
[data-css-icon*="equals"] i {
  --m: 4px;
}
[data-css-icon*="equals"] i::after {
  transform: translateY(var(--m));
}
[data-css-icon*="equals"] i::before {
  transform: translateY(calc(0px - var(--m)));
}
[data-css-icon*="dots"],
[data-css-icon*="menu"] {
  height: var(--size);
}
[data-css-icon*="menu"] i {
  --bdrs: 0;
  --m: 7px;
  position: relative;
  right: calc((var(--size) - var(--w)) / 2);
}
[data-css-icon*="menu"] i::after {
  top: var(--m);
}
[data-css-icon*="menu"] i::before {
  top: calc(0px - var(--m));
}
[data-css-icon*="dots"] i,
[data-css-icon*="dots"] i::after,
[data-css-icon*="dots"] i::before {
  animation: dots var(--loading-animdur) infinite alternate;
  background-color: var(--c);
  border-radius: 50%;
  content: "";
  display: inline-block;
  height: var(--dots-size);
  width: var(--dots-size);
}
[data-css-icon*="dots"] i {
  animation-delay: var(--loading-animdur);
  position: relative;
  right: calc((var(--size) - var(--dots-size)) / 4);
}
[data-css-icon*="dots"] i::after {
  animation-delay: 0s;
  left: calc(0px - (var(--dots-size) * 3));
  position: absolute;
}
[data-css-icon*="dots"] i::before {
  animation-delay: calc(var(--loading-animdur) / 2);
  left: calc(0px - (var(--dots-size) * 1.5));
  position: absolute;
}
[data-css-icon*="spin"] i::after {
  animation: spin var(--loading-animdur) infinite linear;
  border-radius: 50%;
  border: var(--bdw) solid var(--dots-bgc);
  border-left: var(--bdw) solid var(--c);
  content: "";
  height: var(--icon-size);
  transform: translateZ(0);
  width: var(--icon-size);
}
/* STATE */
[open] > summary > [data-css-icon*="cross"] i::after {
   transform: rotate(45deg);
}
[open] > summary > [data-css-icon*="cross"] i::before {
  transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="down"] i::after {
  top: var(--bdw);
   transform: rotate(45deg) scale(-1) ;
}
[open] > summary > [data-css-icon*="right"] i::after {
  right: 0;
  top: calc(0px - (var(--icon-size) / 4));
   transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="plus"] i::after {
   transform: rotate(180deg);
}
[open] > summary > [data-css-icon*="plus"] i::before {
   transform: rotate(-0deg);
}
[open] > summary > [data-css-icon*="equals"] i::after { transform: rotate(-45deg); }
[open] > summary > [data-css-icon*="equals"] i::before { transform: rotate(45deg); }
[open] > summary > [data-css-icon*="menu"] i { background-color: transparent; }
[open] > summary > [data-css-icon*="menu"] i::after { transform: translateY(calc(0px - var(--m))) rotate(-45deg); }
[open] > summary > [data-css-icon*="menu"] i::before { transform: translateY(var(--m)) rotate(45deg); }
/* RTL: inset-block-end fails */
[dir="rtl"] [data-css-icon*="right"] i::after {
   left: calc((var(--icon-size) / 4));
}
[dir="rtl"] [data-css-icon*="menu"] i {
   left: 0.5rem;
  right: auto;
}
/* MODIFIERS */
[data-css-icon*="outline"] i {
  border: var(--bdw) solid var(--c);
}
[data-css-icon*="fill"] {
  --bgc: hsl(196, 64%, 39%);
  --c: hsl(195, 10%, 95%);
}
[data-css-icon*="square"] {
  --bdrs: 5px;
}
/* For this demo only */
body { font-family: system-ui, sans-serif; }
/*버튼크기 
button, details { width: 6rem; }*/
button { font-family: inherit; font-size: inherit; }
details {
  height: var(--collapsed);
  overflow: hidden;
  transition: height 300ms cubic-bezier(0.4, 0.01, 0.165, 0.99);
}
details[open] {
  height: var(--expanded);
}
button,
summary { 
  background-color: var(--bgc);
  border: 0;
  border-radius: 5px;
  color: var(--c, inherit);
  list-style-type: none;
  margin: 0.5rem 0;
  outline: none;
  padding-bottom: 0.5rem;
  padding-top: 0.5rem;
  padding-inline-end: 0.5rem;
  padding-inline-start: 1rem;
  user-select: none;
}
summary::marker { display: none; }
summary::-webkit-details-marker { display: none; }
/* 4 States of summary */
button,
summary {
  --bgc: hsl(195, 10%, 90%);
}
[open] > summary {
  --bgc: hsl(195, 10%, 20%);
  --c: hsl(195, 10%, 92%);
}
button:focus,
summary:focus {
  --bgc: hsl(195, 10%, 75%);
}
[open] > summary:focus {
  --bgc: hsl(195, 10%, 10%);
    --c: hsl(195, 10%, 99%);
}
[open] > summary:focus > [data-css-icon*="fill"],
[open] > summary > [data-css-icon*="fill"] {
  --bgc: hsl(195, 10%, 80%);
  --c: hsl(195, 10%, 10%);
}
summary + * {
  color: #777;
  line-height: 1.6;
  padding: 0.5rem;
}
@keyframes dots {
  0% {
    background-color: var(--c);
  }
  50%,
  100% {
    background-color: var(--dots-bgc);
  }
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(1turn);
  }
}
</style>

   
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript">
//전역변수
var FOL_NO =1;
let cust_no = Number(${cust_no});
//book for DB
var b_image;
var b_title;
var b_writer="";
var b_year;
var b_price;
var detail;
//책소개 아코디안
  function setDetailsHeight(selector, wrapper = document) {
   
   
}
/* Run it */
setDetailsHeight('details');
$(function(){
   
   
   <!-- 홈화면에서 책 누르면 자동으로 검색되는 ajax (재성이 추가)-->
   let search = function() {
      $.ajax({
         method: "GET",
         url: "https://dapi.kakao.com/v3/search/book?target=title",
         data: { query:  $("#query").val() },
         headers: {Authorization: "KakaoAK 0050577fad730d5470e0f11bcdf64cd6"}
      })
         .done(function(msg) {
            
            $('#b_image').attr("src", msg.documents[0].thumbnail);
            $('#b_title').text("제목 " + msg.documents[0].title);
            $('#b_writer').text("저자 " + msg.documents[0].authors);
            $('#b_year').text("출간일 " + (msg.documents[0].datetime).substr(0, 10));
            $('#b_price').text("가격 " + msg.documents[0].price+"원");
            $('#detail').text(msg.documents[0].contents);
            //변수처리
            b_image = msg.documents[0].thumbnail
            b_title = msg.documents[0].title
            b_writer = msg.documents[0].authors
            b_year = msg.documents[0].datetime
            b_price = msg.documents[0].price
            detail = msg.documents[0].contents
         });
   }
   search();
   //대여 누를시 책으로 저장하게함
   var insertBook= function(){   
      /*
      b_image
      b_title
      b_writer
      b_year
      b_price
      detail
      
      */
      //alert(detail);
      b_writer2 = JSON.stringify(b_writer);
      b_writer2 = b_writer2.slice(2,-2);
      
      //alert(typeof detail);
      var data ={"b_writer":b_writer2,"b_image":b_image,"b_title":b_title,"b_year":b_year,"b_price":b_price,"b_detail":detail }
      
      $.ajax({
         url:"insertBook",
         dataType:"Json",
         type:"POST",
         data:data,
         success:function(data){
            console.log(data);
            }
         });
      }
   var insertPost = function(){
      b_writer2 = JSON.stringify(b_writer);
      b_writer2 = b_writer2.slice(2,-2);
      //폴더값 가져와지는지 확인용
      //alert(P_TITLE)
      var data ={"FOL_NO":FOL_NO,"b_title":b_title,"b_writer":b_writer2,"cust_no":cust_no,"fname":b_image }
      $.ajax({
         url:"/insertPost",
         dataType:"Json",
         type:"POST",
         data:data,
         success:function(data){
            console.log(data);
            }
         });
      }
   // 폴더 클릭하면 값가져오기
   $('#tempList').on("click","tr",function(){
      //alert($(this).find("td:eq(0)").text());
      FOL_NO =eval($(this).find("td:eq(0)").text());
      //alert(FOL_NO);
      var result = confirm("폴더에 저장하시겠어요?");
      if(result){
         insertPost();
          alert("저장 하였습니다.");
         $('.ui-icon-closethick').click();
      }else{
          alert("취소 되었습니다.");
      }
      
      });
   //대여버튼
   $('#borrow').click(function(){
      $('#dialog-borrow').dialog({
      modal: true, 
      height:250,
      width:340,
      buttons: {
         
         "대여": function() {
             var days =${days }

             if(days>0){
                 alert("연체일수 " +days+"입니다.    대여가 불가능합니다.")
               
                 }else{
                    var count = eval(${b.b_count });
                     var count2 = eval(${sumbook });
                      var b_no = eval(${b.b_no });
                      var cust_no = eval(${cust_no });
                      var data= {"cust_no":cust_no, }
                        if(count2 >=10){
                           alert("대여가능 도서권수를 초과하였습니다")
                        }else{
                            insertBook();
                            
                           var b_no =eval(${b.b_no });
                           var cust_no =eval(${cust_no });
                           
                           $.ajax({
                              url :"/insertBorrow",
                              dataType:"Json",
                              data:data,
                                 //"b_no="+b_no,
                              //data: "cust_no="+${cust_no }}
                              type: "POST",
                              success:function(data){
                                 alert("대출완료")
                              },
                              error : function(){
                                 alert("에러")      
                              }
                              });   
                        }$( this ).dialog( "close" );
                     
                     }            
      },"취소": function() {$('.ui-icon-closethick').click();}
             },               
   });                  
   });
   //내서재 추가
   $('#my_library').click(function(){
      //var result = confirm('내서재에 추가하시겠습니까??'); 
      //if(result){
      //var cust_no =eval(${cust_no });
      $('#dialog-library').dialog({
         modal:true,
           show: {effect: "blind", duration: 600 },         
         height:400,
         width:550,
         buttons:   {
            "내서재보기":function(){
               location.href='MyPage_Folder.do?cust_no=${cust_no}&group=50';
            }
         }
      });
   });
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
  </head>
<body class="d-flex flex-column">
   <input id="query" value="${query}" type="hidden">
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
              <c:if test="${cust_no != null}">   
               <li class="nav-item" v-bind:title="bookcart">
                  <a href="BookCart.do" class="nav-link"><i class="fas fa-book"></i></a><p class="sr-only">북카트</p>
               </li>
               </c:if>
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
              <h2>책 상세보기</h2>
            </div>
           </div>
         </div>
      </div>
   </header>
      
  <!-- MAIN SECTION -->
   <section id="contact" class="py-3">
      <div class="container">
        <div class="row">
      <!-- 메인내용 -->
        <div class="col">
          <div class="p-4">
            <div class="card-body">
              
              <!-- CARD GROUPS -->
              <div class="card-group">
                <div class="card" id="card-no-border">
                  <img id="b_image" class="img" src="${b.b_image }" alt=""style="margin-left: auto; margin-right: auto; display: block; height:100%;"/>
                </div>
                <div class="card noto-serif">
                  <div class="card-body">
                      <h4 class="card-title" id="b_title" name="f"></h4>
                      <p class="card-text m-1" id="b_writer"></p>
                      <p class="card-text m-1" id="b_year"></p>
                      <p class="card-text m-1" id="b_price">가격</p>
                      <p class="card-text m-1 pb-2">구입가능 링크</p>
                      <div class="ml-3">
                         <p class="card-text d-inline pr-3"><a href="https://search.kyobobook.co.kr/web/search?vPstrKeyWord=${query }"><img alt="교보문고" src="../img/kyobo.png" height="30px"></a></p>
                         <p class="card-text d-inline pr-3"><a href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=${query }"><img alt="알라딘" src="../img/aladin.jpg" height="30px"></a></p>
                         <p class="card-text d-inline pr-3"><a href="https://book.naver.com/search/search.nhn?sm=sta_hty.book&sug=&where=nexearch&query=${query }"><img alt="네이버 책" src="../img/naver_book.png" height="30px"></a></p>
                      </div>
                  </div>
                </div>

                </div>
              </div>
              <br><br>
              
              <!-- HOVERABLE -->
              <div class="row pb-2">
                <div class="col">
                  <h5>책소개</h5>
                  <details>
                    <summary>
                      <span data-css-icon="down fill">책소개<i></i></span>
                    </summary>
                    <div id="detail">
                    </div>
                  </details>
                  <!-- 
                  <details>
                    <summary>
                      <span data-css-icon="down fill">혹시몰라서<i></i></span>
                    </summary>
                    <div>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos minus quo ipsam culpa! Dicta, reiciendis.
                    </div>
                  </details>
                -->
                    <br>
                    <br>
                <c:if test="${not empty cust_no }"> 
                  <button id=my_library class="buttonadd"
                  style="float: left; margin-left: 100px;">
                  <span>내서재 추가</span>
                </button>
                </c:if>
                 <c:if test="${not empty cust_no }">     
                <button id=borrow class="buttonadd"
                  style="float: left; margin-left: 50px;">
                  <span>북카트에 담기</span>
                </button>
                </c:if>
                
                
                
             <!-- 모달 다이얼로그 모음 -->
             
             <!-- 도서대여 클릭시 첫화면 -->
             
         <div id="dialog-borrow" title="도서대여" style='display: none'>
         <img width="85px" height="70px" alt="book image" src="img/borrow.png" style="cursor: default;">
            <span style='color: green; font-size: 15pt;'> 대출하시겠습니까? </span>
         </div>
            <!-- 내서재추가 클릭시 폴더 선택 화면 -->
            <div id="dialog-library" title="내폴더 선택" style='display: none'>
                     <h3>폴더 목록</h3>
            <table width="30%" id="tempList">
               <c:forEach var="g" items="${f }">
               <tr>
                  <td>${g.fol_no }</td>
                  <!-- <td>${g.fol_no }</td> -->
                  <td><img width="50px" height="60px" alt="book image"
               src="img/folder.png"></td>
                  <td  id ="test" class="folder">${g.fol_name }</td>            
               </tr>
               </c:forEach>                  
            </table>
            
         </div>      
            </div>
          </div>
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
          <p>Copyright &copy;
            <span id="year"></span> Delibrary</p>
        </div>
      </div>
    </div>
  </footer>


  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"   src="../jquery-ui-1.12.1/jquery-ui.min.js"></script>
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
  </script>
</body>

</html>