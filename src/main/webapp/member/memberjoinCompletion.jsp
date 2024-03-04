<%@ page language="java"	contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>   
<%
    String msg = (String)session.getAttribute("msg");
%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>회원가입완료</title>
    <link rel="stylesheet" type="text/css" href="../css/memberjoinCompletion.css"> 
</head>
<body>
    <div class="container">
        <div class="center-text">
            <h1>주접</h1>
        </div>
        <div class="center-text">
            <h2><%=msg%></h2>
        </div>
        <div class="center-text">
            <form action="../main/mainHompage.jsp" method="post">
                <button type="submit">Home</button>
            </form>
        </div>
        <div class="center-text">
            <form action="../member/login.jsp" method="post">
                <button type="submit">로그인</button>
            </form>
        </div>
    </div>
</body>
</html>
    