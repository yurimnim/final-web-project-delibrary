<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
  <!-- 구글폰트 전체 기본적용 -->
   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap" rel="stylesheet">
   <!-- 구글폰트 전체 기본적용 END -->
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/post.css">
   <script src="https://cdn.jsdelivr.net/npm/vue"></script>
   <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
   <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
  <script>
    // Get the current year for the copyright
    $(function(){
       $('#year').text(new Date().getFullYear());
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
  <title>커뮤니티 - 딜리브러리</title>
</head>

<body class="d-flex flex-column" onselectstart="return false">
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
                        <li><a class="dropdown-item" href="postList.do?group=10"> 공지사항 </a></li>
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
                        <li><a class="dropdown-item" href="postList.do?group=20">창작물게시판</a></li>
                        <li><a class="dropdown-item" href="postList.do?group=30">중고장터</a></li>
                        <li><a class="dropdown-item" href="postList.do?group=60">자유게시판</a></li>
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
   <!-- 메인나브 -->
  
   <!-- 커뮤니티 헤더 -->
   <header id="page-header" class="noto-serif">
   <div class="page-header-overlay">
      <div class="container pt-5">
        <div class="row">
            <div class="col m-auto text-center">
              <c:if test="${group eq 10}">
                  <h2>공지사항</h2>
               </c:if>
              <c:if test="${group eq 20}">
                  <h2>창작물 게시판</h2>
               </c:if>
               <c:if test="${group eq 30}">
                  <h2>중고장터</h2>
               </c:if>
               <c:if test="${group eq 40}">
                  <h2>묻고답하기</h2>
               </c:if>
               <c:if test="${group eq 60}">
                  <h2>자유게시판</h2>
               </c:if>
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
            <c:choose>
               <c:when test="${group eq 10 || group eq 40 }">
                  <div class="sidebar">
                     <div class="side-head">
                        <h4 class="text-light">도서관소개</h4>
                     </div>
                     <ul class="list-group list-group-flush mb-5">
                        <li class="list-group-item"><a href="howtoInfo.do">대출/반납/연장</a></li>
                        <li id="post10" class="list-group-item"><a href="postList.do?group=10">공지사항</a></li>
                        <li class="list-group-item"><a href="faqViewpage.do">자주묻는질문</a></li>
                        <li id="post40" class="list-group-item"><a href="postList.do?group=40">묻고답하기</a></li>
                        <li class="list-group-item"><a href="addrViewpageAPI.do">오시는길</a></li>
                     </ul>
                 </div>      
               </c:when>
               <c:otherwise>
                  <div class="sidebar">
                     <div class="side-head">
                        <h4 class="text-light">커뮤니티</h4>
                     </div>
                     <ul class="list-group list-group-flush mb-5">
                        <li id="post20" class="list-group-item"><a href="postList.do?option=p_title&search=&group=20" class="returnAll">창작물게시판</a></li>
                        <li id="post30" class="list-group-item"><a href="postList.do?option=p_title&search=&group=30" class="returnAll">중고장터</a></li>
                        <li id="post60" class="list-group-item"><a href="postList.do?option=p_title&search=&group=60" class="returnAll">자유게시판</a></li>
                     </ul>
                 </div>
               </c:otherwise>
            </c:choose>
         </div>

         <!-- 메인내용 -->
         <div class="col-md-9 pb-4">
        <!-- ACTIONS -->
        <section id="actions" class="py-4">
          <div class="container">
            <div class="row noto-serif">
              <div class="col-md-2">
                <a href="postList.do?option=p_title&search=&group=${group}" class="btn btn-light btn-block">
                  <i class="fas fa-arrow-left"></i> 목록
                </a>
                     </div>
                     <div class="col-md-6">
                        <span>&nbsp;</span>
                     </div>
                     <c:if test="${not empty cust_no }">
                        <c:if test="${post.cust_no eq cust_no || cust_no==1}">
                           <c:set var="setPostCustNo" value="${post.cust_no }"></c:set> <!-- 관리자 로그인시 글쓴이 회원번호로 셋해줌 -->
                    <div class="col-md-2">
                      <a href="postUpdate.do?p_id=${post.p_id}&&cust_no=${cust_no}&&group=${group}" class="btn btn-success btn-block">
                        <i class="fas fa-edit"></i> 수정
                      </a>
                    </div>
                    <div class="col-md-2">
                      <button id="btnDel" class="btn btn-outline-danger btn-block"  p_id="${post.p_id}" cust_no="${setPostCustNo }" group="${group}">
                        <i class="far fa-trash-alt"></i> 삭제
                      </button>
                    </div>
                        </c:if>
                     </c:if>
            </div>
          </div>
        </section>
            <!-- 글상세 -->
            <section id="details">
             <div class="container">
               <div class="row">
                 <div class="col">
                   <div class="card">
                     <div class="card-header">
                       <h4 class="noto-serif">
                          <c:if test="${group!=10&&group!=40 && group!=60}">[${post.p_option }]</c:if>
                          <c:if test="${group==10}">[공지]</c:if>
                          ${post.p_title}
                       </h4>
                              <p class="text-muted text-small pt-2 m-0">
                                 게시일 <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${post.p_regdate }" /> | 작성자 ${post.p_writer} | 조회 ${post.p_hit }
                              </p>
                     </div>
                     <div class="card-body">
                              <textarea id="p_content" class="noto-sans" readonly>${post.p_content}</textarea>
                              <c:if test="${not empty post.fname }">
                                 <a href="/img/${post.fname }"><img src="/img/${post.fname }" alt="${post.fname }" height="200"></a>
                              </c:if>
                           </div>
                           <input type="hidden" name="p_id" value="${post.p_id}">
                           <input type="hidden" name="p_no" value="${post.p_no}">
                           <input type="hidden" name="fname" value="${post.fname}">
                           <input type="hidden" name="cust_no" value="${post.cust_no}">
                                    
                           <!-- 댓글창 -->
                           <div class="card-body">
                              <div class="container">
                                 <div class="row card-header py-2">
                                    <div class="p-0 noto-serif">
                                       <h5 class="m-0">댓글 
                                          <button id="btnInsertReply" class="btn btn-secondary btn-sm text-small" p_id="${post.p_id}" p_no="${post.p_no}" cust_no="${cust_no }" group="${group}">등록</button>
                                       </h5>
                                    </div>
                                 </div>  
                              </div>
                      <div class="form-group">
                                 <textarea id="re_content" name="re_content" value="${re_content}" class="form-control" rows="3" placeholder="댓글을 입력하세요."></textarea>
                      </div>
                              <!-- 댓글목록보기 -->
                      <c:forEach var="r" items="${listReply }">
                         <table width="100%">
                            <tr class="">
                               <td class="text-center pr-2" rowspan="3" width="10%"><img alt="" src="img/${r.fname }" width="50px" height="50px" class="rounded-circle" border="1"></td>
                               <th>${r.re_writer}</th>
                               <td width="20%">
                                  <div class="text-right">
                                     <c:if test="${not empty cust_no }">
                                        <c:if test="${r.cust_no==cust_no || cust_no==1}">
                                           <c:set var="setReplyCustNo" value="${r.cust_no }"></c:set> <!-- 관리자 로그인시 댓글쓴이 회원번호로 셋해줌 -->
                                                   <button class="btn btn-outline-success btn-sm table-align-right block-inline btnUpdateReply" id="btnUpdateReply" re_no="${r.re_no}" cust_no="${setReplyCustNo }" re_content="${r.re_content }" p_id="${post.p_id}" group="${group }" edit_re = "y"><i class="fas fa-edit"></i></button>
                                           <button class="btn btn-outline-danger btn-sm table-align-right block-inline btnDeleteReply" re_no="${r.re_no}" cust_no="${setReplyCustNo }"><i class="far fa-trash-alt"></i></button>
                                        </c:if>
                                     </c:if>
                                  </div>
                                       </td>
                            </tr>
                            <tr>
                               <td colspan="2" id="card-body">${r.re_content }</td>
                            </tr>
                            <tr>
                               <td colspan="2"><small class="text-muted"><fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${r.re_regdate }" /></small></td>
                            </tr>
                         </table>
                      </c:forEach>
                           </div>
                   </div>
                 </div>
               </div>
             </div>
           </section>
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

   <script type="text/javascript">
      $(function(){
         //게시글 삭제 버튼 btnDel
         $("#btnDel").click(function(){
            const p_id=this.getAttribute("p_id");
            const cust_no=this.getAttribute("cust_no");
            const group=this.getAttribute("group");

            var result=confirm("삭제시 복원이 불가합니다. 정말로 삭제하시겠습니까?");
            if(result){
               $.ajax({
                  url:'postDelete.do',
                  type:'POST',
                  data:{
                     "p_id":p_id,
                     "cust_no":cust_no,
                     "group":group
                  },
                  success:function(re){
                     if(re>0){
                        console.log(re+", 삭제 성공");
                        window.location="postList.do?group="+group;
                     }else{
                        alert("작성자 본인만 삭제할 수 있습니다.")
                     }
                  },
                  error:function(){
                     alert("게시글 삭제에 실패하였습니다.");
                  }
               });
            }
         });

         //댓글 등록 버튼 btnInsertReply
         $("#btnInsertReply").click(function(){
            const p_id=this.getAttribute("p_id");
            const p_no=this.getAttribute("p_no");
            const cust_no=this.getAttribute("cust_no");
            const group=this.getAttribute("group");
            const re_content=$("#re_content").val();

            console.log("p_id  :   "+p_id)
            console.log("p_no  :   "+p_no)
            console.log("cust_no  :   "+cust_no)
            console.log("group  :   "+group)
            console.log("re_content  :   "+re_content)

            $.ajax({
               url:'replyInsert.do',
               type: 'POST',
               data: {
                     "p_id": p_id,
                     "p_no": p_no,
                     "cust_no": cust_no,
                     "group": group,
                     "re_content": re_content
                  },
               success: function(re){
                     if(re>0){
                        console.log(re);
                        window.location="postDetail.do?p_id="+p_id+"&&group="+group;
                     }else{
                        alert("댓글 등록 실패");
                     }
                  },
               error: function(){
                     alert("내용을 입력하세요.");
                  }
            });
         });

         //댓글 수정버튼 btnUpdateReply
         $("#btnUpdateReply").click(function(){
            const edit_re = this.getAttribute("edit_re");
            const re_no = this.getAttribute("re_no");
            const cust_no = this.getAttribute("cust_no");
            const p_id = this.getAttribute("p_id");
            const group = this.getAttribute("group");
            const re_contentUp = $("#card-body textarea").val();

            if(edit_re == "y"){
               const re_content =  this.getAttribute("re_content");
               const ta = $("<textarea></textarea>").val(re_content);
               $("#card-body").empty();
               $("#card-body").append(ta);
               this.setAttribute("edit_re","n");
               
            }else{
               console.log(re_contentUp);
                  $.ajax({
                     url:'replyUpdate.do',
                     type: 'POST',
                     data: {
                           "re_no" : re_no,
                           "cust_no": cust_no,
                           "re_content": re_contentUp
                        },
                     success: function(re){
                           if(re>0){
                              console.log(p_id);
                              window.location="postDetail.do?p_id="+p_id+"&&group="+group;
                           }else{
                              alert("댓글 수정실패1");
                           }
                        },
                     error: function(){
                           alert("댓글 수정 실패2");
                        }
                  });            
               }
         });

         //댓글 삭제 btnDeleteReply
         $(".btnDeleteReply").click(function(){
            const re_no=this.getAttribute("re_no");
            const cust_no=this.getAttribute("cust_no");

            var result=confirm("삭제시 복원이 불가합니다. 정말로 삭제하시겠습니까?");
            if(result){
               $.ajax({
                  url:'replyDelete.do',
                  type:'POST',
                  data:{
                     "re_no":re_no,
                     "cust_no":cust_no
                  },
                  success:function(re){
                     if(re>0){
                        console.log(re+", 삭제 성공");
                        location.reload();
                     }else{
                        alert("작성자 본인만 삭제할 수 있습니다.")
                     }
                  },
                  error:function(){
                     alert("댓글 삭제에 실패하였습니다.");
                  }                  
               });
            }
         });
      });

      //p_content 써있는만큼 다 나오게 하기
      const textarea=$("#p_content");
      if(textarea){
         textarea.each(function(){
               $(this).height(this.scrollHeight);
            });
         }
      
   <!-- 사이드바 열려있는 게시판에 active 속성 붙여주기 -->
     if(${group}){
         document.getElementById('post'+${group}).classList.add('active');
      }

     window.onload=function(){
      //푸터 명언
      const footer_display = document.getElementById('footer-display');
      const footer_quotes = ['좋은 책은 인류에게 불멸의 정신이다. — J. 밀턴', '내가 인생을 알게 된 것은 사람과 접촉해서가 아니라 책과 접하였기 때문이다. — A. 프 랜스', '목적이 없는 독서는 산보일 뿐이다. — B. 리튼', '사람은 책을 만들고, 책은 사람을 만든다. — 신용호','기회를 기다리는 것은 바보짓이다. 독서의 시간이라는 것은 지금 이 시간이지 결코 이 제부터가 아니다. 오늘 읽을 수 있는 책을 내일로 넘기지 말라. — H. 잭슨','책은 한 권 한 권이 하나의 세계다. — W. 워즈워스', '책을 한 권 읽으면 한 권의 이익이 있고, 책을 하루 읽으면 하루의 이익이 있다. — 괴문절'];
      const footer_getQuote = Math.floor(Math.random() * footer_quotes.length);
      footer_display.textContent =footer_quotes[footer_getQuote];
   }

  </script>

</body>  

</html>