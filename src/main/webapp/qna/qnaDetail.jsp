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
            	window.location.href="/qna/qnaDelete?qna_no="+<%=rmap.get("QNA_NO")%>;
            }
            const qnaList = () => {
            	window.location.href="/qna/qnaList";
            }
            const qnaUpdate = () => {
            	document.querySelector("#f_qna").submit();
            } 
    </script>
  </head>
  <body>
    <%@include file="/include/main_homepage.jsp"%>
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
              <% } %>
            </table>
          </div>
        </div>
        <hr />
        <div class="detail-link">
          <button
            class="btn btn-info"
            data-bs-toggle="modal"
            data-bs-target="#qnaUpdateForm"
          >
            수정
          </button>
          &nbsp;
          <button class="btn btn-warning" onclick="qnaDelete()">
            삭제
          </button>
          &nbsp;
          <button class="btn btn-success" onclick="qnaList()">
            QnA목록
          </button>
        </div>
      </div>
      <!-- QNA목록 끝 -->
    </div>
    <!-- body end -->

          <!-- ========================== [[ QNA 수정 Modal ]] ========================== -->
          <div class="modal" id="qnaUpdateForm">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">QnA수정</h4>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                  ></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <form id="f_qna" method="post" action="./qnaUpdate">
                    <input type="hidden" name="qna_no" value="<%=rmap.get("QNA_NO")%>">
                    <div class="form-floating mb-3 mt-3">
                      <input type="text" class="form-control" id="qna_title"
                      name="qna_title" placeholder="Enter 제목"
                      value="<%=rmap.get("QNA_TITLE")%>"/>
                      <label for="mem_id">제목</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                      <textarea
                        rows="5"
                        class="form-control h-25"
                        aria-label="With textarea"
                        id="qna_content"
                        name="qna_content"
                      ><%=rmap.get("QNA_CONTENT")%></textarea>
                    </div>
                  </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <input
                    type="button"
                    class="btn btn-warning"
                    data-bs-dismiss="modal"
                    onclick="qnaUpdate()"
                    value="저장"
                  />
                  <input
                    type="button"
                    class="btn btn-danger"
                    data-bs-dismiss="modal"
                    value="닫기"
                  />
                </div>
              </div>
            </div>
          </div>
          <!-- ========================== [[ QNA수정 Modal ]] ========================== -->
        </body>
      </html>