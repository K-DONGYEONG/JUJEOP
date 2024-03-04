<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문상세내역</title>
    <%@include file="/include/main_homepage.jsp"%>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" type="text/css" href="../css/orderDetail.css">       
</head>
<body>
    <!----------------------- 주문내역박스 ----------------------->
    <%
    String user_no = request.getParameter("userNo");
    String order_no = request.getParameter("orderNo");
    %>
    
    <div class="tabcontent">
    <!-- 주문내역박스 내용 -->
    <h2>주문 내역</h2>
    <input type="hidden" id ="user_no" value="<%=user_no%>">
    <input type="hidden" id ="order_no" value="<%=order_no%>">
    
    <div class="order-box">
        <div class="order-header">
            <input type="text" style="border:none;" id="order_date" value=""></input>
            <input type="text" style="border:none;" id="order_no2" value=""></input>
        </div>
        <div class="order-info">
            <input type="text" style="border:none;" id="res_name" value=""></input>
            <input type="text" style="border:none;" id="res_phone" value=""></input>
        </div>
        <hr class="divider">
        <div id="productInfo">
        </div>
        <hr class="divider">
        <span class="payment-status">결제완료</span>
    </div>
    </div>
    <!------------------------ 주문취소버튼 ------------------------>
    <!-- 주문취소버튼 -->
    <button class="cancellation-button" onclick="confirmCancelOrder()">주문취소</button>


    <!----------------------- 수취인정보박스 ----------------------->
    <div class="tabcontent">
    <!-- 수취인정보박스 내용 -->
    <h2>수취인 정보</h2>
    <div class="order-box">
        <div class="order-header">
        </div>
        <input type="text" style="border:none;" id="res_name2"  value=""></input>
        <input type="text" style="border:none;" id="res_phone2"  value=""></input>
        <input type="text" style="border:none;" id="res_address" value=""></input>
        <input type="text" style="border:none;" id="order_comment" value=""></input>
    </div>
    
    </div>
    </div>

    <!----------------------- 계산서박스 ----------------------->
    <div class="tabcontent">
    <!-- 계산서박스 내용 -->
    <h2>계산서</h2>
    <div class="order-box">
        <div class="order-header">
        </div>
        <input type="text" style="border:none;" id="pay_date" value=""></input>
        <input type="text" style="border:none;" id="pay_method" value=""></input>
        <input type="text" style="border:none;" id="order_total" value=""></input>
        <span class="order-shipping-price">총 배송비 : 3,000원</span>
        <span class="order-point">포인트 사용 : 0원</span>
        <hr class="divider">
        <input type="text" style="border:none;" id="order_total_payment" value=""></input>
    </div>
    </div>
    <!----------------------- 주문목록버튼 ----------------------->
    <button class="orderList-button">주문목록</button>
<!------------------------- 스크립트 ------------------------->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script>
    window.addEventListener('load', function () {
        orderInfo(); //회원정보 조회-select
    });

    function orderInfo(){
        const user_no    = document.getElementById('user_no'); //회원번호(pk)
        const order_no   = document.getElementById('order_no'); //주문번호(pk)
        console.log("order_no = "+order_no.value);
        console.log("user_no = "+user_no.value);

        $.ajax({
            url: "orderInfo",
            data: {
                "user_no": user_no.value,
                "order_no": order_no.value
            },
            type: "POST",
            success: function (data) {
                document.getElementById("order_date").value = data[0].ORDER_DATE;
                document.getElementById("order_no2").value = data[0].ORDER_NO;
                document.getElementById("res_name").value = data[0].RES_NAME;
                document.getElementById("res_phone").value = data[0].RES_PHONE;
                document.getElementById("res_name2").value = "수취인 : "+  data[0].RES_NAME;
                document.getElementById("res_phone2").value = "전화번호 : "+  data[0].RES_PHONE;
                document.getElementById("res_address").value = "주소 : "+  data[0].RES_ADDRESS;
                document.getElementById("order_comment").value = "배송 요청사항 : "+  data[0].ORDER_COMMENT;
                document.getElementById("order_total").value = "총 상품금액 : "+ data[0].ORDER_TOTAL +"원";
                document.getElementById("pay_method").value = "결제방법 : "+ data[0].PAY_METHOD;
                document.getElementById("pay_date").value = "결제일시 : "+  data[0].PAY_DATE;
                document.getElementById("order_total_payment").value = "총 결제금액 : "+data[0].PAY_PRICE +"원" ;

                var html = "";
                html += '<div class="product-info">';
                html += '    <div class="product-details">';
                html += '        <img src="../' + data[0].PRODUCT_IMAGE + '" alt="상품 사진">';
                html += '    </div>';
                html += '    <div class="product-details">';
                html += '        <span class="product-name">' + data[0].PRODUCT_NAME + '</span>';    
                html += '        <span class="option-count">' + data[0].PAY_COUNT + '개</span>';
                html += '        <span class="product-price">' + data[0].ORDER_TOTAL + '원</span>';
                html += '    </div>';
                html += '</div>';
                $("#productInfo").append(html);
                
            },
            error: function () {
                alert("주문상세 조회 실패")
            }
        });
    }

    // 주문내역삭제
    function confirmCancelOrder() {
        if (confirm("주문을 취소하시겠습니까?")) {
            cancelOrder();
        }
    }

    // 주문 취소 동작을 수행하는 함수
    function cancelOrder() {
        const user_no = document.getElementById('user_no').value;
        const order_no = document.getElementById('order_no').value;

        // 서버로 주문 취소 요청 전송
        $.ajax({
            url: "deleteOrder", // 주문 취소 요청을 처리하는 서버 URL
            data: {
                "user_no": user_no,
                "order_no": order_no
            },
            type: "POST",
            success: function (response) {
                //console.log("response =="+response.getElementById);
                alert("주문이 성공적으로 취소되었습니다.");

                window.location.href = "../mypage/mypage.jsp?userNo="+user_no;
            },
            error: function () {
                alert("주문 취소 중에 오류가 발생했습니다.");
            }
        });
    }

    // 페이지 리로드 후 지정한 페이지로 이동
    window.reload = function() {
        location.href = "../mypage/mypage.jsp";
    };
    
    // 주문목록 버튼 클릭 시 마이페이지로 이동
    $(".orderList-button").click(function() {
        const user_no = document.getElementById('user_no').value;
        const order_no = document.getElementById('order_no').value;

        window.location.href = "../mypage/mypage.jsp?userNo="+user_no+"&orderNo="+order_no;
    });
    
</script>
</body>
</html>