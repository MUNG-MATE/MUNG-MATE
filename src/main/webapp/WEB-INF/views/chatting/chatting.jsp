<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/chatting/chatting.css">
    <title>MUNG MATE</title>
</head>
<body>
   <%-- live.jsp 의 시작버튼 누르면 비동기로 채팅창! --%>

<!-- 채팅 -->

                          reservation == ${reservation} <br>
                          chattingList == ${chattingList}
        <section class="chatting-content" id="right">
        <%-- <button onclick="selectChattingFn()">버튼</button> --%>

        <ul id="display-chatting" class="display-chatting" >
            <li onclick="selectChattingFn()" id="chattingStart" >채팅시작하기</li>
            <%-- <li class="result-row" data-id="1">
               <img class="result-row-img" src="/resources/images/user.png">
               <span> <mark>유저</mark>일</span>
            </li> --%>
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
        </section>

        <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
   
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src=></script>
    <script>
        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";

        let chatNo = "${reservation[0].rsNo}";

        let selectTargetNo = "${chattingList[0].targetNo}";

        let selectTargetProfile = "${chattingList[0].targetProfile}"; // 대상의 프로필

        let selectTargetName = "${chattingList[0].targetNickName}"; // 대상의 이름


    </script>
    <script src="/resources/js/chatting/chatting.js"></script>
</body>
</html>