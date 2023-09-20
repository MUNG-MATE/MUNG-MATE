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
    <div id="liveText">펫시팅 실시간 LIVE</div>
    <button type = "button" onclick = "runTime(), startTime()">시작</button>

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
                        <span>김광수</span>
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
                        <div class="stateText ing" id ="runTime">00 : 00 : 00</div>
                    </div>

                    <div>
                        <div class="stateText">산책 종료</div>
                        <div class="stateText">-</div>
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
                    <img src="/resources/images/myPage/petsitter.png">
                    <div>
                        <b>펫시터</b> <br>
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

    <script>
        const petsitterFlag = "${loginMember.petsitterFlag}";
    </script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e99da29f2b6829aa0cab8a9aa4d50a98"></script>
    <script src="/resources/js/live/live.js"></script>
</body>
</html>