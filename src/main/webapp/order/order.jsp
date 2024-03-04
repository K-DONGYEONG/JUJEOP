<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<%
String user_no = request.getParameter("userNo");
String order_no = request.getParameter("orderNo");
String product_no = request.getParameter("productNo");
String product_name = request.getParameter("productName");
String cartCount = request.getParameter("cartCount");
String totalPrice = request.getParameter("totalPrice");
String sumPrice = request.getParameter("sumPrice");
String product_image = request.getParameter("product_image");
%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문하기</title>
    <%@include file="/include/main_homepage.jsp"%>
    <%@include file="/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" type="text/css" href="../css/order.css"> 
</head>
<body>
    <div class="tabcontent" id="tab1">
        <div class="address-box" >
            <h2>배송지 정보</h2>
            <hr class="divider">
            <input type="hidden" id ="user_no" value="<%=user_no%>">
            <input type="hidden" id ="order_no" value="<%=order_no%>">
            <input type="hidden" id ="product_no" value="<%=product_no%>">
            <input type="hidden" id ="order_price" value="<%=sumPrice%>">
            <input type="hidden" id ="product_name" value="<%=product_name%>">
            <input type="hidden" id ="res_address_detail" value="">
            <input type="hidden" id ="res_address" value="">
            <input type="hidden" id ="order_total" value="<%=totalPrice%>">
            <input type="hidden" id ="cartCount" value="<%=cartCount%>">
            
            수취인명 : <input type="text" style="border:none;" id="res_name"  value="" readonly></input><br>
            수취인 전화번호 : <input type="text" style="border:none;" id="res_phone"  value="" readonly></input><br>
            배송 주소 : <input type="text" style="border:none;" id="res_addressSum" value="" readonly></input><br>
            배송 요청사항(선택) : <input type="text" id="order_comment" value=""></input><br>
        </div>
    </div>
    <div class="tabcontent" id="tab2">
        <div class="order-box">
            <h2>주문 예정 상품</h2>
            <hr class="divider">
            <div class="product-info" style="display: flex; align-items: center;">
                <img src='..<%=product_image%>' alt="상품 사진" width="100" height="auto">
                <div class="product-details">
                    <div id="product_name">상품명 : <%=product_name%></div>
                    <div id="quantity">수량 : <%=cartCount%> 개 </div>
                    <div id="price">가격 : <%=sumPrice%> 원</div>
                </div>
            </div>
            <hr class="divider">
            <span class="total-price">
            </span>
        </div>
    </div>
    <div class="tabcontent" id="tab3">
        <div class="pay-box">
            <h2>결제방법</h2>
            <hr class="divider">
                <div class="payment-box">
                    <button class="bank-transfer-button" onclick="paymethod('무통장입금')">무통장 입금</button>
                    <button class="kakaopay-button" onclick="paymethod('카카오페이')">
                        <img src="../image/카카오페이.png" alt="카카오페이">
                    </button>
                </div>
        </div>
    </div>
    <div class="tabcontent" id="tab4">
        <div class="bill-box">
            <h2>계산서</h2>
            <div class="order-box">
                결제 방법 : <input type="text" style="border:none;" id="pay_method" value=""><br>
                총 상품금액 : <input type="text" style="border:none;" id="order_total" value="<%=sumPrice%>원"></input><br>
                <div id="shipping_price">배송비 : 3,000원</div>
                <span class="order-point">포인트 사용 : 0원</span><br>
                <hr class="divider">
                총 결제금액 : <input type="text" style="border:none;" id="order_total_payment" value="<%=totalPrice%>원"></input>
            </div>
        </div>
    
    <div class="tabcontent" id="tab5">
        <div class="agree-box">
            <label for="agreeCheckbox">
                <input type="checkbox" id="agreeCheckbox" name="agreeCheckbox"onclick ="checkYn()" >
                개인정보 수집에 동의합니다.
            </label>
        </div>
    </div>
    <button class="payment-button" onclick="initiateKakaoPay()">결제하기</button>
<!------------------------- 스크립트 ------------------------->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
<script>
    window.addEventListener('load', function () {
        userInfo(); //회원정보 조회-select
    });
    
    // 체크박스 테스트용 함수
    function checkYn(){
        console.log($("input:checkbox[name=agreeCheckbox]").is(":checked"));
        if($("input:checkbox[name=agreeCheckbox]").is(":checked") == true) {
            console.log("체크완료");
        }else{
            console.log("체크 no");
        } 
    }

    function userInfo(){
        const user_no    = document.getElementById('user_no'); //회원번호(pk)

        $.ajax({
            url: "userInfo",
            data: {
                "user_no": user_no.value
            },
            type: "POST",
            success: function (data) {
                // 배송지 정보를 불러온 후 수취인 정보를 불러오도록 추가
                document.getElementById("res_name").value               = data[0].USER_NAME;
                document.getElementById("res_phone").value              = data[0].USER_PHONE;
                document.getElementById("res_addressSum").value         = data[0].USER_ADDRESS+", "+data[0].USER_ADDRESS_DETAIL;           
                document.getElementById("res_address").value            = data[0].USER_ADDRESS;
                document.getElementById("res_address_detail").value     = data[0].USER_ADDRESS_DETAIL;
            },
            error: function () {
                alert("주문페이지 조회 실패")
            }
        });
    }

    // 결제 insert 함수
    function paymethod(a) {
        console.log(a);
        if(a=="무통장입금") {
            document.getElementById("pay_method").value = a;
        } else if(a=="카카오페이") {
            document.getElementById("pay_method").value = a;
        }
    }

    //주문정보 입력
    function orderInsert() {
        const user_no    = document.getElementById('user_no'); //주문번호(pk)
        const pay_method  = document.getElementById('pay_method'); //결제방법
        const res_name   = document.getElementById('res_name'); // 수취인명
        const res_phone   = document.getElementById('res_phone'); // 수취인 전화번호
        const res_address   = document.getElementById('res_address'); // 수취인 주소
        const res_address_detail   = document.getElementById('res_address_detail'); // 수취인 상세주소
        const order_total   = document.getElementById('order_price'); //
        const pay_price   = document.getElementById('order_total'); //
        const product_no   = document.getElementById('product_no'); //
        const order_comment   = document.getElementById('order_comment'); //
        const product_name = document.getElementById('product_name');
        
        

        console.log("유저번호 :"+user_no.value);
        console.log("결제방법 :"+pay_method.value);
        console.log("수취인명 :"+res_name.value);
        console.log("저나버노 :"+res_phone.value);
        console.log("줏소 :"+res_address.value);
        console.log("상세줏소 :"+res_address_detail.value);
        console.log("총주문금액 :"+order_total.value);
        console.log("총결제금액 :"+pay_price.value);
        console.log("상품번호 :"+product_no.value);
        console.log("배송요청사항 :"+order_comment.value);
        console.log("상품명 : " + product_name.value);


      // 업데이트된 데이터를 서버로 전송
        $.ajax({
            url:"orderInsert",
            data: { "user_no": user_no.value, 
                    "product_no": product_no.value, 
                    "order_total": order_total.value,
                    "order_comment" : order_comment.value,
                    "res_name" : res_name.value,
                    "res_phone" : res_phone.value,
                    "res_address" : res_address.value,
                    "res_address_detail" : res_address_detail.value
                },
            type:"POST",
            success : function(data){
            //alert("결제되었습니다. ")
            },
            error : function(){
            //alert("결제 실패하였습니다.")
            }
        });

        
    }

    // 결제입력
    function payInsert1() {
        const user_no    = document.getElementById('user_no'); //주문번호(pk)
        const pay_method  = document.getElementById('pay_method'); //결제방법
        const pay_price   = document.getElementById('order_total'); //
        const cartCount   = document.getElementById('cartCount'); //
        

        console.log("유저번호 :"+user_no.value);
        console.log("주문번호 :" + order_no.value);
        console.log("결제방법 :"+pay_method.value);
        console.log("총결제금액 :"+pay_price.value);
        console.log("수량 :"+cartCount.value);


      // 업데이트된 데이터를 서버로 전송
        $.ajax({
            url:"payInsert1",
            data: { "user_no": user_no.value, 
                    "pay_method": pay_method.value,
                    "pay_price": pay_price.value,
                    "pay_count": cartCount.value
                },
            type:"POST",
            success : function(data){
            //alert("결제되었습니다. ")
            },
            error : function(){
            //alert("결제 실패하였습니다.")
            }
        });
    }
    // 카카오페이 결제 함수
    function kakaopayInsert() {
        // "카카오페이" 버튼을 클릭한 경우
        const paymentMethod = "카카오페이";
        document.getElementById("pay_method").value = paymentMethod;
    }
    
    // 버튼클릭 함수
    function initiateKakaoPay(){

        // 결제시에 무조건 체크할 수 있게함
        if($("input:checkbox[name=agreeCheckbox]").is(":checked") == false) {
            alert("개인정보 수집 동의를 체크 해주십시오.");
            return;
        } 
        if(document.getElementById("pay_method").value==null||document.getElementById("pay_method").value==""){
            alert("결제방법을 선택해주세요.");
            return;
        }

        var a = document.getElementById("pay_method").value;       
            if(a=="카카오페이") { // 카카오페이
                orderInsert();
                payInsert1();
                const pay_price2 = document.getElementById('order_total').value;
                const product_name2 = document.getElementById('product_name').value;
                console.log(pay_price2);
                console.log(product_name2);
                 window.location.href = "../payment/kakaoPay?order_total="+pay_price2+"&product_name="+product_name2;
            } else { //무통장입금
                orderInsert(); //주문입력
                payInsert1();   //결제입력
                const user_no = document.getElementById('user_no').value;
                const order_no = document.getElementById('order_no').value;
                window.location.href = "../order/orderCompletion.jsp?orderNo="+order_no+"&userNo="+user_no;
            }
    }
</script>    
</body>
</html>