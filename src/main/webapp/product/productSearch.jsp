<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
  int size = 0;
  List<Map<String, Object>> pList = (List<Map<String, Object>>)request.getAttribute("pList"); 
  Map<String, Object> rmap = new HashMap<>(); 
  if(pList !=null){ 
    size = pList.size(); 
    rmap = pList.get(0);
  } 
  %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <%@ include file="/common/bootstrap_common.jsp" %>
    <title>productSearch</title>
    <link rel="stylesheet" href="/css/style.css" />
    <script type="text/javascript">
      const productDetail = (product_no) => {
        location.href="/product/productDetail?product_no="+product_no;
      }

      const productList = () => {
        location.href="/product/productList";
      }

      const productSearch = () => {
      const gubun = document.querySelector('#gubun').value;
      const keyword = document.querySelector('#keyword').value;
      window.location.href="/product/productSearch?gubun="+gubun+"&keyword="+keyword;
      }

      const productSearchEnter = (event) => {
		  if(window.event.keyCode == 13){
			productSearch();
		  }
  }
    </script>
    </head>
    <body>
      <jsp:include page="/include/main_homepage.jsp" />
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

    <!-- =============================  [[ Card section ]]  ============================= -->
	<jsp:include page="/main/card.jsp" />
    <!-- =============================  [[ Card section ]]  ============================= -->
	<%@ include file="/include/footer.jsp" %>
    </body>
    </html>