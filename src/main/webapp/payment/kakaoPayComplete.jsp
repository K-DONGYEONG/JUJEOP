<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %> 

<!DOCTYPE html>
<html>
<head>
<title>카카오페이 결제</title>
<link rel="stylesheet" href="/css/notice.css">
<script type="text/javascript"></script>
<style>
    @font-face {
        font-family: 'GmarketSansMedium';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    body {
        background-color: #E9E9E9;
        overflow-x: hidden;
        font-family: 'GmarketSansMedium';
        font-size: 15px;
    }
    
    #box {
        position: absolute;
        width: 600px;
        height: 530px;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        background-color: #000;
        opacity: 0.7;
        border-radius: 20px;
        box-shadow: 8px 8px 8px #585858;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
    }

    #content {
        margin: auto;
        text-align: center;
        left : 20px;
    }

    h2 {
         color : white;
         align-content: center;
         margin-bottom: 50px;
    }
    a {
        color: white;
        border: 1px solid white;
        text-decoration: none;
        padding : 4px 10px;
    }
    
</style>
</head>
<body>
    <%@include file="/include/main_homepage.jsp"%>
    <%@include file="/common/bootstrap_common.jsp"%>
    <div id="box">
        <div id="content">
            <h2>결제 완료되었습니다.</h2>
            <a class="btn" href="/main/mainHompage.jsp" style="color: rgb(236, 236, 194);">메인으로 가기</a>
        </div>
    </div>
</body>
</html>