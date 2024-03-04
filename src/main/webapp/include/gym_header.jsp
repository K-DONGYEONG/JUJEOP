<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
<style>
    .navbar {
        font-weight: 600; /* 글자의 두께를 조정 */
        font-size: 1.1rem; /* 글자 크기를 약간 키웁니다 */
    }

    .navbar-brand {
        letter-spacing: 2px; /* 글자 간격을 조정 */
    }

    .nav-link {
        letter-spacing: 1px; /* 글자 간격을 조정 */
    }

    .btn-outline-success {
        border-color: #fff; /* 버튼 테두리를 흰색으로 조정 */
        color: #fff; /* 텍스트 색상을 흰색으로 조정 */
    }

    .btn-outline-success:hover {
        background-color: #fff; /* 호버 시 흰색 배경 */
        color: #000; /* 호버 시 검은색 텍스트 */
    }
</style>

<%
      Map<String, Object> member = null;
     if(session.getAttribute("member")!=null){
      member = (Map<String, Object>) session.getAttribute("member");}
%> 

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/admin/adminList.jsp">JUJEOP</a>
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
          <a class="nav-link" href="/admin/adminMemberList">회원관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminNoticeList">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminQnaList">QnA게시판</a>
        </li>    
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminProductList">물품관리</a>
        </li>            
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
    </div>
  </div>
</nav>