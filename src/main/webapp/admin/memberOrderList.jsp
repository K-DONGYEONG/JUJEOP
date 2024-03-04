<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
  int size = 0;
  List<Map<String,Object>> oList = (List<Map<String,Object>>)request.getAttribute("oList"); 
  Map<String,Object> rmap = new HashMap<>();
  if(oList !=null){ 
    size = oList.size();
  }
  %>

  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="UTF-8" />
    <title>회원별 주문내역보기</title>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" href="/css/memberOrder.css" />
    <script type="text/javascript">

            const memberList = () => {
            	window.location.href="/admin/adminMemberList";
            }
            const orderDelete = (order_no) => { 
              window.location.href="/admin/memberOrderDelete?order_no="+order_no;
            }
    </script>
  </head>
  <body>
    <%@include file="/include/gym_header.jsp"%>
    <div class="container">
      <div class="page-header">
        <h2>회원관리 게시판 <small>주문상세보기</small></h2>
        <hr />
      </div>
      <!-- 공지목록 시작 -->
      <table>
        <thead>
          <tr>
            <th>주문번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>상품가격</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <% for (int i = 0; i < size; ++i) { 
            rmap = oList.get(i);
          %>
          <tr>
            <td><%=rmap.get("ORDER_NO") %></td>
            <td><img class="book-image" src="<%=rmap.get("PRODUCT_IMAGE") %>" alt="Product Image"></td>
            <td><%=rmap.get("PRODUCT_NAME") %></td>
            <td><%=rmap.get("PRODUCT_PRICE") %>원</td>
            <td><button class="btn btn-warning" onclick="orderDelete(<%=rmap.get("ORDER_NO")%>)">주문취소</button></td>
          </tr>
          <% 
        } 
        %>
        </tbody>
      </table>
      <button class="btn btn-success" onclick="memberList()">회원관리 목록</button>
    </div>
  </body>
  </html>