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
    <link rel="stylesheet" href="petsittingLive.css">
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

                <div id="stateTextArea">
                    <div>
                        <div class="stateText">산책 시작</div>
                        <div class="stateText">${liveCard.startTime}</div>
                    </div>

                    <div>
                        <div class="stateText ing">산책 중</div>
                        <div class="stateText ing">00:00:30</div>
                    </div>

                    <div>
                        <div class="stateText">산책 종료</div>
                        <div class="stateText">${liveCard.endTime}</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 채팅 -->
        <section id="right">
            <ul id="chattingArea">
                <li class="myChat">
                    <span class="chatDate">09.04 16:00</span>
                    <p class="chat">떵 치워주세여</p>
                </li>
                <li class="opponentChat">
                    <img src="${reservation.petSitterList[0].profileImg}">
                    <div>
                        <b>${reservation.petSitterList[0].memberNm}</b> <br>
                        <p class="chat">알겠습니다 고갱님</p>
                        <span class="chatDate">09.04 16:01</span>
                    </div>
                </li>
            </ul>
            <div id="inputArea">
                <textarea id="inputChatting" placeholder="펫시터에게 전달할 내용이 있다면 남겨보세요."></textarea>
                <button id="sendMsg">보내기</button>
            </div>
        </section>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e99da29f2b6829aa0cab8a9aa4d50a98"></script>
    <script src="petsittingLive.js"></script>
    <script src="liveCard.js"></script>
</body>
</html>