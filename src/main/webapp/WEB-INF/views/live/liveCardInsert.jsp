<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="small-logo.png">
    <link rel="stylesheet" href="/resources/css/live/insertLiveCard.css">
    <link rel="stylesheet" href="/resources/css/live/petsittingLive.css">
    <title>MUNG MATE</title>
</head>

<jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

<body>
    <section id="liveCardSection">
        <div id="titleArea">
            <img src="${param.profileImg}" class="profile">
            <span>${param.memberNm} 펫시터 님의 산책 LIVE 카드</span>
        </div>
        
        <form method="POST" action="insert?rsNo=${param.rsNo}" enctype="multipart/form-data" id="insertForm">
            <div id="serviceName">
                <div>시작 시간</div>
                <div id="startTime" name="startTime"></div>
                <div>종료 시간</div>
                <div id="endTime" name="endTime"></div>
                <input type="hidden" id="inputStartTime" name="startTime">
                <input type="hidden" id="inputEndTime" name="endTime">
            </div>
        
            <div id="liveCardContent">
                <label id="imgLabel">
                    <input type="file" id="inputImage" name="inputImage" for="imageLabel"/>
                    <img id="petImage" src="/resources/images/reservation/inputpetimage.png">
                </label>
                <textarea id="inputContent" name="liveContent"></textarea>
                <div id="btnArea">
                    <button class="btnStyle">등록</button>
                </div>
            </div>
        </form>
    </section>

    <div id="liveText">펫시팅 LIVE 다시보기</div>

    <!-- 지도 -->
    <section id="section">
        <section id="left">
            <div id="map"></div>
            <div id="stateArea">
                <div id="profileDiv">
                    <div>
                        <img src="${param.profileImg}" class="profile">
                    </div>
                    <div>
                        <span>${param.memberNm}</span>
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
                        <div class="stateText">오후 03:00</div>
                    </div>

                    <div>
                        <div class="stateText ing">산책 중</div>
                        <div class="stateText ing">00:00:30</div>
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
                    <img src="${param.profileImg}">
                    <div>
                        <b>${param.memberNm} 펫시터</b> <br>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/live/petsittingLive.js"></script>
    <script src="/resources/js/live/insertLiveCard.js"></script>
</body>
</html>