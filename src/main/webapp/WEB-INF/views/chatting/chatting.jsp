<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- 채팅 -->
        <section class="chatting-content" id="right">
            <ul id="display-chatting">
                <%-- notReadCount를 카톡처럼 1있다가 사라지게?! --%>
                <li class="my-chat">
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
                </li>
            </ul>
            <div id="input-area">
                <textarea id="inputChatting" placeholder="펫시터에게 전달할 내용이 있다면 남겨보세요."></textarea>
                <button id="send">보내기</button>
            </div>
        </section>

        <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
   
    <!-- https://github.com/sockjs/sockjs-client -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        // 로그인한 회원 번호
        const loginMemberNo = "${loginMember.memberNo}";
    </script>
