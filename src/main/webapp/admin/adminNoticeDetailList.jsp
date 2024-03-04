<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
  int size = 0;
  List<Map<String,Object>> nList = (List<Map<String,Object>>)request.getAttribute("nList"); 
  Map<String, Object> rmap = new HashMap<>(); 
  if(nList !=null){ 
    size = nList.size(); 
    rmap = nList.get(0);
  } 
  %>
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8" />
          <title>공지사항 상세보기</title>
          <%@include file="/common/bootstrap_common.jsp"%>
          <script type="text/javascript">
            const noticeDelete = () => {
            	window.location.href="/admin/adminNoticeDelete?notice_no="+<%=rmap.get("NOTICE_NO")%>;
            }
            const noticeList = () => {
            	window.location.href="/admin/adminNoticeList";
            }
            const adminNoticeUpdate = () => {
            	document.querySelector("#f_notice").submit();
            }
          </script>
        </head>
        <style>
          body {
            font-family: Arial, sans-serif;
          }
          .container {
            padding: 20px;
          }
          .page-header h2 {
            margin-bottom: 20px;
          }
          .btn {
            margin-right: 10px;
          }
          .modal-dialog {
            max-width: 80%;
          }
          .modal-body {
            padding: 20px;
          }
          .modal-footer {
            padding: 20px;
            border-top: none;
          }
          .book-detail {
            border: 1px solid #ccc;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
          }
          .input-group-text {
            width: 150px;
            background-color: #f5f5f5;
          }
        </style>
        
        <body>
            <%@include file="/include/gym_header.jsp"%>
          <!-- body start    -->
          <div class="container">
            <div class="page-header">
              <h2>공지사항 게시판 <small>상세보기</small></h2>
              <hr />
            </div>

            <!-- 공지목록 시작 -->

            <div style="width: 58rem">
              <div class="card-body">
                <div class="book-detail">
                  <div class="book-header">
                    <div class="input-group mb-3">
                      <span class="input-group-text">제목</span>
                      <div style="width: 500px">
                        <input type="text" class="form-control" readonly
                        value="<%=rmap.get("NOTICE_TITLE") %>" >
                      </div>
                    </div>
                    <div class="input-group mb-3">
                      <span class="input-group-text">내용</span>
                      <div class="col-xs-8">
                        <textarea
                          class="form-control"
                          id="exampleFormControlTextarea1"
                          rows="5"
                          cols="80" readonly
                        ><%=rmap.get("NOTICE_CONTENT") %></textarea >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <hr />
              <div class="detail-link">
                <button
                  class="btn btn-info"
                  data-bs-toggle="modal"
                  data-bs-target="#noticeUpdateForm"
                >
              수정
            </button>
            &nbsp;
                <button class="btn btn-warning" onclick="noticeDelete()">
                  삭제
                </button>
                &nbsp;
                <button class="btn btn-success" onclick="noticeList()">
                  공지사항 목록
                </button>
              </div>
            </div>
            <!-- 공지목록   끝  -->
          </div>
          <!-- ========================== [[ 공지사항 수정 Modal ]] ========================== -->
          <div class="modal" id="noticeUpdateForm">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">공지사항 수정</h4>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                  ></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <form id="f_notice" method="post" action="./adminNoticeUpdate">
                    <input type="hidden" name="notice_no" value="<%=rmap.get("NOTICE_NO")%>">
                    <div class="form-floating mb-3 mt-3">
                      <input type="text" class="form-control" id="notice_title"
                      name="notice_title" placeholder="Enter 제목"
                      value="<%=rmap.get("NOTICE_TITLE")%>"/>
                      <label for="notice_title">제목</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                      <textarea
                        rows="5"
                        class="form-control h-25"
                        aria-label="With textarea"
                        id="notice_content"
                        name="notice_content"
                      ><%=rmap.get("NOTICE_CONTENT")%></textarea>
                    </div>
                  </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <input
                    type="button"
                    class="btn btn-warning"
                    data-bs-dismiss="modal"
                    onclick="adminNoticeUpdate()"
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
          <!-- ========================== [[ 수정 Modal ]] ========================== -->
          <!-- body end       -->
        </body>
      </html>