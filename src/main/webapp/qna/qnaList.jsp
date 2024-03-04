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
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script type="text/javascript">
const qnaList = () => {
		//alert('qnaList');
		location.href="/qna/qnaList";
	}
	const qnaDetail = (qna_no) => {
		console.log('qnaDetail 사용자가 선택한 글번호 : '+qna_no);
		location.href="/qna/qnaDetail?qna_no="+qna_no;
	}
	const qnaSearch = () => {
	    const gubun = document.querySelector('#gubun').value;
	    const keyword = document.querySelector('#keyword').value;
	    console.log(gubun+", "+keyword);
	    window.location.href="/qna/qnaList?gubun="+gubun+"&keyword="+keyword;   			
	}
	const searchEnter = (event) => {
		console.log(window.event.keyCode);
		if(window.event.keyCode == 13){
			qnaSearch();
		}
	}
	const qnaInsert = () => {
		document.querySelector("#f_qna").submit();
	}
</script>
</head>
<body>
	<script>
		$(document).ready(function(){
			console.log('ready...');
		})
	</script>
    <%@include file="/include/main_homepage.jsp"%>
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
							<th><a href="javascript:qnaDetail('<%=rmap.get("QNA_NO")%>')"><%=rmap.get("QNA_TITLE") %></a></th>
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
		String pagePath = "/qna/qnaList";
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
		 <!-- [[ Bootstrap 페이징 처리  구간  ]] -->		  
		 <div class='qna-footer'>
			<button class="btn btn-warning" onclick="qnaList()">
				  전체조회
			</button>&nbsp; 
			<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#qnaForm">
			글쓰기
			</button>
		</div>
	</div>		
	<!-- 회원목록   끝  -->		
</div>
<!-- body end       -->
<!-- ========================== [[ QnA게시판 Modal ]] ========================== -->
<div class="modal" id="qnaForm">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
	  <!-- Modal Header --> 
	  <div class="modal-header">
		<h4 class="modal-title">QnA게시판</h4>
		<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	  </div>
	  <!-- Modal body -->
	  <div class="modal-body">
		  <form class="form-inline" id="f_qna" method="post" action="./qnaInsert2">
			<input type="hidden" id="qna_writer" name="qna_writer" value="<%= member.get("USER_NAME")%>">
			<input type="hidden" id="user_no" name="user_no" value="<%= member.get("USER_NO")%>">
		  <div class="input-group mb-2">
				<label class="input-group-text" for="qna_title">제목</label>
				<input type="text" class="form-control" id="qna_title" name="qna_title" placeholder="Enter 제목" />
		  </div>	      	
		  <div class="input-group mb-2">
			<label class="input-group-text"  for="qna_content">내용</label>
			<textarea rows="5" class="form-control h-25" aria-label="With textarea" id="qna_content" name="qna_content"></textarea>
		  </div>	      	
		  <div class="form-floating" id="editor" style="height: 300px; width: 100%;">
		</div>
		  </form>
	  </div>	
	  <div class="modal-footer">
		<input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="qnaInsert()"  value="저장">
		<input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
	  </div>
	</div>
	</div>
	</div>
	<script>
		// 사용하고 싶은 옵션, 나열 되었으면 하는 순서대로 나열
		const toolbarOptions = [
			["link", "image"],
			[{ header: [1, 2, 3,4,5,6, false] }],
			["bold", "italic", "underline", "strike"],
			["blockquote"],
			[{ list: "ordered" }, { list: "bullet" }],
			[{ color: [] }, { background: [] }],
			[{ align: [] }],
		]; 
		const formats = [
			"header","font","size","bold","italic","underline",
			"strike","align","blockquote","list","bullet","indent",
			"background","color","link","image","width",
			];
		//DOM선언이 된 후에야 id값을 접근 가능하니까 - undefined
		//var는 호이스팅이슈로 사용하지 않음
		const quill = new Quill('#editor', {
			modules: {
				toolbar: toolbarOptions
			},
			theme: 'snow'
		});
		// 내용 변경 이벤트 처리
		quill.on('text-change', function(delta, oldDelta, source) {
		if (source === 'user') {
			// 사용자에 의한 내용 변경일 경우에만 처리
			console.log('내용이 변경되었습니다.');
			console.log('새로운 내용:', quill.root.innerHTML);
		}
		});
	</script>
</body>
</html>