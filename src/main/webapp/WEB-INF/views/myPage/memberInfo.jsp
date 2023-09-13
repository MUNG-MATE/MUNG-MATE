<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${loginMember.memberNickname}님의 마이페이지</title>
    <link rel = "stylesheet" href ="/resources/css/myPage/memberInfo.css">
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

     <div class="content">

        <!-- 일석이님의 회원 정보 -->
        <div class="infoTitle">
            <h1>${loginMember.memberNickname}님의 회원 정보</h1></div>
     

     <!-- 회원 정보 다 들어가있는 칸 -->
     <div class="memberInfo">
        <!-- 프로필 이미지 -->
        <div class="profileImage">
             <div class="profile-image-area">

                       <%-- 프로필 이미지 있으면 해당 이미지 --%>
                <c:if test="${empty loginMember.profileImage}" >
                    <img src="/resources/images/user.png" id="profileImage">
                </c:if>

                <%-- 프로필 이미지가 없으면 기본 이미지 --%>
                <c:if test="${!empty loginMember.profileImage}" >
                    <img src="${loginMember.profileImage}" id="profileImage">
                </c:if>

            </div>

        </div>

        <!-- 이메일, 이름, 닉네임, 전화번호, 주소 -->
        <div class="info">
                    이메일<div>${loginMember.memberEmail}</div><br>

                    이름<div>${loginMember.memberName}</div><br>

                    닉네임 <div>${loginMember.memberNickname}</div><br>

                    전화번호<div> ${loginMember.memberTel}</div><br>
                    
                    주소

                    <c:set var = "addr" value =  "${fn:split(loginMember.memberAddress, '^^^')}"/>
                    <div class="address">
                       ${addr[0]}
                    </div>

                    <div class="address">
                        ${addr[1]}
                    </div>

                    <div class="address">
                        ${addr[2]}
                    </div>
            </div>
        </div>
    </div>

    <!-- 수정하기 버튼 -->
    <div class="updateBtn">
        <button id = "updateBtn">수정하기</button>
    </div>
    </div>
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />



 <div class="modal" id="modal">
                <form action = "/myPage/pwCheck" method = "POST">
                <div class="modal_body1">
                   <p>회원님의 비밀번호를 입력해주세요</p>
                   <input type = "text" id = "memberPw" name = "memberPw">
                    <button id="yes">확인</button>
                    <button id="back">취소</button>
                </div>                
            </div>
            </form>

</body>

    <script src="/resources/js/myPage/memberInfo.js"></script>


</html>



