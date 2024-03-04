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
  <title>마이페이지</title>
  <%@include file="/include/main_homepage.jsp"%>
  <%@include file="/common/bootstrap_common.jsp"%>
  <link rel="stylesheet" type="text/css" href="../css/mypage.css"> 
    
</head>
<body>
  <div class="tabs">
    <button class="tablink" onclick="openTab('회원정보')">회원정보</button>
    <button class="tablink" onclick="openTab('주문내역')">주문내역</button>
    <button class="tablink" onclick="openTab('배송지관리')">배송지관리</button>
  </div>

  <!----------------------- 회원정보 페이지 ----------------------->
  <div id="회원정보" class="tabcontent">
    <!-- 회원정보 페이지의 내용 -->
    <h2>회원 정보</h2>
    <form id="editForm" action="/mypage/memberUpdate" method="post">
      <label for="user_name">이름 :</label> <br>
      <input type="text" id="user_name" name="user_name"  readonly> <br>
      
      <label for="user_phone">연락처 :</label><br>
      <input type="text" id="user_phone" maxlength="13" name="user_phone" readonly><br>
      
      <label for="user_address">주소 :</label><br>
      <input type="text" id="user_address" name="user_address" readonly><br>

      <label for="user_address">상세주소 :</label><br>
      <input type="text" id="user_address_detail" name="user_address_detail" readonly><br>
      
      <label for="user_email">이메일 :</label><br>
      <input type="email" id="user_email" name="user_email" readonly><br>
      
      <label for="user_password">비밀번호 :</label><br>
      <input type="password" id="user_password" name="user_password" readonly><br>
      
      <input type="hidden" id="user_no" value="<%=member.get("USER_NO")%>"></input><br>
      
      <button type="button" id="editButton" onclick="userUpdateSet()">수정</button>
      <button type="button" class="saveButton" id="saveButton" onclick="userUpdate()">저장</button>
    </form>
  </div>

  <!----------------------- 주문내역 페이지 ----------------------->
  <div id="주문내역" class="tabcontent">
    <!-- 주문내역 리스트의 내용 -->
    <h2>주문 내역</h2>
    <div id ="result"></div>
  </div>

  <!----------------------- 배송지관리 페이지 ----------------------->
  <div id="배송지관리" class="tabcontent">
    <!-- 배송지관리 페이지의 내용 -->
    <h2>배송지 관리</h2>
    <div class="address-box">
      <div class="address-info">
        <input type="text" style="border:none;" id="user_name2" value="" readonly></input>
        <input type="text" style="border:none;" id="user_phone2" value="" readonly></input>
        <input type="text" style="border:none;" id="user_address2" value="" readonly></input>
        <input type="text" style="border:none;" id="user_address_detail2" value="" readonly></input>
      </div>
      <div class="address-edit">
        <button type="button" id="updateButton" onclick="coupangUpdateSet()">수정</button>
        <button type="button" id="saveButton2" onclick="coupangUpdate()">저장</button>
      </div>
    </div>
  </div>
  <!----------------------- 스크립트 ----------------------->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    var result;
    // 페이지 로딩 시 초기화
    window.addEventListener('load', function () {
      openTab("회원정보"); // 회원정보 탭이 처음 자동 노출되게함.
      userInfo(); //회원정보 조회-select
    });
    
    // orderList 함수 내에서 주문 상세 페이지로 이동
    function goToOrderDetail(orderNo) {
      const url = '../order/orderDetail.jsp?orderNo=' + orderNo;
      window.location.href = url;
    }
    
    // 주문내역 조회
    function orderList(){
      // 조회 조건(USER_NO) 값 파라미터 준비
      const userNo = document.getElementById('user_no'); //회원번호(pk)
      console.log("주문내역 조회 시작");
      console.log("유저넘버(조건파라미터):"+userNo.value);
      var result;

      $.ajax({
        url:"orderList",
        data:"user_no=" + userNo.value,
        type:"POST",
        success : function(data){
          console.log("data.length = "+data.length);
          var html="";
          $("#result").children(".resultDiv").remove();
          for(var i=0; i <data.length;i++){
            html += '<div class="resultDiv">';
            html += '<div class="order-box">';
            html += '<div class="order-header" style="display: flex; justify-content: space-between;">';
            html += '<span class="order-date">'+data[i].ORDER_DATE+'</span>';
            
            html += '<form action ="/order/orderDetail.jsp" method="post">';
            html += '<input type="hidden" name="userNo" value='+userNo.value+'>';  
            html += '<input type="hidden" name="orderNo" value='+data[i].ORDER_NO+'>';
            html += '<input type="submit" value="주문상세보기">'; 
            html += '</form>';  
            html += '</div>';
            html += '<hr class="divider">';
            html += '<div class="order-info">';
            html += '<span class="res_name">'+data[i].RES_NAME+' | </span>';
            html += '<span class="res_phone">'+data[i].RES_PHONE+'</span>';
            html += '</div>';
            html += '<hr class="divider">';
            html += '<div class="product-info" style="display: flex; align-items: center;">';
            html += '<img src="..'+data[i].PRODUCT_IMAGE+'" alt="상품 사진">';
            html += '<div class="product-details">';
            html += '<span class="product-name">'+data[i].PRODUCT_NAME+'</span>';
            html += '<span class="quantity">수량 : '+data[i].PAY_COUNT+'개</span>';
            html += '<span class="price">가격 : '+data[i].ORDER_TOTAL+'원</span>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
          }
          $("#result").append(html);
        },
        error : function(){
          alert("회원정보 수정에 실패하셨습니다.")
        }
      });
    }

    /****************************회원정보*****************************/
    // 회원 정보 조회
    function userInfo(){
      // 조회 조건(USER_NO) 값 파라미터 준비
      const userNo = document.getElementById('user_no'); //회원번호(pk)
      console.log("유저정보 조회 시작");
      console.log("유저넘버:"+userNo.value);
      $.ajax({
        url:"memberInfo",
        data:"user_no=" + userNo.value,
        type:"POST",
        success : function(data){
          document.getElementById("user_name").value = data.USER_NAME;
          document.getElementById("user_name2").value = data.USER_NAME;
          document.getElementById("user_phone").value = data.USER_PHONE;
          document.getElementById("user_phone2").value = data.USER_PHONE;
          document.getElementById("user_address").value = data.USER_ADDRESS;
          document.getElementById("user_address_detail").value = data.USER_ADDRESS_DETAIL;
          document.getElementById("user_address2").value = data.USER_ADDRESS;
          document.getElementById("user_address_detail2").value = data.USER_ADDRESS_DETAIL;
          document.getElementById("user_email").value = data.USER_EMAIL;
          document.getElementById("user_password").value = data.USER_PASSWORD;
        },
        error : function(){
          alert("회원정보 수정에 실패하셨습니다.")
        }
      });
    }
    // 회원 정보 수정을 위한 버튼 컨트롤
    function userUpdateSet() {
      const saveButton = editForm.querySelector('.saveButton');
      const phoneInput = document.getElementById('user_phone');
      const addressInput = document.getElementById('user_address');
      const addressDetailInput = document.getElementById('user_address_detail');
      const passwordInput = document.getElementById('user_password');
      const editButton = document.getElementById('editButton');
      //저장 버튼 표시 
      saveButton.style.display = 'block';   
      editButton.style.display = 'none';
      //수정 클릭시 변경가능한 변수 컨트롤
      phoneInput.readOnly = false;  //연락처
      addressInput.readOnly = false;  //주소
      addressDetailInput.readOnly = false;  //상세주소
    }
  
    // 회원정보 수정 내용 저장
    function userUpdate() {
      const editForm = document.getElementById('editForm');
      const saveButton = editForm.querySelector('.saveButton');
      const phoneInput = document.getElementById('user_phone');
      const addressInput = document.getElementById('user_address');
      const addressDetailInput = document.getElementById('user_address_detail');
      const passwordInput = document.getElementById('user_password');
      const userNo = document.getElementById('user_no');
      const editButton = document.getElementById('editButton');
  
      console.log("연락처 :"+phoneInput.value);
      console.log("주소 :"+addressInput.value);
      console.log("주소(상세) :"+addressDetailInput.value);
      console.log("비밀번호 :"+passwordInput.value);
      console.log("회원번호 :"+userNo.value);

      // 업데이트된 데이터를 서버로 전송
      $.ajax({
        url:"memberUpdate",
        data: {"user_phone": phoneInput.value,
              "user_address": addressInput.value,
              "user_address_detail": addressDetailInput.value,
              "user_password" : passwordInput.value,
              "user_no":userNo.value
              },
        type:"POST",
        success : function(data){
          alert("회원정보를 수정하였습니다. ")
        },
        error : function(){
          alert("회원정보 수정에 실패하셨습니다.")
        }
      });

      // 입력 필드를 읽기 전용으로 변경하고 수정 버튼을 보이도록 설정
      phoneInput.setAttribute('readonly', 'readonly');
      addressInput.setAttribute('readonly', 'readonly');
      addressDetailInput.setAttribute('readonly', 'readonly');
      passwordInput.setAttribute('readonly', 'readonly');
      saveButton.style.display = 'none';
      editButton.style.display = 'block';
    }
  
    /****************************배송지*****************************/
    // 배송지 수정 
    function coupangUpdateSet() {
      // 배송지 수정 버튼을 누르면 배송지 입력 필드를 수정 가능한 상태로 변경
      const addressInput = document.getElementById('user_address2');
      const addressDetailInput = document.getElementById('user_address_detail2');
      //수정 클릭시 변경가능한 변수 컨트롤
      addressInput.readOnly = false;  //주소
      addressDetailInput.readOnly = false;  //상세주소
      updateButton.style.display = 'none';
      saveButton2.style.display = 'block';
    }
  
    // 배송지 정보 저장
    function coupangUpdate() {
      const addressInput = document.getElementById('user_address2');
      const addressDetailInput = document.getElementById('user_address_detail2');
      const userNo = document.getElementById('user_no');
  
      console.log("배송지 업데이트 시작");
      console.log("주소 :"+addressInput.value);
      console.log("주소(상세) :"+addressDetailInput.value);
      console.log("회원번호 :"+userNo.value);
      
      // 업데이트된 데이터를 서버로 전송
      $.ajax({
        url:"addressUpdate",        
        data: {"newAddress": addressInput.value,
              "newAddressDetail": addressDetailInput.value,
              "user_no":userNo.value
              },
        type:"POST",
        success : function(data){
          alert("배송지 정보를 수정하였습니다. ")
        },
        error : function(){
          alert("회원정보 수정에 실패하셨습니다.")
        }
      });
      updateButton.style.display = 'block';
      saveButton2.style.display = 'none';
    }

    // 탭을 열 때마다 수정 버튼을 보이도록 설정
    function openTab(tabName) {
      var i;
      var tabcontent = document.getElementsByClassName('tabcontent');
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = 'none';
      }
      document.getElementById(tabName).style.display = 'block';
      if (tabName === '회원정보') {
        userInfo();
        editButton.style.display = 'block';
        //toggleEdit();
      } else if (tabName === '배송지관리') {
        userInfo();
        updateButton.style.display = 'block';
        saveButton2.style.display = 'none';
      } else if(tabName == '주문내역'){
        orderList();
      }
    }
  </script>
</body>
</html>