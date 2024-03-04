<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
    <% 
    Map<String,Object> member2 = (Map)session.getAttribute("member");
    if(member2 == null){
      member2 = new HashMap<String,Object>();
    }
      int size = 0;
      List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList"); 
      Map<String, Object> rmap = new HashMap<>(); 
      if(pList !=null){ 
        size = pList.size(); 
        rmap = pList.get(0);
      } 
      %> 

<!DOCTYPE html>
<html lang="ko">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">   
  <head>
    <meta charset="UTF-8" />
    <%@ include file="/include/main_homepage.jsp" %>
	<%@ include file="/common/bootstrap_common.jsp" %>
    <link rel="stylesheet" href="/css/style.css" />
    <title>jujeop</title>
	<script type="text/javascript">
    const productDetail = (product_no) => {
		location.href="/product/productDetail?product_no="+ product_no;
	}
    </script>
  </head>
  <body>

    <nav class="navbar navbar-expand-lg navbar-light bg-white rounded" style="padding-top: 1px; padding-bottom: 1px;">
        <a class="navbar-brand" href="/index.jsp" style="margin-left: 80px;"></a>
        <div class="collapse navbar-collapse" id="navbars">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link" href="/product/productTak">
                <span class="text-truncate"><b>탁주</b></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/product/productYak">
                <span class="text-truncate"><b>약·청주</b></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/product/productGwa">
                <span class="text-truncate"><b>과실주</b></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/product/productJeung">
                <span class="text-truncate"><b>증류주</b></span>
              </a>
            </li>
          </ul> 
          <style>
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
          <img src="/image/과실주 navbar.jpg" style="display: block; margin: 0 auto; width:1224px; height:130px;">
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
