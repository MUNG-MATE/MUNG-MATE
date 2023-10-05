<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="small-logo.png">
    <link rel="stylesheet" href="/resources/css/myPage/liveCard.css">
    <title>MUNG MATE</title>
</head>

<jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

<body>
    <section id="liveCardSection">
        <div id="titleArea">
            <img src="${reservation.petSitterList[0].profileImg}" class="profile">
            <span>${reservation.petSitterList[0].memberNm} 펫시터 님의 산책 LIVE 카드</span>
        </div>

        <div id="serviceName">
            <div>산책 시작</div>
            <div>${liveCard.startTime}</div>
            <div>산책 종료</div>
            <div>${liveCard.endTime}</div>
        </div>
        <div id="liveCardContent">
            <img src="${liveCard.imageList[0].imagePath}${liveCard.imageList[0].imageReName}">
            <p>${liveCard.liveContent}</p>
        </div>
    </section>

    <div id="liveText">펫시팅 LIVE 다시보기</div>

    <!-- 지도 -->
    <section id="section">
        <section id="left">
            <div id="map"></div>
            <div id="stateArea">
                <div id="profileDiv">
                    <div>
                        <img src="${reservation.petSitterList[0].profileImg}" class="profile">
                    </div>
                    <div>
                        <span>${reservation.petSitterList[0].memberNm}</span>
                    </div>
                </div>
                
                <div id="petsitterText">
                    <span>"안전하고 즐거운 서비스를 위해 최선을 다하겠습니다."</span>
                </div>

                <div id="iconArea">
                    <c:if test="${reservation.serviceNo > 0 && reservation.serviceNo < 4}">
                        <img src="/resources/images/reservation/stroll.png" id="stateIcon">
                    </c:if>
                    <c:if test="${reservation.serviceNo > 3 && reservation.serviceNo < 7}">
                        <img src="/resources/images/reservation/care.png" id="stateIcon">
                    </c:if>
                </div>
            </div>
        </section>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e99da29f2b6829aa0cab8a9aa4d50a98"></script>
    <script src="/resources/js/myPage/liveCard.js"></script>
</body>
</html>