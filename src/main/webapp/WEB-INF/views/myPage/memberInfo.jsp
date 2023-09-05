<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    <link rel = "stylesheet" href = "../../../resources/css/myPage/memberInfo.css">
</head>
<body>
     <!-- 헤더 -->
     <div class="header"></div>
     <div class="content">

        <!-- 일석이님의 회원 정보 -->
        <div class="infoTitle">
            <h1>일석이님의 회원 정보</h1></div>
     

     <!-- 회원 정보 다 들어가있는 칸 -->
     <div class="memberInfo">
        <!-- 프로필 이미지 -->
        <div class="profileImage">
             <div class="profile-image-area">

                        <img src="../../../resources/images/user.png" id="profileImage">

                    </div>

        </div>

        <!-- 이메일, 이름, 닉네임, 전화번호, 주소 -->
        <div class="info">
            <div>이메일 : user01@naver.com</div><br>

            <div>이름 : 유저일</div><br>

            <div>닉네임 : 유저일이지롱</div><br>

            <div>전화번호 : 010-1231-1231</div><br>

            <div>주소 : 서울특별시 강남구 테헤란로 2</div>
        </div>
    </div>

    <!-- 수정하기 버튼 -->
    <div class="updateBtn">
        <button id = "updateBtn">수정하기</button>
    </div>
    </div>
     <div class="footer"></div>



</body>
</html>