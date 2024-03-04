<%@ page language="java" contentType="text/html;charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>   
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&family=Noto+Sans+KR&family=Orbit&family=Sunflower:wght@300;500&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko"> 
<head>
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="../css/memberjoinDetail.css"> 
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        const registerAction = () => {
            console.log('registerAction호출')
            const isOk = validateForm();
            if(isOk){
                document.querySelector("#f_member").submit();
            }else{
                alert("모든 항목을 입력해주세요.");
                return;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <form id="f_member" action="/member/register" method="post">
        <div class="center-text">
            <h2>회원가입</h2>
        </div>
        <!-- 기본정보 -->
        <div class="basic-info">
            <div class="input-group">
                <label for="id">아이디</label>
                <input type="text" id="user_id" name="user_id">
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="user_password" name="user_password">
                <br>
                <span class="note">비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합(8~16자)</span>
            </div>
            <div class="input-group">
                <label for="confirm-password">비밀번호 확인</label>
                <input type="password" id="user_password2" name="user_password2">
            </div>
            <div class="input-group">
                <label for="name">이름</label>
                <input type="text" id="user_name" name="user_name">
            </div>
            <div class="address-group">
                <label for="address">주소</label>
                <input type="text" id="user_address" name="user_address" placeholder="주소를 입력하세요">
                <button type="button" onclick="findAddress()">주소 검색</button>
            </div>
            <div class="input-group">
                <input type="text" id="user_address_detail" name="user_address_detail">
            </div>
            <div class="input-group">
                <label for="phone">휴대전화</label>
                <input type="text" id="user_phone" name="user_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-1234-5678">
            </div>
            <div class="input-group">
                <label for="email">이메일</label>
                <input type="email" id="user_email" name="user_email">
            </div>
        </div>
        <!-- 추가정보 -->
        <div class="additional-info">
            <div class="input-group">
                <label>성별</label>
                <div class="gender-input-group">
                    <input type="radio" id="user_gender_male" name="user_gender" value="남">
                    <label for="male">남자</label>
                    <input type="radio" id="user_gender_female" name="user_gender" value="여">
                    <label for="female">여자</label>
                </div>
            </div>
            <div class="input-group">
                <label for="birthdate">생년월일</label>
                <div class="birthdate-input-group">
                    <input type="text" id="user_birth" name="user_birth" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" placeholder="YYYY-MM-DD">
                </div>
            </div>
        </div>
        <div class="center-text">
        <!-- 가입하기 버튼 -->
        <button type="button" onclick="registerAction()">가입하기</button>
        </div>
    </form>
    </div>
    <script>
        // 주소 검색 버튼을 눌렀을 때 주소 검색 팝업을 띄우는 함수
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var address = data.address; // 선택한 주소 정보
                    document.getElementById("user_address").value = address; // 주소 필드에 값 채우기
                }
            }).open();
        }
        // 입력값이 없을 때 경고를 띄우는 함수
        function validateForm() {
            console.log('validateForm'+document.getElementById("user_id"))
        const user_id = document.getElementById("user_id").value;
        const user_password = document.getElementById("user_password").value;
        const user_password2 = document.getElementById("user_password2").value;
        const user_name = document.getElementById("user_name").value;
        const user_address = document.getElementById("user_address").value;
        const user_address_detail = document.getElementById("user_address_detail").value;
        const user_phone = document.getElementById("user_phone").value;
        const user_email = document.getElementById("user_email").value;
        const user_gender = document.querySelector('input[name="user_gender"]:checked');
        const user_birth = document.getElementById("user_birth").value;

        if (user_id === "" || user_password === "" || user_password2 === "" || user_name === "" || user_address === "" || user_address_detail === "" || user_phone === "" || user_email === "" || !user_gender || user_birth === "") {
            return false;
        }else{
            return true;
        }
    }
    </script>
</body>
</html>
