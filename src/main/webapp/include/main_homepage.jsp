<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<%
      Map<String, Object> member = null;
     if(session.getAttribute("member")!=null){
		  member = (Map<String, Object>) session.getAttribute("member");}
%> 

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">          
<div class="centered-navigation">
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">

    <a class="navbar-brand" href="/main/mainHompage.jsp">JUJEOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <% if(member == null) {
        %>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/member/login.jsp">로그인</a>
        </li>
        <% }%>
        <li class="nav-item">
          <a class="nav-link" href="/product/productList">스토어</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/notice/noticeList">공지사항</a>
        </li>    
        <li class="nav-item">
          <a class="nav-link" href="/qna/qnaList">QnA</a>
        </li>           
        <!-- 로그인시에 장바구니와 마이페이지가 뜨게함 --> 
        <% if(member != null) { %>
        <li class="nav-item">
            <a class="nav-link" href="/cart/cartList?user_no=<%= member.get("USER_NO") %>">장바구니</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/mypage/mypage.jsp">마이페이지</a>
          </li>
        <% } else { %>
            <li class="nav-item">
                <a class="nav-link" href="/member/login.jsp">장바구니</a>
            </li>
            <% } %>
      </ul>
<%
	if(member !=null){
%>      
      <form class="d-flex mb-2 mb-lg-0" role="search">
      	<div class="me-auto mt-2 mb-lg-0"><%= member.get("USER_NAME") %>님&nbsp;</div>
      	<input type="button" onclick="logout()" class="btn btn-outline-success" value="로그아웃">
      </form>
      <script type="text/javascript">
      	const logout = () => {
      		console.log('11');
      		location.href="/member/logout.jsp";
      	}
      </script>
<%
	}
%>    
<div class="row-3">
  <form action="/product/productSearch" method="GET" style="width: 300px; margin: 0;">
    <input type="text" id="keyword" class="form-control" placeholder="상품명을 입력하세요" name="product_name"
    aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="productSearchEnter()"/>
  </div>
  <div class="row-1">
    <button id="btn_search" class="btn btn-success" onClick="productSearch()">검색</button>
  </form>
  </div>
</div>
</div>


</nav>
</div>

    <script type="text/javascript">
      const productDetail = (product_no) => {
        location.href="/product/productDetail?product_no="+product_no;
      }

      const productList = () => {
        location.href="/product/productList";
      }

      const productSearch = () => {
      const gubun = document.querySelector('#gubun').value;
      const keyword = document.querySelector('#keyword').value;
      window.location.href="/product/productSearch?gubun="+gubun+"&keyword="+keyword;
      }

      const productSearchEnter = (event) => {
		  if(window.event.keyCode == 13){
			productSearch();
		}
  }

    </script>
    
  <style>
    .centered-navigation {
      display: flex;
      justify-content: center;
      align-items: center;
      background-color: #f8f9fa; 
      padding: 5px 0; 
    }
    </style>