<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<nav class="navbar navbar-expand-lg navbar-light bg-white rounded" style="padding-top: 1px; padding-bottom: 1px;">
  <a class="navbar-brand" href="./mainHompage.jsp" style="margin-left: 80px;">JUJEOP</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbars">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">
          <span class="text-truncate small"><b>구독</b></span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/product/productList">
          <span class="text-truncate small" ><b>스토어</b></span>
        </a>
      </li>
    </ul>

    <style>
      .custom-search-input {
        color: rgb(156, 156, 156);
        font-size: 12px;
      }
    </style>
    
    <form class="form-inline my-2 my-md-0" style="margin-top: 5px;">
      <input class="form-control bg-light custom-search-input" type="text" placeholder="무엇을 찾고 계신가요?" aria-label="Search">
    </form>


  </div>
<!--   <div class="row">
    <div class="col-md-12">
      <button type="button" class="btn btn-custom" data-bs-toggle="modal" data-bs-target="#memberForm"
        onclick="location.href='../member/loginForm.jsp'" style="font-size: 12px; margin-left: 50px;">로그인/회원가입</button>
      <img src="../image/장바구니 버튼.jpg" width="30" height="30" alt="장바구니버튼">
    </div>
  </div> -->
</nav>
