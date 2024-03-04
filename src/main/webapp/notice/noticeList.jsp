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
	const noticeList= () => {
		location.href="/notice/noticeList";
	}
	const noticeDetail = (notice_no) => {
		location.href="/notice/noticeDetailList?notice_no="+notice_no;
	}
	const noticeSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    window.location.href="/admin/adminNoticeList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const searchEnter = (event) => {
		if(window.event.keyCode == 13){
			noticeSearch();
		}
	}
</script>
</head>
<body>
    <%@include file="/include/main_homepage.jsp"%>
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
		      		<option value="notice_content">내용</option>
		      		<option value="notice_date">작성날짜</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="noticeSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 회원목록 시작 -->
		<div class='qna-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">#</th>
		        		<th width="40%">제목</th>
		        		<th width="30%">조회수</th>
		        		<th width="20%">작성일</th>
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
                        <th><a href="javascript:noticeDetail('<%=rmap.get("NOTICE_NO")%>')"><%=rmap.get("NOTICE_TITLE") %></a></th>
		        		<th><%=rmap.get("NOTICE_HITCOUNT") %></th>
		        		<th><%=rmap.get("NOTICE_DATE") %></th>
		      		</tr>
<%
	}
%>		      		
		    	</tbody>
			</table> 
			<div style="display:flex;justify-content:center;">
				<ul class="pagination">
			<%
				String pagePath = "/notice/noticeList";
				BSPageBar bspb = new BSPageBar(numPerPage, size, nowPage, pagePath);
				out.print(bspb.getPageBar());
			%>
				</ul>
				</div>
		  	<div class='qna-footer'>
		    	<button class="btn btn-warning" onclick="adminNoticeList()">
		      		전체조회
		    	</button>
		    </div>
		</div>		
	</div>
</body>
</html>