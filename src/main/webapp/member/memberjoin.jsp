<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>회원가입</title>
    <%@include file="/include/main_homepage.jsp"%>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" type="text/css" href="../css/memberjoin.css"> 
</head>
<body>
    <div class="container">
        <div class="center-text">
            <br><br><h1>JUJEOP</h1><br><br>
        </div>
        <div class="center-text">
            <h2>회원가입</h2><br>
        </div>
        <div class="center-text">
            <p>아이디와 비밀번호 입력하기 귀찮으시죠?<br>1초 회원가입으로 입력없이 간편하게 회원가입하세요.</p>
        </div>
        <a href="../auth/kakaologin.jsp">
            <img src="../image/kakao_login.png" alt="카카오 회원가입" class="kakao-btn">
        </a>
        <div class="center-text">
            <!-- 구분선 -->
            <hr>
        </div>
        <div class="center-text">
            <form action="../member/memberjoinDetail.jsp" method="post">
                <button type="submit">이메일로 회원가입</button>
            </form>
        </div>
    </div>
</body>
</html>
    