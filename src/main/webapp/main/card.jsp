<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>        
<%
	int size = 0;
	List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("pList");
	if(pList !=null){
		size = pList.size();	
	}
%>
    <!-- =============================  [[ Card section ]]  ============================= -->
    <div class="container">
      <div class="row" style="margin: 10px 10px">


        <!-- 상품 목록 -->
        <div class="row">
          <%
          for (int i = 0; i < pList.size(); i++)
          {
            if (pList.size() == i)
              break;
            Map<String, Object> rmap = pList.get(i);
          %>
          <div class="col-md-3 mb-2">
            <div class="card" onclick="productDetail('<%=rmap.get("PRODUCT_NO")%>')">
                <a href="javascript:productDetail('<%=rmap.get("PRODUCT_NO")%>')" ><img class="product-image" src="<%=rmap.get("PRODUCT_IMAGE") %>" ></a>
              <div class="card-body">
                <a class="card-title" href="javascript:productDetail('<%=rmap.get("PRODUCT_NO")%>')"><h5><%=rmap.get("PRODUCT_NAME") %></h5></a>
                <p class="card-text2">
                  가격: <%=rmap.get("PRODUCT_PRICE")%>원
                  <p class="card-text">
                   # <%=rmap.get("PRODUCT_TAG")%>
                </p>
              </div>
            </div>
            <br>  <br>  <br>  <br>
          </div>
          <%
          }
          %>
        </div>
      </div>
    </div>
    