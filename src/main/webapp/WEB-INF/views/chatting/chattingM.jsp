<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/chatting/chattingM.css">
    <title>MUNG MATE</title>
</head>
<body>
   <%-- live.jsp 의 시작버튼 누르면 비동기로 채팅창! --%>

<!-- 채팅 -->
        rere == ${reservation}
        <section class="chatting-content" id="right">
        <button id="start" onclick="selectChattingFn()">버튼</button>
        <div id="chattingBox">
            <div id="chattingInfo">
                <h3 id="chattingStart">채팅시작</h3>
                <img src="/resources/images/member/m.gif">
                <span>문광민 펫시터</span>
                <span>010-1234-1234</span>
            </div>
            <ul id="display-chatting" class="display-chatting" >
                    <%-- notReadCount를 카톡처럼 1있다가 사라지게?! --%>
                    <%-- <li class="my-chat">
                        <p class="not-read-count">${room.notReadCount}</p>
                        <span class="chatDate">09.04 16:00</span>
                        <p class="chat">떵 치워주세여</p>
                    </li>
                    <li class="target-chat">
                        <img src="/resources/images/myPage/petsitter.png">
                        <div>
                            <b>펫시터</b> <br>
                            <p class="chat">알겠습니다 고갱님</p>
                            <span class="chatDate">09.04 16:01</span>
                        </div>
                    </li> --%>
                </ul>
                <div id="input-area">
                    <textarea id="inputChatting" placeholder="펫시터에게 전달할 내용이 있다면 남겨보세요."></textarea>
                    <div>
                        <button id="send">보내기</button>
                    </div>
                </div>
        </div>
        </section>

        <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
   
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src=></script>
    <script>
        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
        const chatNo = "${reservation[0].rsNo}";
    </script>
    <script src="/resources/js/chatting/chattingM.js"></script>
</body>
</html>