<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사 소개 및 펫시터 소개</title>
    <link rel = "stylesheet" href="/resources/css/info.css">
</head>

<body>
    <!-- 헤더 -->
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <!-- 컨텐츠 -->
    <div class="content">

        <!-- 멍메이트 -->
        <div class="mungMate"><h1>Mung Mate</h1></div>

        <!-- 사진 -->
        <div class="picture"><img src = "../../resources/images/infoImage.jpg"></div>

        <!-- 소개글 -->
        <div class="PetSitterIntroduction">
            <pre>
Mung Mate는 동물들을 하나의 생명체로서 존중을 바탕으로


아끼고 사랑하는 마음을 담아 만들어지게 되었습니다.


보호자님이 잠시 집을 떠나있을 때 반려동물 곁에 머물며 보호자님의 빈자리를 채워주고,


반려동물에게 행복한 하루를 선물하기 위해 열심히 공부하고,  


최대한 좋은 환경을 위해 노력합니다.


반려동물을 바라볼 때 단지 귀엽고 예뻐서가 아닌


반려동물들과 함께 인생을 반려하며 살아가길 원하는,


한 생명을 향한 무거운 책임감으로 뭉친 


Mung Mate가 함께하겠습니다. 



Mung Mate 개발자 일동
            </pre>
            
        </div>
        <!-- 펫시터 소개 -->
        <h1>Mung Mate의 펫시터를 소개합니다.</h1>
        <div class="PetsitterInformation">
            

            <c:forEach var="i" items="${petSitterList}">
                <div class="profileArea" id="profileArea">
                    <div class="imageArea">
                        <c:if test="${!empty i.profileImg}" >
                        <img src=${i.profileImg} class="profileImage">
                        </c:if>
                        <c:if test="${empty i.profileImg}" >
                         <img src= "/resources/images/user.png" class="profileImage">
                        </c:if>
                    </div>
                    <div class="info">
                        <div class="petsitterName">${i.memberNm} 펫시터</div>
                    </div>
                    <div>
                        <p class="history" name="location">선호 지역 : ${i.location}</p>
                        <p class="history" name="memberTel">전화번호 : ${i.memberTel}</p>
                        <p class="history" name="memberEmail">이메일 : ${i.memberEmail}</p>
                        
                        <button type="button" class="wishListBtn">찜콩</button>
                        
                        <input type="hidden" value="${i.petSitterNo}" class="petSitterNo">
                    </div>
                </div>
            </c:forEach>
            

        </div>
    </div>

    <script>

        const memberNo = "${loginMember.memberNo}";
        // const loginMember = ${loginMember};
        
    </script>

    
    <script src="/resources/js/info.js"></script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</html>