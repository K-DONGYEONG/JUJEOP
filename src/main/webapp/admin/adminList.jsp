<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
    <div id="workarea">
    <h1 align ="center" style="color:white;">JUJEOP 관리자 페이지에 오신걸 환영합니다.</h1>
        <div class="position">
            <div class="svg-wrapper">
                <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
                  <rect id="shape" height="40" width="150" />
                  <div id="text">
                    <a href="/admin/adminMemberList"><span class="spot"></span>회원조회</a>
                  </div>
                </svg>
              </div>
            <div class="svg-wrapper">
                <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
                  <rect id="shape" height="40" width="150" />
                  <div id="text">
                    <a href="/admin/adminProductList"><span class="spot"></span>상품등록조회</a>
                  </div>
                </svg>
              </div>
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href="/admin/adminNoticeList"><span class="spot"></span>공지사항조회</a>
              </div>
            </svg>
          </div>
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href="/admin/adminQnaList"><span class="spot"></span>QnA조회</a>
              </div>
            </svg>
          </div>
    </div>
</body>
</html>