<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="small-logo.png">
    <link rel="stylesheet" href="/resources/css/live/live.css">
    
    <title>MUNG MATE</title>
</head>
<body>
    <div id="liveText">
        펫시팅 실시간 LIVE
        <button id="closeBtn" class="btncss" type="button" onclick = "closeBtn()">&times;</button>
    </div>
    
    <!-- 지도 -->
    <section id="section">
        <section id="left">
            <div id="map"></div>
            <div id="stateArea">
                <div id="profileDiv">
                    <div>
                        <img src="/resources/images/myPage/petsitter.png" id="profile">
                    </div>
                    <div>
                        <span id="petSitterNm">김광수</span>
                    </div>
                </div>
                
                <div id="petsitterText">
                    <span>"안전하고 즐거운 서비스를 위해 최선을 다하겠습니다."</span>
                </div>

                <div id="iconArea">
                    <img src="/resources/images/reservation/stroll.png" id="stateIcon">
                </div>

                <div id="stateTextArea">
                    <div>
                        <div class="stateText">산책 시작</div>
                        <div class="stateText" id = "startTime"></div>
                    </div>

                    <div>
                        <div class="stateText ing">산책 중</div>
                        <div class="stateText ing" id ="elapsedTime"></div>
                    </div>

                    <div id="displayBtn">
                        <!-- 시작 중지 토글 (스위치라고 생각하셈) -->
                        <button type="button" id="startStopButton"></button>
                    </div>
                </div>
            </div>
        </section>

        <!-- 채팅 -->
        <jsp:include page="/WEB-INF/views/chatting/chattingM.jsp"/>

    </section>

    <script>
        const petsitterFlag = "${loginMember.petsitterFlag}";
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e99da29f2b6829aa0cab8a9aa4d50a98"></script>
    <script src="/resources/js/live/live.js"></script>
</body>

</html>