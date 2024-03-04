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
	<%@ include file="/common/bootstrap_common.jsp" %>
	<%@include file="/include/main_homepage.jsp"%>
    <link rel="stylesheet" href="/css/style.css" />
    <title>jujeop </title>
	<script type="text/javascript">
	const productDetail = (product_no) => {
		location.href="/product/productDetail?product_no="+product_no;
	}
  function scrollTopFixed() {
      window.scrollTo(0, 0);
    }
  </script>
  <style>
 .scroll-top-button {
    position: fixed;
    bottom: 20px;
    right: 30px;
    z-index: 9999; /* Ensure the button is above other elements */
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 50%;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
    transition: background-color 0.3s, transform 0.3s;
  }

  .scroll-top-button:hover {
    background-color: #2980b9;
    transform: scale(1.1);
  }
  </style>
  </head>
  <body>

    <!-- ============================= [[ Carousel section]] ============================= -->
	<jsp:include page="/main/carousel.jsp"/>
    <!-- ============================= [[ Carousel section]] ============================= -->
  <jsp:include page="/product/icon.jsp"/>
    <!-- =============================  [[ Card section ]]  ============================= -->
	<jsp:include page="/main/card.jsp"/>
    <!-- =============================  [[ Card section ]]  ============================= -->
    <button class="scroll-top-button" onclick="scrollTopFixed()">↑</button>
<%@ include file="/include/footer.jsp" %>
  </body>
</html>
