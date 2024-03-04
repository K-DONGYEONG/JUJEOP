<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
    Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("pMap"); 
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KakaoPay API</title>
  <%@ include file="/include/main_homepage.jsp" %>
  <%@ include file="/common/bootstrap_common.jsp"%>
  <link rel="stylesheet" type="text/css" href="styles.css"> 
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
    var IMP = window.IMP;
    IMP.init('imp63851338'); 
    const today = new Date();   
    
    const onClickPayment = () => {
        IMP.request_pay({
        pg: 'kakaopay',
        pay_method: 'card',
        merchant_uid: "uid"+new Date().getTime(),
        name: '<%= pMap.get("product_name") %>', 
        amount: '<%= pMap.get("order_total") %>', 
        buyer_name: '<%= member.get("USER_NAME")%>', 
        buyer_tel: '<%=member.get("USER_PHONE")%>', 
        buyer_addr: '<%=member.get("USER_ADDRESS")%>', 
        },
         function (rsp) {
          console.log(rsp);
          const { success, error_msg, amount, name} = rsp;
          let msg= '';
        if (success) {
          msg = '결제가 완료되었습니다.';
          msg += '결제 금액 : ' + rsp.paid_amount;
          location.href="/payment/kakaoPayComplete.jsp";
          success.submit();
        } else { 
          const msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
        }
        console.log(msg);
      });
    };
  </script>  
  <style>
.payment-container {
  text-align: center;
  margin: 100px auto;
  padding: 30px 20px;
  border-radius: 15px;
  width: 70%;
  max-width: 400px;
  box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
  background-color: #ffffff;
}

.payment-button {
  background-color: #f9c922;
  border: none;
  padding: 15px 30px;
  cursor: pointer;
  border-radius: 5px;
  font-size: 16px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s, transform 0.3s;
}

.payment-button:hover {
  background-color: #f7b500;
  transform: scale(1.05);
}

.payment-image {
  max-width: 100px;
  margin-bottom: 10px;
}

.payment-text {
  font-size: 20px;
  margin-bottom: 20px;
  color: #333;
}

  </style>
</head>
<body>
  <div class="payment-container">
    <p class="payment-text">카카오페이를 통해 안전하게 결제를 진행해주세요.</p>
    <button type="button" onclick="onClickPayment()" class="payment-button">
      <img src="/image/yellow-small.png" alt="kakaoPay" class="payment-image"/><br>
      결제하기
    </button>
  </div>
</body>
</html>





