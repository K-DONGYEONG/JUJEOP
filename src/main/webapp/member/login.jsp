<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">   
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/common/bootstrap_common.jsp"%>
<%@ include file="/include/main_homepage.jsp" %>
<link rel="stylesheet" href="/css/login.css">
</head>
<body>
  <br>
  <br>
    <div class="container">
        <form action="/member/login"> 
            <div class="center-text">
                <h2>로그인</h2>
            </div>
            <div class="basic-info">
              <div class="input-group user-box">
                  <label for="username">아이디</label>
                    <input type="text" id="username" name="user_id" required>
                </div>
                <div class="input-group user-box">
                <label for="password">비밀번호</label>
                    <input type="password" id="password" name="user_password" required>
                </div>
            </div>
            <div class="center-text">
                <input type="submit" value="로그인">
                <p>
                  <br>
                    계정이 없으신가요?
                    <a href="./memberjoin.jsp">회원가입</a>
                </p>
            </div>
        </form>
    </div>
</body>
</html>