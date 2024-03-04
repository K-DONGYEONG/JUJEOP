<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html lang="ko">
<head>
    <link rel="stylesheet" href="/css/icon.css" />
</head>

<body>
    <div class="container">
        <div class="btm_image" id="img_btn">
            <a href="/product/productTak?d_category_no=1">
                <img  src="/image/탁주.jpg">
            </a>
        </div>
        <div class="btm_image" id="img_btn">
            <a href="/product/productYak?d_category_no=2"> 
                <img  src="/image/약청주.jpg">
            </a>
        </div>
        <div class="btm_image" id="img_btn">
            <a href="/product/productGwa?d_category_no=3"> 
                <img  src="/image/과실주.jpg">
            </a>
        </div>
        <div class="btm_image" id="img_btn">
            <a href="/product/productJeung?d_category_no=4"> 
                <img  src="/image/증류주.jpg">
            </a>
        </div>
    </div>    
</body>
</html>