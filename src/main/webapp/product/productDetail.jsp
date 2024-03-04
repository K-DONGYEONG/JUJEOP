<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.util.List, java.util.Map,java.util.ArrayList, java.util.HashMap" %> 
<% 
Map<String,Object> member2 = (Map)session.getAttribute("member");
if(member2 == null){
	member2 = new HashMap<String,Object>();
}
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
    <link rel="stylesheet" href="/css/productdetail.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script type="text/javascript">
            const productDelete = () => {
            	window.location.href="/product/productDelete?product_no="+<%=rmap.get("PRODUCT_NO")%>;
            }
            const productList = () => {
            	window.location.href="/product/productList";
            }
      </script>
  </head>
  <body>
    <%@include file="/include/main_homepage.jsp"%>
    <div class="container ">
      <div class="page-header">
      </div>
  
      <!-- 상품 상세정보 시작 -->
     <div class="row"> 
      <div class="col-md-9">
        <div class="book-detail">
          <div class="book-header">
            <div class="col-md-3">
              <input type="hidden" id="price" value="<%=rmap.get("PRODUCT_PRICE") %>">
              <input type="hidden" id="product_name" value="<%=rmap.get("PRODUCT_NAME") %>">
              <input type="hidden" id="product_image" value="<%=rmap.get("PRODUCT_IMAGE")%>">
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
          <button class="btn button-gradient" onclick="productList()">상품목록</button>
        </div>
      </div>
      <!-- 상품 상세정보 끝 -->
    </div>
    <div class="col-md-3">
      <div class="product-option">
        <br>
        <br>
        <br>
        <label for="option-select">옵션</label>
        <div class="form-group">
          <select type="text" class="form-control" id="product_color" name="product_color">
            <%
            if (pList.size() == 0) {
              %>
              <option value="null">null</option>
              <%
            } else {
              %>
              <%
              for (int i = 0; i < pList.size(); i++) {
                %>
                <option value="('옵션을 선택하세요')">옵션을 선택하세요</option>
                <option value="<%=rmap.get("PRODUCT_OPTION")%>"><%=rmap.get("PRODUCT_OPTION")%></option>
                <%
              }
              %>
              <%
            }
            %>
          </select>
        </div>
      </div>
      <br>
      <div>
        수량
        <input type="number" class="form-control" id="p_count" name="p_count" min="1" value="1" style="width: 100px;">
      </div>
      <br>
      <br>
      배송정보<br>
      <small>일반배송 3,000원</small>
      <br><br><br>
      <div class="container2">
        <button type="button" class="btn btn-cart" onclick="addCart()">
            <i class="fas fa-shopping-cart"></i> 장바구니
        </button>
        <button type="button" class="btn btn-gift" onclick="">
            <i class="fas fa-gift"></i> 선물하기
        </button>
        <br><br> <!-- 버튼 사이 간격 -->
        <button type="button" class="btn button-gradient" onclick="payment()">주문하기</button>
    </div>
    </div>
    </div>
  </div>
  <script>
    function selectOption(option) {
      const dropdownButton = document.getElementById('option-dropdown');
      dropdownButton.textContent = option;
    }

    function addCart() {
      alert("장바구니에 추가되었습니다.");
      let cart_user_no = '<%=member2.get("USER_NO")%>';
      const cart_product_no = '<%=rmap.get("PRODUCT_NO")%>';
      const cart_count = document.getElementById("p_count").value;
      const query = "/cart/cartInsert?user_no="+cart_user_no+"&product_no="+cart_product_no+"&cart_count="+cart_count;
      window.location.href = query;
    }

    function payment(){
      let cart_user_no = '<%=member2.get("USER_NO")%>';
      const cart_product_no = '<%=rmap.get("PRODUCT_NO")%>';
      const cart_count = document.getElementById("p_count").value;
      const product_name = document.getElementById("product_name").value;
      const price = document.getElementById("price").value;
      const sumPrice = (price * cart_count);
      const total_price = (price * cart_count +3000);
      const product_image = document.getElementById("product_image").value;
      const query = "/order/order.jsp?userNo="+cart_user_no+"&productNo="+cart_product_no+"&cartCount="+cart_count
                    +"&productName="+product_name+"&totalPrice="+total_price+"&sumPrice="+sumPrice+"&product_image="+product_image;
      window.location.href = query;
    }
  </script>
  </div>
  <!-- body end       -->
        </body>
      </html>