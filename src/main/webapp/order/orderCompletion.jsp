<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %> 
<%
    String order_no = request.getParameter("orderNo");
    String user_no = request.getParameter("userNo");
%>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>무통장입금 결제 완료</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
body {
    background: linear-gradient(to right, #f2f4f6, #e6e9ed);
    font-family: 'Arial', sans-serif;
}

.payment-completion {
    text-align: center;
    margin: 100px auto;
    max-width: 800px;
    padding: 40px;
    border: none;
    border-radius: 10px;
    background-color: #fff;
    box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.1);
}

.title {
    color: #333;
    font-size: 32px;
    margin-bottom: 20px;
}

.success-message {
    color: #4CAF50;
    font-size: 24px;
    margin-bottom: 30px;
}

.instruction-title {
    font-size: 22px;
    margin-bottom: 15px;
    color: #555;
}

.instruction {
    font-size: 18px;
    margin-bottom: 15px;
    color: #777;
}

.account-info {
    font-size: 18px;
    margin: 10px 0;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
}

.account-icon {
    font-size: 24px;
    color: #ff9000;
}

.confirmation-message {
    font-size: 18px;
    margin-top: 30px;
    margin-bottom: 20px;
    color: #888;
}

.return-home a {
    display: inline-block;
    margin: 10px 0;
    font-size: 18px;
    text-decoration: none;
    color: #337ab7;
    border-bottom: 1px dotted #337ab7;
    transition: color 0.3s;
}

.return-home a:hover {
    color: #23527c;
}
</style>
</head>
<body>
    <%@include file="/include/main_homepage.jsp"%>
    <%@include file="/common/bootstrap_common.jsp"%>
    
    <div class="container payment-completion">
        <h1 class="title">무통장입금 결제 완료</h1>
        <p class="success-message">무통장입금 결제가 성공적으로 완료되었습니다.</p>
        <h2 class="instruction-title">입금 안내</h2>
        <p class="instruction">아래 계좌로 결제 금액을 입금해주시기 바랍니다:</p>
        <p class="account-info">
            <i class="account-icon fa fa-university"></i>은행: 농협
        </p>
        <p class="account-info">
            <i class="account-icon fa fa-credit-card"></i>계좌 번호: 601057-51-054236
        </p>
        <p class="account-info">
            <i class="account-icon fa fa-user"></i>예금주: JUJEOP
        </p>
        <p class="confirmation-message">입금 확인 후 상품 배송이 진행될 예정입니다.</p>
        <p class="return-home"><a href="../mypage/mypage.jsp?orderNo=<%=order_no%>&userNo=<%=user_no%>" class="mypage-button">마이페이지</a></p>
        <p class="return-home"><a href="/main/mainHompage.jsp">홈으로 돌아가기</a></p>
    </div>
</body>
</html>