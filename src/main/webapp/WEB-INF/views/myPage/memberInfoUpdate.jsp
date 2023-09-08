<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="/resources/css/myPage/memberInfoUpdate.css">
</head>

<body>
     <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
  
    <div class="content">

        <!-- 일석이님의 회원 정보 -->
        <div class="infoTitle">
            <h1>일석이님의 회원 정보 수정</h1>
        </div>

        <form action="/myPage/memberInfoUpdate" method = "POST" id = "memberInfoUpdate" name = "memberInfoUpdate" enctype ="multipart/form-data">
        
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
                    <div class="profile-btn-area">
                        <label for="imageInput" id="imagesChoice">이미지 선택</label>
                        <input type="file" name="profileImage" id="imageInput" accept="image/*">
                    </div>
                </div>

                <!-- 이메일, 이름, 닉네임, 전화번호, 주소 -->
                <div class="info">
                    이름<div> <input type="text" id="name"  name="name" value="${loginMember.memberName}"></div><br>

                    닉네임 <div><input type="text" id="nickName" name="nickName"  value="${loginMember.memberNickname}"></div><br>

                    전화번호<div> <input type="text" id="phone" name="phone" maxlength="11" value="${loginMember.memberTel}"></div><br>
                    
                    주소

                    <c:set var = "addr" value =  "${fn:split(loginMember.memberAddress, '^^^')}"/>
                    <div class="address">
                        <input type="text" name="address"  maxlength="6" id="sample6_postcode"
                            value= "${addr[0]}">
                        <div>
                            <button type="button" onclick="sample6_execDaumPostcode()" id="addressBtn">검색</button>
                        </div>
                    </div>

                    <div class="address">
                        <input type="text" name="address"  id="sample6_address" value="${addr[1]}">
                    </div>


                    <div class="address">
                        <input type="text" name="address"  id="sample6_detailAddress" value="${addr[2]}">
                    </div>
                </div>
            </div>
            <!-- 수정완료 버튼 -->
            <div class="updateBtn">
                <button id="backBtn" class="infoUpdateBtn">돌아가기</button>
                <button id="updateBtn" class="infoUpdateBtn">수정하기</button>
            </div>
        </form>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

    <script src="/resources/js/myPage/memberInfoUpdate.js"></script>




</body>

</html>