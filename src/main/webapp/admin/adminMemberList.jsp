<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gudi.jujeop.util.BSPageBar" %>  
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>        
<%
	int size = 0;
	List<Map<String,Object>> mList = (List<Map<String,Object>>)request.getAttribute("mList");
	if(mList !=null){
		size = mList.size();	
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
<title>회원관리 게시판</title>
<%@include file="/common/bootstrap_common.jsp"%>
<link rel="stylesheet" href="/css/notice.css">
<script type="text/javascript">
	const adminMemberList= () => {
		location.href="/admin/adminMemberList";
	}
	const memberOrderList = (user_no) => {
		location.href="/admin/memberOrderList?user_no="+user_no;
	}
	const adminMemberSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    window.location.href="/admin/adminMemberList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const adminSearchEnter = (event) => {
		if(window.event.keyCode == 13){
			adminMemberSearch();
		}
	}
</script>
</head>
<body>
	<%@include file="/include/gym_header.jsp"%>
	<!-- body start    -->
	<div class="container">
		<div class="page-header">
			<h2>회원관리 게시판 <small>회원목록</small></h2>
			<hr />
		</div>
		<!-- 검색기 시작 -->
		<div class="row">
			<div class="col-3">
		    	<select id="gubun" class="form-select" aria-label="분류선택">
		      		<option value="none">분류선택</option>
		      		<option value="user_id">회원ID</option>
		      		<option value="user_name">회원이름</option>
		      		<option value="user_gender">성별</option>
		    	</select>			
		  	</div>
			<div class="col-6">
		 		<input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요" 
		           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="adminSearchEnter()"/>
			</div>
			<div class="col-3">
		 		<button id="btn_search" class="btn btn-danger" onClick="adminMemberSearch()">검색</button>
		 	</div>
		</div>		
		<!-- 검색기 끝 -->
		
		<!-- 회원목록 시작 -->
		<div class='qna-list'>
			<table class="table table-hover">
		    	<thead>
		      		<tr>
		        		<th width="10%">#</th>
		        		<th width="10%">아이디</th>
		        		<th width="10%">이름</th>
		        		<th width="15%">연락처</th>
		        		<th width="15%">이메일</th>
		        		<th width="40%">주소</th>
		      		</tr>
		    	</thead>
		    	<tbody>
<%
	for(int i=0;i<size;i++){
		Map<String,Object> rmap = mList.get(i);
%>		    	
		      		<tr>
		        		<th><%=rmap.get("USER_NO") %></th>
		        		<th><%=rmap.get("USER_ID") %></th>
                        <th><a href="javascript:memberOrderList('<%=rmap.get("USER_NO")%>')"><%=rmap.get("USER_NAME") %></a></th>
		        		<th><%=rmap.get("USER_PHONE") %></th>
						<th><%=rmap.get("USER_EMAIL") %></th>
						<th><%=rmap.get("USER_ADDRESS") %> <%= rmap.get("USER_ADDRESS_DETAIL")%></th>
		      		</tr>
<%
	}
%>		      		
		    	</tbody>
			</table> 
			<div style="display:flex;justify-content:center;">
				<ul class="pagination">
			<%
				String pagePath = "/admin/adminMemberList";
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
		    	<button class="btn btn-warning" onclick="adminMemberList()">
		      		전체조회
		    	</button>&nbsp; 
		    </div>
		</div>		
		<!-- 회원목록   끝  -->		
	</div>
</body>
</html>