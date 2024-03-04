<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
  int size = 0;
  List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList"); 
  Map<String, Object> rmap = new HashMap<>(); 
  if(pList !=null){ 
    size = pList.size(); 
    rmap = pList.get(0);
  } 
  %>

  <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>상품목록 상세보기</title>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" href="/css/adminProduct.css" />
    <script type="text/javascript">
                const productDelete = () => {
            	window.location.href="/admin/adminProductDelete?product_no="+<%=rmap.get("PRODUCT_NO")%>;
            }
            const productList = () => {
            	window.location.href="/admin/adminProductList";
            }
            const adminProductUpdate = () => {
            	document.querySelector("#f_product").submit();
            }
      </script>
  </head>
  <body>
    <%@include file="/include/gym_header.jsp"%>
    <div class="container">
      <div class="page-header">
        <h2>상품목록 게시판 <small>상세보기</small></h2>
        <hr />
      </div>
  
      <!-- 상품 상세정보 시작 -->
      <div class="card-body">
        <div class="book-detail">
          <div class="book-header">
            <table>
              <tr>
                <td><span class="input-group-text">태그</span></td>
                <td><%=rmap.get("PRODUCT_TAG") %></td>
              </tr>
              <tr>
                <td><span class="input-group-text">상품명</span></td>
                <td><%=rmap.get("PRODUCT_NAME") %></td>
              </tr>
              <tr>
                <td><span class="input-group-text">상품가격</span></td>
                <td><%=rmap.get("PRODUCT_PRICE") %>원</td>
              </tr>
              <tr>
                <td><span class="input-group-text">상품내용</span></td>
                <td><%=rmap.get("PRODUCT_CONTENT") %></td>
              </tr>
              <tr>
                <td><span class="input-group-text">상품이미지</span></td>
                <td><img class="product-image" src="<%=rmap.get("PRODUCT_IMAGE") %>"></td>
              </tr>
            </table>
          </div>
        </div>
        <hr />
        <div class="detail-link">
          <button
            class="btn btn-info"
            data-bs-toggle="modal"
            data-bs-target="#productUpdateForm"
          >
            수정
          </button>
          &nbsp;
          <button class="btn btn-warning" onclick="productDelete()">
            삭제
          </button>
          &nbsp;
          <button class="btn btn-success" onclick="productList()">
            상품목록
          </button>
        </div>
      </div>
      <!-- 상품 상세정보 끝 -->
    </div>
  
          <!-- ========================== [[ 상품 수정 Modal ]] ========================== -->
          <div class="modal" id="productUpdateForm">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">상품수정</h4>
                  <button
                    type="button"
                    class="btn-close"
                    data-bs-dismiss="modal"
                  ></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <form id="f_product" method="post" action="./adminProductUpdate">
                    <input type="hidden" name="product_no" value="<%=rmap.get("PRODUCT_NO")%>">
                    <div class="form-floating mb-3 mt-3">
                      <input type="text" class="form-control" id="product_tag"
                      name="product_tag" placeholder="Enter 태그"
                      value="<%=rmap.get("PRODUCT_TAG")%>"/>
                      <label for="product_tag">태그</label>
                    </div>

                    <div class="form-floating mb-3 mt-3">
                      <input type="number" class="form-control" id="category_no"
                      name="category_no" placeholder="Enter 태그"
                      value="<%=rmap.get("CATEGORY_NO")%>"/>
                      <label for="category_no">카테고리</label>
                    </div>

                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="product_name"
                        name="product_name" placeholder="Enter 상품명"
                        value="<%=rmap.get("PRODUCT_NAME")%>"/>
                        <label for="product_name">상품명</label>
                      </div>

                      <div class="form-floating mb-3 mt-3">
                        <input type="number" class="form-control" id="product_price"
                        name="product_price" placeholder="Enter 상품가격"
                        value="<%=rmap.get("PRODUCT_PRICE")%>"/>
                        <label for="product_price">상품가격</label>
                      </div>

                      <div class="form-floating mb-3 mt-3">
                        <input type="number" class="form-control" id="product_count"
                        name="product_count" placeholder="Enter 재고수량"
                        value="<%=rmap.get("PRODUCT_COUNT")%>"/>
                        <label for="product_count">재고수량</label>
                      </div>

                    <div class="form-floating mb-3 mt-3">
                      <textarea
                        rows="5"
                        class="form-control h-25"
                        aria-label="With textarea"
                        id="product_content"
                        name="product_content"
                      ><%=rmap.get("PRODUCT_CONTENT")%></textarea >
                    </div>
                  </form>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <input
                    type="button"
                    class="btn btn-warning"
                    data-bs-dismiss="modal"
                    onclick="adminProductUpdate()"
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
          <!-- ========================== [[ 상품수정 Modal ]] ========================== -->
          <!-- body end       -->
        </body>
      </html>