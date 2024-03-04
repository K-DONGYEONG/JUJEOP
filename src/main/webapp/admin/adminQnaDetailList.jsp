<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
  int size = 0;
  List<Map<String,Object>> qList = (List<Map<String,Object>>)request.getAttribute("qList"); 
  Map<String, Object> rmap = new HashMap<>(); 
  if(qList !=null){ 
    size = qList.size(); 
    rmap = qList.get(0);
  } 
  %>
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8" />
    <title>QnA상세보기</title>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" href="/css/adminQnA.css" />
    <script type="text/javascript">
           const qnaDelete = () => {
            	window.location.href="/admin/adminQnaDelete?c_no="+<%=rmap.get("C_NO")%>;
            }
            const qnaList = () => {
            	window.location.href="/admin/adminQnaList";
            }
            
            const qnaCommentInsert = () => { 
              document.querySelector("#f_comment").submit();
            }

    </script>
  </head>
  <body>
    <%@include file="/include/gym_header.jsp"%>
    <div class="container">
      <div class="page-header">
        <h2>QnA게시판 <small>상세보기</small></h2>
        <hr />
      </div>
      <!-- QnA 상세목록 시작 -->
      <div class="card-body">
        <div class="book-detail">
          <div class="book-header">
            <table>
              <tr>
                <td><span class="input-group-text">제목</span></td>
                <td><%=rmap.get("QNA_TITLE") %></td>
              </tr>
              <tr>
                <td><span class="input-group-text">작성자</span></td>
                <td><%=rmap.get("QNA_WRITER") %></td>
              </tr>
              <tr>
                <td><span class="input-group-text">내용</span></td>
                <td>
                  <textarea
                    class="form-control"
                    rows="5"
                    readonly><%=rmap.get("QNA_CONTENT") %></textarea >
                </td>
              </tr>
              <%
                if (rmap.get("C_CONTENT") != null) {
              %>
                <tr>
                  <td><span class="input-group-text">답변</span></td>
                  <td>
                    <textarea
                      class="form-control"
                      rows="5"
                      readonly><%=rmap.get("C_CONTENT") %></textarea >
                  </td>
                </tr>
              <% } else { %>
                <tr>
                  <td><span class="input-group-text">답변</span></td>
                  <td>
                    <form class="form-inline" id="f_comment" method="post" action="./adminQnaCommentInsert">
                      <input type="hidden" name="qna_no" id="qna_no" value="<%=rmap.get("QNA_NO")%>">
                      <textarea
                        class="form-control"
                        rows="5"
                        name="c_content"
                        id="c_content"
                        cols="80"
                        placeholder="답변을 입력해주세요..."></textarea>
                      <button class="btn btn-success" onclick="qnaCommentInsert()">답변등록</button>
                    </form>
                  </td>
                </tr>
              <% } %>
            </table>
          </div>
        </div>
        <hr />
        <div class="detail-link">
          <%
            if (rmap.get("C_CONTENT") != null) {
          %>
            <button class="btn btn-warning" onclick="qnaDelete()">답글 삭제</button>
          <% } %>
          &nbsp;
          <button class="btn btn-success" onclick="qnaList()">QnA목록</button>
        </div>
      </div>
      <!-- 회원목록 끝 -->
    </div>
    <!-- body end -->
  </body>
  </html>