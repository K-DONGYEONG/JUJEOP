<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.gudi.jujeop.util.BSPageBar" %>

<%
	int size = 0;
	List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList");
	if(pList !=null){
		size = pList.size();	
	}
	int numPerPage = 10;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록 게시판</title>
<%@include file="/common/bootstrap_common.jsp"%>
<link rel="stylesheet" href="/css/product.css">
<script type="text/javascript">
	const adminProductList= () => {
		location.href="/admin/adminProductList";
	}
	const adminProductDetailList = (product_no) => {
		location.href="/admin/adminProductDetailList?product_no="+product_no;
	}
	const adminProductSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    console.log(gubun+", "+keyword);
	    window.location.href="/admin/adminProductList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const adminSearchEnter = (event) => {
		if(window.event.keyCode == 13){
			adminProductSearch();
		}
	}
    const productInsert = () => {
		document.querySelector("#f_product").submit();
	}
</script>
</head>
<body>
	<%@include file="/include/gym_header.jsp"%>
	<!-- body start    -->
	<div class="container">
		<div class="page-header">
			<h2>상품목록 게시판 <small>상품목록</small></h2>
			<hr />
		</div>
		<!-- 검색기 시작 -->
		<div class="row">
			<div class="col-3">
		    	<select id="gubun" class="form-select" aria-label="분류선택">
		      		<option value="none">분류선택</option>
		      		<option value="product_name">상품명</option>
		      		<option value="product_tag">태그</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="adminSearchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="adminProductSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 회원목록 시작 -->
		<div class='qna-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">상품번호</th>
		        		<th width="30%">태그</th>
		        		<th width="40%">상품명</th>
		        		<th width="20%">상품가격</th>
		      		</tr>
		    	</thead>
		    	<tbody>
<%
for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
	if(size == i) break;
		Map<String,Object> rmap = pList.get(i);
%>		    	
		      		<tr>
		        		<th><%=rmap.get("PRODUCT_NO") %></th>
		        		<th><%=rmap.get("PRODUCT_TAG") %></th>
                        <th><a href="javascript:adminProductDetailList('<%=rmap.get("PRODUCT_NO")%>')"><%=rmap.get("PRODUCT_NAME") %></a></th>
		        		<th><%=rmap.get("PRODUCT_PRICE") %>원</th>
		      		</tr>
<%
	}
%>		      		
		    	</tbody>
			</table> 
			<div style="display:flex;justify-content:center;">
				<ul class="pagination">
			<!-- 검색조건을 유지하면서 페이징네이션 되는 코드 -->
			<%
			String pagePath = "/admin/adminProductList";
			BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
			String gubun = request.getParameter("gubun");
			String keyword = request.getParameter("keyword");
			String pageBar = bspb.getPageBar();
			if (gubun != null && keyword != null) {
				pageBar = pageBar.replace(pagePath + "?nowPage=", pagePath + "?gubun=" + gubun + "&keyword=" + keyword + "&nowPage=");
				pageBar = pageBar.replace(pagePath + "&nowPage=", pagePath + "&gubun=" + gubun + "&keyword=" + keyword + "&nowPage=");
			}
			out.print(pageBar);
			%>
				</ul>
				</div>
		  	<div class='qna-footer'>
		    	<button class="btn btn-warning" onclick="adminProductList()">
		      		전체조회
		    	</button>&nbsp; 
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#productForm">
                    상품등록
                    </button>
		    </div>
		</div>		
		<!-- 상품목록  끝  -->		
	</div>
    <!-- ========================== [[ QnA게시판 Modal ]] ========================== -->
	<div class="modal" id="productForm">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">상품목록</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form class="form-inline" id="f_product" method="post" action="./adminFileInsert" enctype="multipart/form-data">
                <div class="input-group mb-2 w-100">
                      <label class="input-group-text" for="product_tag">태그</label>
                      <input type="text" class="form-control" id="product_tag" name="product_tag" placeholder="Enter 태그" />
                </div>
				<div class="input-group mb-2 w-100">
					<label class="input-group-text" for="category_no">카테고리</label>
					<input type="number" class="form-control" id="category_no" name="category_no" placeholder="Enter 카테고리" />
			  </div>	   	      	
                <div class="input-group mb-2 w-100">
                  <label class="input-group-text"  for="product_name">상품명</label>
                  <input type="text"  class="form-control" id="product_name" name="product_name" placeholder="Enter 상품명"/>
                </div>	      	
                <div class="input-group mb-2 w-100">
                  <label class="input-group-text"  for="product_content">상품내용</label>
                  <textarea rows="5" class="form-control h-25" aria-label="With textarea" id="product_content" name="product_content"></textarea>
                </div>
                <div class="input-group mb-2 w-100">
                    <label class="input-group-text"  for="product_price">상품가격</label>
                    <input type="number"  class="form-control" id="product_price" name="product_price" placeholder="Enter 상품가격"/>
                  </div>
				  <div class="input-group mb-2 w-100">
                    <label class="input-group-text"  for="product_option">상품옵션</label>
                    <input type="text"  class="form-control" id="product_option" name="product_option" placeholder="Enter 상품옵션"/>
                  </div>
				  <div class="input-group mb-2 w-100">
                    <label class="input-group-text"  for="product_count">재고수량</label>
                    <input type="number"  class="form-control" id="product_count" name="product_count" placeholder="Enter 재고수량"/>
                  </div>
				  <div class="input-group mb-3 w-100">
					<input type="file" class="form-control" id="product_image" name="file">
					<label class="input-group-text" for="product_image">Upload</label>
				  </div>	   	      	
            </div>	
            <div class="modal-footer">
              <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="productInsert()"  value="저장">
              <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
            </div>
			</div>
			</div>
			</div>
		</form>
          </div>
        </div>
      </div>
      <!-- ========================== [[ 게시판 Modal ]] ========================== -->				
</body>
</html>