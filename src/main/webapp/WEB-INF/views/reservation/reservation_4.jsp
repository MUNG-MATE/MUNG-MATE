<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_4.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
<body>
	<h1 id="resTitle">예약 서비스[3/3]</h1>
    <h4 id="resSubTitle">펫시터를 선택해주세요.</h4>
    <h2>펫시터 프로필</h2>
    <form action="4" method="post">

        <section id="container">

            <c:forEach var="i" items="${rs.petSitterList}">
                <div class="profileArea" id="${i.petSitterNo}" onclick="selectPetSitterNo('${i.petSitterNo}')">
                    <div class="imageArea">
                        <c:if test="${!empty i.profileImg}" >
                        <img src=${i.profileImg} class="profileImage">
                        </c:if>
                        <c:if test="${empty i.profileImg}" >
                         <img src= "/resources/images/member/petsitterNo.jpg" class="profileImage">
                        </c:if>
                    </div>
                    <div class="info">
                        <div class="petsitterName">${i.memberNm} 펫시터</div>
                    </div>
                    <div>
                        <p class="history" name="location">선호 지역 : ${i.location}</p>
                        <p class="history" name="memberTel">전화번호 : ${i.memberTel}</p>
                        <p class="history" name="memberEmail">이메일 : ${i.memberEmail}</p>

                    </div>
                </div>
            </c:forEach>
            
        </section>
        
        <div id="btnArea">
            <button type="button" class="btnStyle prev" onclick="history.go(-2)">&lt 이전</button>
            <button id="nextBtn" class="btnStyle next">다음 &gt</button>
        </div>
        
        <input type="hidden" name="servicePrice" id="selectMoney" value="${rs.servicePrice}" >
        <input type="hidden" name="serviceTime" id="selectTime" value="${rs.serviceTime}">
        <input type="hidden" name="serviceType" id="selectedService" value="${rs.serviceType}">
        <input type="hidden" name="rsDate" value="${rs.rsDate}">
        <input type="hidden" name="rsStartDate" value="${rs.rsStartDate}">
        <input type="hidden" name="serviceNo" id="serviceNo" value="${rs.serviceNo}">
        <input type="hidden" name="rsAddress" value="${rs.rsAddress}">
        
        
        <input type="hidden" name="petSitterNo" id="selectPetSitterNo">
    

        

        
            
        </form>
        
    <script>

        const petSitterNo = "${rs.petSitterNo}";
    </script>
        <script src="/resources/js/reservation/reservation_4.js"></script>



	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>