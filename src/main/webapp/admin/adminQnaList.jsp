<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gudi.jujeop.util.BSPageBar" %>        
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>        
<%
	int size = 0;
	List<Map<String,Object>> qList = (List<Map<String,Object>>)request.getAttribute("qList");
	if(qList !=null){
		size = qList.size();	
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
<title>QnA게시판[webapp]</title>
<%@include file="/common/bootstrap_common.jsp"%>
<link rel="stylesheet" href="/css/qna.css">
<script type="text/javascript">
	const adminQnaList= () => {
		location.href="/admin/adminQnaList";
	}
	const adminQnaDetail = (qna_no) => {
		location.href="/admin/adminQnaDetailList?qna_no="+qna_no;
	}
	const adminQnaSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    window.location.href="/admin/adminQnaList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const adminSearchEnter = (event) => {
		if(window.event.keyCode == 13){
			adminQnaSearch();
		}
	}
</script>
</head>
<body>
	<%@include file="/include/gym_header.jsp"%>
	<!-- body start    -->
	<div class="container">
		<div class="page-header">
			<h2>QnA게시판 <small>글목록</small></h2>
			<hr />
		</div>
		<!-- 검색기 시작 -->
		<div class="row">
			<div class="col-3">
		    	<select id="gubun" class="form-select" aria-label="분류선택">
		      		<option value="none">분류선택</option>
		      		<option value="qna_title">제목</option>
		      		<option value="qna_writer">작성자</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="adminSearchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="adminQnaSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 회원목록 시작 -->
		<div class='qna-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">#</th>
		        		<th width="20%">제목</th>
		        		<th width="15%">작성자</th>
		        		<th width="15%">조회수</th>
		        		<th width="20%">작성일</th>
						<th width="20%">답글상태</th>
		      		</tr>
		    	</thead>
		    	<tbody>
<%
for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
	if(size == i) break;
		Map<String,Object> rmap = qList.get(i);
%>		    	

		      		<tr>
		        		<th><%=rmap.get("QNA_NO") %></th>
							<th><a href="javascript:adminQnaDetail('<%=rmap.get("QNA_NO")%>')"><%=rmap.get("QNA_TITLE") %></a></th>
							<th><%=rmap.get("QNA_WRITER") %></th>
							<th><%=rmap.get("QNA_HITCOUNT") %></th>
						<th><%=rmap.get("QNA_DATE") %></th>
						<% if(rmap.get("C_CONTENT") != null) {%>
							<th><button class="answer-complete-button">답변완료</button></th>
						<%
						}
						%>
		      		</tr>
<%
	}
%>		      		
		    </tbody>
			</table>
	<div style="display:flex;justify-content:center;">
		<ul class="pagination">
	<%
		String pagePath = "/admin/adminQnaList";
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
		    	<button class="btn btn-warning" onclick="adminQnaList()">
		      		전체조회
		    	</button>
		    </div>
		</div>		
		<!-- 회원목록   끝  -->		
	</div>
</body>
</html>