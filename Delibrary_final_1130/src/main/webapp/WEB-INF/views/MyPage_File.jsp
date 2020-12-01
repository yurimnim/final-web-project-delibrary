<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
<link rel="stylesheet" type="text/css" href="css/folder_hw.css">
<link rel="stylesheet" type="text/css" href="css/mypage_file_hw.css">
<link rel="stylesheet" type="text/css" href="css/delete_btn_hw.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script type="text/javascript">
$(function(){

   $("#manage_btn").click(function(){
      $("div.btn-front").toggle('fast');
      $("input.delete_check").toggle('fast');
      
      $(".delete_check").css('display','inline-block');
      $(".btn").css('display','inline-block');
      $(".btn").css('margin-top','-17px');
      $(".btn").css('margin-left','-10px');
      $(".btn-front").css('display','block');
      var btn = document.querySelector( '.btn' );

      var btnFront = btn.querySelector( '.btn-front' ),
          btnYes = btn.querySelector( '.btn-back .yes' ),
          btnNo = btn.querySelector( '.btn-back .no' );

      btnFront.addEventListener( 'click', function( event ) {
        var mx = event.clientX - btn.offsetLeft,
            my = event.clientY - btn.offsetTop;

        var w = btn.offsetWidth,
            h = btn.offsetHeight;
         
        var directions = [
          { id: 'top', x: w/2, y: 0 },
          { id: 'right', x: w, y: h/2 },
          { id: 'bottom', x: w/2, y: h },
          { id: 'left', x: 0, y: h/2 }
        ];
        
        directions.sort( function( a, b ) {
          return distance( mx, my, a.x, a.y ) - distance( mx, my, b.x, b.y );
        } );
        
        btn.setAttribute( 'data-direction', directions.shift().id );
        btn.classList.add( 'is-open' );

      } );

      btnYes.addEventListener( 'click', function( event ) {   
        btn.classList.remove( 'is-open' );
      } );

      btnNo.addEventListener( 'click', function( event ) {
        btn.classList.remove( 'is-open' );
      } );

      function distance( x1, y1, x2, y2 ) {
        var dx = x1-x2;
        var dy = y1-y2;
        return Math.sqrt( dx*dx + dy*dy );
      }
   });   

   $(".yes").click(function(){
      var check_val_arr = [];
      
      $('input:checked').each(function(i){
         check_val_arr.push($(this).val());
      })
      
      var data = {"p_id_arr" : check_val_arr};

        $.ajax({
             url:"/deleteMyPage_file",
             data:data, type:"POST",
             success:function(res){
           if(res == 1) {
              alert('삭제가 완료 되었습니다.');
              location.href = "http://localhost:8088/MyPage_File.do?group=50&cust_no="+${cust_no}+"&fol_no="+${fol_no}+"&fol_name=${fol_name}";
           }
           else if(res == -1){
              alert('삭제에 실패하였습니다.');
           }
           else if(res == -2){
            alert('삭제가 완벽히 완료되지않았습니다. 파일을 확인해주세요.');
              location.href = "http://localhost:8088/MyPage_File.do?group=50&cust_no="+${cust_no}+"&fol_no="+${fol_no}+"&fol_name=${fol_name}";
           }
         console.log(check_val_arr);
       }}); 
   });
   

   
   $(document).on('click', "#btn_text", function(){
      var p_id = $(this).parent().find("#p_id").val();
      var p_content = $(this).parent().find("textarea").val();
      
      data = {p_id:p_id, p_content:p_content};
        
       $.ajax({
          url:"updateMemo",
          data: data,
          success: function(res){
              if(res != 1) {
                  setTimeout(function() {
                     alret("메모 수정에 실패하였습니다.")
                  }, 1000)
               } else {
                   location.href = "http://localhost:8088/MyPage_File.do?group=50&cust_no="+${cust_no}+"&fol_no="+${fol_no}+"&fol_name=${fol_name}";
             }
        }});
    });
});
$( function(){
   //Get Color Attribute
   //Set the background book color
   $("li.book-item").each(function() {
      var $this = $(this);
      
      $this.find(".bk-front > div").css('background-color', $(this).data("color"));
      $this.find(".bk-left").css('background-color', $(this).data("color"));
      $this.find(".back-color").css('background-position', 'right center');
      $this.find(".back-color").css('background-size', '100000%');
      
      $this.find(".item-details a.button").on('click', function() {
          displayBookDetails($this);
      });
   });
   
   function displayBookDetails(el) {
      
   var $this = $(el);
   $('.main-container').addClass('prevent-scroll');
   $('.main-overlay').fadeIn();
   
   $this.find('.overlay-details').clone().prependTo('.main-overlay');
   
   $('a.close-overlay-btn').on('click', function(e) {
    e.preventDefault();
    $('.main-container').removeClass('prevent-scroll');
    $('.main-overlay').fadeOut();
    $('.main-overlay').find('.overlay-details').remove();
   });
   
   $('.main-overlay a.preview').on('click', function() {
    $('.main-overlay .overlay-desc').toggleClass('activated');
    $('.main-overlay .overlay-preview').toggleClass('activated');
   });
   
   $('.main-overlay a.back-preview-btn').on('click', function() {
    $('.main-overlay .overlay-desc').toggleClass('activated');
    $('.main-overlay .overlay-preview').toggleClass('activated');
   });
   }
   
   /*
   *  Offcanvas Menu
   */
   //Open Offcanvas Menu
   $('.main-navigation a').on('click', function() {
   $('.main-container').addClass('nav-menu-open');
   $('.main-overlay').fadeIn();
   });
   
   //Close Offcanvas Menu
   $('.overlay-full').on('click', function() {
   $('.main-container').removeClass('nav-menu-open');
   $('.main-container').removeClass('prevent-scroll');
   $(this).parent().fadeOut();
   $(this).parent().find('.overlay-details').remove();
   });


   /*
    *  Shuffle.js for Search, Catagory filter and Sort
    */

   // Initiate Shuffle.js
   var Shuffle = window.shuffle;

   var bookList = function(element) {
     this.element = element;

     this.shuffle = new Shuffle(element, {
       itemSelector: '.book-item',
     });

     this._activeFilters = [];
     this.addFilterButtons();
     this.addSorting();
     this.addSearchFilter();
     this.mode = 'exclusive';
   };

   bookList.prototype.toArray = function(arrayLike) {
     return Array.prototype.slice.call(arrayLike);
   };

   // Catagory Filter Functions
   // Toggle mode for the Catagory filters
   bookList.prototype.toggleMode = function() {
     if (this.mode === 'additive') {
       this.mode = 'exclusive';
     } else {
       this.mode = 'additive';
     }
   };

   // Filter buttons eventlisteners
   bookList.prototype.addFilterButtons = function() {
     var options = document.querySelector('.filter-options');
     if (!options) {
       return;
     }
     var filterButtons = this.toArray(options.children);

     filterButtons.forEach(function(button) {
       button.addEventListener('click', this._handleFilterClick.bind(this), false);
     }, this);
   };

   // Function for the Catagory Filter
   bookList.prototype._handleFilterClick = function(evt) {
     var btn = evt.currentTarget;
     var isActive = btn.classList.contains('active');
     var btnGroup = btn.getAttribute('data-group');

     if (this.mode === 'additive') {
       if (isActive) {
         this._activeFilters.splice(this._activeFilters.indexOf(btnGroup));
       } else {
         this._activeFilters.push(btnGroup);
       }

       btn.classList.toggle('active');
       this.shuffle.filter(this._activeFilters);

     } else {
       this._removeActiveClassFromChildren(btn.parentNode);

       var filterGroup;
       if (isActive) {
         btn.classList.remove('active');
         filterGroup = Shuffle.ALL_ITEMS;
       } else {
         btn.classList.add('active');
         filterGroup = btnGroup;
       }

       this.shuffle.filter(filterGroup);
     }
   };

   // Remove classes for active states
   bookList.prototype._removeActiveClassFromChildren = function(parent) {
     var children = parent.children;
     for (var i = children.length - 1; i >= 0; i--) {
       children[i].classList.remove('active');
     }
   };

   // Sort By
   // Watching for the select box to change to run
   bookList.prototype.addSorting = function() {
     var menu = document.querySelector('.sort-options');
     if (!menu) {
       return;
     }
     menu.addEventListener('change', this._handleSortChange.bind(this));
   };

   // Sort By function Handler runs on change
   bookList.prototype._handleSortChange = function(evt) {
     var value = evt.target.value;
     var options = {};

     function sortByDate(element) {
       return element.getAttribute('data-created');
     }

     function sortByTitle(element) {
       return element.getAttribute('data-title').toLowerCase();
     }

     if (value === 'date-created') {
       options = {
         reverse: true,
         by: sortByDate,
       };
     } else if (value === 'title') {
       options = {
         by: sortByTitle,
       };
     }

     this.shuffle.sort(options);
   };

   // Searching the Data-attribute Title
   // Advanced filtering
   // Waiting for input into the search field
   bookList.prototype.addSearchFilter = function() {
     var searchInput = document.querySelector('.shuffle-search');
     if (!searchInput) {
       return;
     }
     searchInput.addEventListener('keyup', this._handleSearchKeyup.bind(this));
   };

   // Search function Handler to search list
   bookList.prototype._handleSearchKeyup = function(evt) {
     var searchInput = document.querySelector('.shuffle-search');
     var searchText = evt.target.value.toLowerCase();

     // Check if Search input has value to toggle class
     if (searchInput && searchInput.value) {
       $('.catalog-search').addClass('input--filled');
     } else {
       $('.catalog-search').removeClass('input--filled');
     }

     this.shuffle.filter(function(element, shuffle) {

       // If there is a current filter applied, ignore elements that don't match it.
       if (shuffle.group !== Shuffle.ALL_ITEMS) {
         // Get the item's groups.
         var groups = JSON.parse(element.getAttribute('data-groups'));
         var isElementInCurrentGroup = groups.indexOf(shuffle.group) !== -1;

         // Only search elements in the current group
         if (!isElementInCurrentGroup) {
           return false;
         }
       }

       var titleElement = element.querySelector('.book-item_title');
       var titleText = titleElement.textContent.toLowerCase().trim();

       return titleText.indexOf(searchText) !== -1;
     });
   };

   // Wait till dom load to start the Shuffle js funtionality
   document.addEventListener('DOMContentLoaded', function() {
     window.book_list = new bookList(document.getElementById('grid'));
   });
})
</script>
<title>나의서재 - 딜리브러리</title>

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
  
   <!-- 도서관소개 PAGE HEADER -->
      <header id="page-header" class="noto-serif">
         <div class="page-header-overlay">
            <div class="container pt-5">
              <div class="row">
               <div class="col-md-6 m-auto text-center">
                 <h2>내서재</h2>
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
         <div class="col-md-3 noto-serif">
           <div class="sidebar">
               <div class="side-head">
                  <h4 class="text-light">나의도서</h4>
               </div>
               
               <ul class="list-group list-group-flush mb-5">
                  <li class="list-group-item"><a href="mypage_main.do?cust_no=${cust_no }">나의도서정보</a></li>
                  <li class="list-group-item"><a href="borrowList.do">대출현황</a></li>
                  <li class="list-group-item"><a href="return_borrowList.do">대출/반납이력</a></li>
                  <li class="list-group-item active"><a href="MyPage_Folder.do?cust_no=${cust_no }&group=50">내서재</a></li>                  
                  <li class="list-group-item"><a href="MyPage_Info.do?cust_no=${cust_no }">개인정보수정</a></li>
               </ul>
           </div>
      </div>

        <!-- 메인내용 -->
        <div class="col-md-9 fol_div" id="main_div_css">
           <input type="hidden" name="cust_no" value="${c.cust_no }">
           <div class="card noto-serif">
               <div class="card-body" id="fol_card">
                <img src="img/${c.fname }" width="180" height="180" align="left" style="background: white;"><br>
                  <p id="fol_card_name" style="padding-top: 10%">${c.name } 님의 서재</p>
               </div>
         </div>   
         
         
         <div class="container-fluid">
            <div class="row">
               <div class="col-sm-4 noto-serif">
                     <p align="left" style="padding-top: 10px">
                        <font style="font-size: x-large; font-weight: bold;" >${fol_name } </font>&nbsp;&nbsp;&nbsp;도서 ${totalFile }권 
                     </p>
               </div>
               <div class="col-sm-8" style="padding-right: 0px; padding-left: 0px;">
            <form action="MyPage_File.do" method="post">
                       <input type="hidden" name="cust_no" value="${c.cust_no }">
                       <input type="hidden" name="fol_no" value="${fol_no }">
                       <input type="hidden" name="fol_name" value="${fol_name }">
                       <input type="hidden" name="group" value=50>
                     <!-- Search -->
                     <select name="option" id="option">
                        <option value="p_title">제목</option>
                        <option value="p_writer">저자</option>
                        <option value="p_content">내용</option>
                     </select>
                     <div class="catalog-search">
                       <input class="shuffle-search input_field " type="search" autocomplete="off" maxlength="128" id="input-search" placeholder="검색어를 입력하세요." name="search"/>
                           <label class="input_label" for="input-search">
                             <span class="input_label-content"></span>
                             <span class="input_label-search"></span>
                           </label>
                     </div>
            </form>
               </div>
                     
             </div>
         </div>           
           <hr>
           
         <div style="text-align: left;">
         <button id="manage_btn" class="noto-serif">관리</button>
                <div class="btn">
                
              <div class="btn-back">
                <p>정말 삭제 하시겠습니까?</p>
                <button class="yes">Yes</button>
                <button class="no">No</button>
              </div>
              <div class="btn-front noto-serif">삭제</div>
            </div>
               
         </div>
        <br>
        
          <div class="grid-shuffle">
        <ul id="grid" class="row">
   <c:forEach var="p" items="${list }" varStatus="status">
          <li class="book-item small-12 medium-6 columns" data-groups='["classic"]' data-date-created='1937' data-title='Of Mice and Men' data-color='#fcc278'>
            <div class="bk-img" >
              <div class="bk-wrapper">
                <div class="bk-book bk-bookdefault">
                  <div class="bk-front">
                  <!-- style="background-image: url('http://interactivejoe.com/book-viewer/assets/images/bk_1-small.jpg') -->
                    <div class="bk-cover" style="background-image: url('${p.fname}'); width:100%; height:100%;"></div>
                  </div>
                  <div class="bk-back"></div>
                  <div class="bk-left"  style="background-image: url('${p.fname}');"></div>
                </div>
              </div>
            </div>
            
            <div class="item-details">
              <input type="hidden" class="p_id" name="p_id" value="${p.p_id} ">
           <c:set var="p_title" value="${p.p_title }"/>
             <h3 class="book-item_title">
                  ${fn:substring(p_title,0,15) }
              <c:if test="${fn:length(p_title) gt 14}">
                   . . .
              </c:if>
             </h3>
              <p class="author">${p.p_writer } <br> 
                <fmt:formatDate value="${p.p_regdate}" pattern="yyyy년 MM월 dd일"/>
                </p>
            <c:set var="p_content" value="${p.p_content }"/>
                <p>
                   ${fn:substring(p_content,0,15) }
                   <c:if test="${fn:length(p_content) gt 14}">
                     . . .
                 </c:if>
            </p>
              <%-- <p>${contentList${status.index}}</p> --%>
              <input type="checkbox" name="delete_check_name" value="${p.p_id }" style="display: none;" class="delete_check">
              <a href="#" class="button detail">Details</a>
            </div>
            
            
            <div class="overlay-details">
              <a href="#" class="close-overlay-btn">Close</a>
              <div class="overlay-image">
                <div class="back-color" style="background-image: url('${p.fname}');">
                </div>
                <img src="${p.fname }" alt="Book Cover" width="250px" height="400px" style="margin-left: 9%; margin-top: 2%">
              </div>
              <div class="overlay-desc activated" style="padding-left: 10px; padding-top: 20px;">
                <h2 class="overlay_title">${p.p_title }</h2>
                <p class="author">${p.p_writer }</p>
                <p class="published"><fmt:formatDate value="${p.p_regdate}" pattern="yyyy년 MM월 dd일"/></p>
                <p class="synopsis">
                   ${fn:substring(p_content,0,15) }
                   <c:if test="${fn:length(p_content) gt 14}">
                     . . .
                 </c:if>
                  </p>
                <a href="#" class="button preview" id="memo_move">메모장으로 이동</a>
              </div>
              <div class="overlay-preview">
                <a href="#" class="back-preview-btn">  Back</a>
                <h4 class="preview-title">뒤로가기</h4>
                <div class="preview-content">
                  <h5>Memo</h5>
               <input type="hidden" id="p_id" name="p_id" value="${p.p_id} ">
         <textarea rows="10" cols="60" id="p_content" name="p_content">${p.p_content }</textarea>
         <button type="button" id="btn_text" name="btn_text">저장</button>
                </div>
              </div>
            </div>
          </li>
   </c:forEach>
          </ul>
        </div>

        </div>
      </div>
    </div>
  </section>
 </div>
 
  <div class="main-overlay">
    <div class="overlay-full"></div>
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