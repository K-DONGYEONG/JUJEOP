<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>      
<%@ page import="java.math.BigDecimal" %>  
<%
    int size = 0;
    int total_price = 0;
	List<Map<String,Object>> cList = (List<Map<String,Object>>)request.getAttribute("cList");
	if(cList !=null){
		size = cList.size();
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <%@ include file="/common/bootstrap_common.jsp"%>
    <%@ include file="/include/main_homepage.jsp" %>
    <link rel="stylesheet" href="/css/cart.css">
    <script type="text/javascript">

        const cartDelete = (cart_no) => { 
           window.location.href="/cart/cartDelete?cart_no="+cart_no;
        }
        const orderList = () => { 
            window.location.href="/order/orderCartList?user_no="+<%= member.get("USER_NO")%>;
        }
        const returnProductList = () => { 
            window.location.href="/product/productList"
        }
    </script>
 <style>

    body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
  }
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .content-container {
      padding-top: 60px; 
  }
  .container form {
    text-align: center;
  }
  .btn {
    display: inline-block;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
  }
  .btn-primary {
    background-color: #007bff;
    color: #fff;
  }
  .btn-primary:hover {
    background-color: #0056b3;
  }
  .btn-secondary {
    background-color: #6c757d;
    color: #fff;
  }
  .btn-secondary:hover {
    background-color: #4e5459;
  }
    .total-price-table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 20px;
    }

    .total-price-table th,
    .total-price-table td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
    }

    .total-price-header {
        font-size: 18px;
        font-weight: bold;
        text-align: right;
    }

    .total-price-row td {
        font-weight: bold;
    }

    .total-price {
        font-size: 24px;
        color: #007BFF; 
    }
</style>
</head>
<body>
    <div class="content-container">
    <%
    for(int i = 0; i<size; ++i) { 
    Map<String,Object> rmap = cList.get(i);
    BigDecimal product_price = (BigDecimal) rmap.get("PRODUCT_PRICE");
    int cart_count = ((BigDecimal) rmap.get("CART_COUNT")).intValue(); 
    total_price += product_price.intValue() * cart_count; 
    %>
    <table>
    <thead>
    <tr>
        <th width="20%"></th>
        <th width="20%">상품명</th>
        <th width="30%">상품설명</th>
        <th width="10%">상품갯수</th>
        <th width="10%">상품가격</th>
        <th width="20%"></th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td width="20%"><img src= "<%= rmap.get("PRODUCT_IMAGE")%>" width="120px" height="150px"></td>
        <td width="20%"><%= rmap.get("PRODUCT_NAME") %> <br> <%= rmap.get("PRODUCT_OPTION")%></td>
        <td width="30%"><%= rmap.get("PRODUCT_CONTENT") %></td>
        <td width="10%"><%= rmap.get("CART_COUNT") %></td>
        <td width="10%"><%= rmap.get("TOTAL_PRICE") %></td>
        <td width="10%"><input type="button" value="삭제" onclick="cartDelete('<%= rmap.get("CART_NO") %>')" ></td>
    </tr>
    <%
}
    %>
    </tbody>
    </table>
    <table class="total-price-table">
        <tr class="total-price-row">
            <th colspan="5" class="total-price-header">장바구니 총 가격:</th>
            <td class="total-price"><%= total_price %>원</td>
        </tr>
    </table>
<div class="container">
  <% if(size != 0) { %>
      <button class="btn btn-primary" onclick="orderList()">주문하기</button> &nbsp;
      <%} %>
    </form>
    <button class="btn btn-secondary" onclick="returnProductList()">더보기</button>
  </div>
</div>
</div>
</body>
</html>