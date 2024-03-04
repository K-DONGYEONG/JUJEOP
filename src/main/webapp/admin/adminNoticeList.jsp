<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gudi.jujeop.util.BSPageBar" %>        
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>        
<%
	int size = 0;
	List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList");
	if(nList !=null){
		size = nList.size();	
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
<title>공지사항 게시판</title>
<%@include file="/common/bootstrap_common.jsp"%>
<link rel="stylesheet" href="/css/qna.css">
<script type="text/javascript">
	const adminNoticeList= () => {
		location.href="/admin/adminNoticeList";
	}
	const adminNoticeDetail = (notice_no) => {
		location.href="/admin/adminNoticeDetailList?notice_no="+notice_no;
	}
	const adminNoticeSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    window.location.href="/admin/adminNoticeList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const adminSearchEnter = (event) => {
		if(window.event.keyCode == 13){
			adminQnaSearch();
		}
	}
	const noticeInsert = () => {
		document.querySelector("#f_notice").submit();
	}
</script>

</head>
<body>
	<%@include file="/include/gym_header.jsp"%>
	<!-- body start    -->
	<div class="container">
		<div class="page-header">
			<h2>공지사항 게시판 <small>글목록</small></h2>
			<hr />
		</div>
		<!-- 검색기 시작 -->
		<div class="row">
			<div class="col-3">
		    	<select id="gubun" class="form-select" aria-label="분류선택">
		      		<option value="none">분류선택</option>
		      		<option value="notice_title">제목</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="adminSearchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="adminNoticeSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 공지목록 시작 -->
		<div class='qna-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">#</th>
		        		<th width="40%">제목</th>
		        		<th width="20%">작성일</th>
		        		<th width="30%">조회수</th>
		      		</tr>
		    	</thead>
		    	<tbody>
<%
for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
	if(size == i) break;
		Map<String,Object> rmap = nList.get(i);
%>		    	
		      		<tr>
		        		<th><%=rmap.get("NOTICE_NO") %></th>
                        <th><a href="javascript:adminNoticeDetail('<%=rmap.get("NOTICE_NO")%>')"><%=rmap.get("NOTICE_TITLE") %></a></th>
		        		<th><%=rmap.get("NOTICE_DATE") %></th>
						<th><%=rmap.get("NOTICE_HITCOUNT") %></th>
		      		</tr>
<%
	}
%>		      		
		    	</tbody>
			</table> 
			<div style="display:flex;justify-content:center;">
				<ul class="pagination">
			<%
				String pagePath = "/admin/adminNoticeList";
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
		    	<button class="btn btn-warning" onclick="adminNoticeList()">
		      		전체조회
		    	</button>&nbsp; 
				<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#noticeForm">
					공지등록
					</button>
		    </div>
		</div>		
		<!-- 공지목록끝  -->		
	</div>
	<!-- ========================== [[ 공지사항게시판 Modal ]] ========================== -->
	<div class="modal" id="noticeForm">
		<div class="modal-dialog modal-dialog-centered">
		  <div class="modal-content">
	  
			<!-- Modal Header -->
			<div class="modal-header">
			  <h4 class="modal-title">공지사항 게시판</h4>
			  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<form class="form-inline" id="f_notice" method="post" action="./adminNoticeInsert">
				<div class="input-group mb-2">
					  <label class="input-group-text" for="notice_title">제목</label>
					  <input type="text" class="form-control" id="notice_title" name="notice_title" placeholder="Enter 제목" />
				</div>	      	
				<div class="input-group mb-2">
				  <label class="input-group-text"  for="notice_content">내용</label>
				  <textarea rows="5" class="form-control h-25" aria-label="With textarea" id="notice_content" name="notice_content"></textarea>
				</div>	      	
				</form>
			</div>	
			<div class="modal-footer">
			  <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="noticeInsert()"  value="등록">
			  <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
			</div>
		  </div>
		</div>
	  </div>
	  <!-- ========================== [[ 게시판 Modal ]] ========================== -->			
</body>
</html>