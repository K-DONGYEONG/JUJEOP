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
            const noticeList = () => {
            	window.location.href="/notice/noticeList";
            }
          </script>
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
        </head>
        <body>
            <%@include file="/include/main_homepage.jsp"%>
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
                <button class="btn btn-success" onclick="noticeList()">
                  공지사항 목록
                </button>
              </div>
            </div>
          </div>
        </body>
      </html>