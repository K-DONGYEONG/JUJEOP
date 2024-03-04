<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_id = (String)session.getAttribute("s_id");
	String menu = request.getParameter("menu");
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>    
<!DOCTYPE html>
<html lang="ko">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">   
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <%@ include file="/include/main_homepage.jsp" %>
	<%@ include file="/common/bootstrap_common.jsp" %>
    <link rel="stylesheet" href="/css/style.css" />
    <title>jujeop </title>
	<script type="text/javascript">
	  const productDetail = (product_no) => {
		location.href="/product/productDetail?product_no="+product_no;
	}
    </script>
  </head>
  <body>
 
    <nav class="navbar navbar-expand-lg navbar-light bg-white rounded" style="padding-top: 1px; padding-bottom: 1px;">
        <a class="navbar-brand" href="/index.jsp" style="margin-left: 80px;"></a>
        <div class="collapse navbar-collapse" id="navbars">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="/product/productList">
                <span class="text-truncate"><b>전체상품</b></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/product/productBest">
                <span class="text-truncate"><b>베스트</b></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/product/productNew">
                <span class="text-truncate"><b>신상품</b></span>
              </a>
            </li>
          </ul> 
          <style>
          .text-truncate{
              font-size: 14px;
            }
            .custom-search-input {
              color: rgb(156, 156, 156);
              font-size: 12px;
            }
          </style>
        </div>
      </nav>
            <style>
        div img{
          text-align: center;
        }
        </style>
        <div>
          <hr style="border: none; border-top: 1px solid #5e5d5d; margin: 0;"><br>
          <img src="/image/신상품 navbar.jpg" style="display: block; margin: 0 auto; width:1224px; height:130px;">
        </div>
        <br><br><br>
    <!-- =============================  [[ Card section ]]  ============================= -->
	<jsp:include page="/main/card.jsp" />
    <!-- =============================  [[ Card section ]]  ============================= -->

    <!-- =============================  [[ Footer section ]]  ============================= -->

	<%@ include file="/include/footer.jsp" %>

    <!-- =============================  [[ Footer section ]]  ============================= -->

  </body>
</html>
