/* const chattingPet = document.getElementById("chattingStart").getAttribute("petsitterNo");
const chattingMember = document.getElementById("chattingStart").getAttribute("petsitterNo");

let petsitter = chattingPet;
let member = chattingMember; */

let chatNo; // 선택한 채팅방 번호
let targetNo; // 현재 채팅 대상
let targetName; // 대상의 이름
let targetProfile; // 대상의 프로필

// 채팅방 입장 또는 선택 함수
document.getElementById("start").addEventListener("click", e => {//시작 버튼 누르면

   fetch("/chatting/target2")
      .then(resp => resp.json())
      .then(targetList => {
         document.getElementById("chattingInfo").innerHTML = "";

         for (let target of targetList) {
            const h3 = document.createElement("h3");
            const h31 = document.createElement("h3");
            h3.setAttribute("id", "chattingStart")
            h3.setAttribute("data-id", target.memberNo);
            h3.innerText = "채팅시작";
            // h31.setAttribute("id", "lastMessage")
            // h31.innerText = "전체 메세지보기";



            document.getElementById("chattingInfo").append(h3, h31);

            h3.addEventListener('click', chattingEnter);


         }

      })
      .catch(err => console.log(err));


})

function chattingEnter(e) {

   const targetNo = e.currentTarget.getAttribute("data-id");

   fetch("/chatting/enter2?targetNo=" + targetNo)
      .then(resp => resp.text())
      .then(chatNo => {

         console.log(chatNo);


         targets();
         document.getElementById("chattingStart").removeEventListener("click", chattingEnter);
         document.getElementById("chattingStart").style.cursor = "default";

      })
      .catch(err => console.log(err));


}

function targets() {

   fetch("/chatting/target")
      .then(resp => resp.json())
      .then(target => {
         console.log(target);

         for (let t of target) {
            const div = document.createElement("div");
            div.setAttribute("id", "div")
            div.setAttribute("chat-no", t.chatNo);
            div.setAttribute("target-no", t.targetNo);

            const img = document.createElement("img");

            if (t.targetProfile == undefined)
               img.setAttribute("src", "/resources/images/member/user.png");
            else
               img.setAttribute("src", t.targetProfile);

            const span1 = document.createElement("span");
            span1.innerText = t.targetNickName

            const p1 = document.createElement("p");
            p1.innerHTML = "마지막메세지<br>"

            const span2 = document.createElement("span");

            if (t.lastMessage != undefined) {
               span2.innerHTML = t.lastMessage;
            } else span2.innerText = "메세지가 없습니다!"

            p1.append(span2);

            const p2 = document.createElement("p");
            p2.innerHTML = "마지막대화시간<br>"

            const span3 = document.createElement("span");
            if (t.sendTime != undefined) {
               span3.innerHTML = t.sendTime;
            } else span3.innerText = "-"

            p2.append(span3);

            div.append(img, span1, p1, p2)

            document.getElementById("chattingInfo").append(div);

            chatNo = t.chatNo;
            targetNo = t.targetNo;
            targetName = t.targetNickName;
            targetProfile = t.targetProfile;

            /* document.getElementById("lastMessage").addEventListener("click", () => {
               selectChattingFn();
            }) */
            selectChattingFn();

            // 상대방이 현재 채팅방을 보고있으면
            if (t.chatNo == chatNo) {
               // readFlag "Y"(읽음) 으로 변경 비동기.
               fetch("/chatting/updateReadFlag2", {
                  method: "PUT",
                  headers: { "Content-Type": "application/json" },
                  body: JSON.stringify({ "chatNo": chatNo, "memberNo": loginMemberNo })
               })
                  .then(resp => resp.text())
                  .then(result => {
                     console.log(result)
                  })
                  .catch(err => console.log(err));

            }

         }

      })
      .catch(err => console.log(err));
}


// 채팅 메세지 영역
const display = document.getElementsByClassName("display-chatting")[0];

// 비동기로 메세지 목록을 조회하는 함수
function selectChattingFn() {
   fetch("/chatting/selectMessage2?" + `chatNo=${chatNo}&memberNo=${loginMemberNo}`)
      .then(resp => resp.json())
      .then(messageList => {
         console.log(messageList);

         // <ul class="display-chatting">
         const ul = document.querySelector(".display-chatting");

         ul.innerHTML = ""; // 이전 내용 지우기

         // 메세지 만들어서 출력하기
         for (let msg of messageList) {
            //<li>,  <li class="my-chat">
            const li = document.createElement("li");

            // 보낸 시간
            const span = document.createElement("span");
            span.classList.add("chatDate");
            span.innerText = msg.sendTime;

            // 메세지 내용
            const p = document.createElement("p");
            p.classList.add("chat");
            p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML
            // 내가 작성한 메세지인 경우
            if (loginMemberNo == msg.senderNo) {
               li.classList.add("my-chat");

               const readFlag = document.createElement("span");

               if (msg.readFlag == 'Y') {

                  readFlag.innerText = "읽음";

               }

               li.append(readFlag, span, p);

            } else { // 상대가 작성한 메세지인 경우
               li.classList.add("target-chat");

               // 상대 프로필
               // <img src="/resources/images/user.png">
               const img = document.createElement("img");
               if (targetProfile == null) img.setAttribute("src", "/resources/images/member/user.png");
               else img.setAttribute("src", targetProfile);

               const div = document.createElement("div");

               // 상대 이름
               const b = document.createElement("b");
               b.innerText = targetName; // 전역변수

               const br = document.createElement("br");

               div.append(b, br, p, span);
               li.append(img, div);

            }

            ul.append(li);
            display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로
         }

      })
      .catch(err => console.log(err));


}

// sockjs를 이용한 WebSocket 구현

// 로그인이 되어 있을 경우에만
// /chattingSock 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
let chattingSock;

if (loginMemberNo != "") {
   chattingSock = new SockJS("/chattingSock");
}


// 채팅 입력
const send = document.getElementById("send");


const sendMessage = () => {
   const inputChatting = document.getElementById("inputChatting");


   if (inputChatting.value.trim().length == 0) {
      alert("채팅을 입력해주세요.");
      inputChatting.value = "";
   } else {
      var obj = {
         "senderNo": loginMemberNo,
         "targetNo": targetNo,
         "chatNo": chatNo,
         "messageContent": inputChatting.value,
      };
      console.log(obj)

      // JSON.stringify() : 자바스크립트 객체를 JSON 문자열로 변환
      chattingSock.send(JSON.stringify(obj));

      inputChatting.value = "";
   }
}

// 엔터 == 제출
// 쉬프트 + 엔터 == 줄바꿈
inputChatting.addEventListener("keyup", e => {
   if (e.key == "Enter") {
      if (!e.shiftKey) {
         sendMessage();
      }
   }
})



// WebSocket 객체 chattingSock이 서버로 부터 메세지를 통지 받으면 자동으로 실행될 콜백 함수
chattingSock.onmessage = function (e) {
   // 메소드를 통해 전달받은 객체값을 JSON객체로 변환해서 obj 변수에 저장.
   const msg = JSON.parse(e.data);
   console.log(msg);


   // 현재 채팅방을 보고있는 경우
   const ul = document.querySelector(".display-chatting");

   // 메세지 만들어서 출력하기
   //<li>,  <li class="my-chat">
   const li = document.createElement("li");

   // 보낸 시간
   const span = document.createElement("span");
   span.classList.add("chatDate");
   span.innerText = msg.sendTime;

   // 메세지 내용
   const p = document.createElement("p");
   p.classList.add("chat");
   p.innerHTML = msg.messageContent; // br태그 해석을 위해 innerHTML

   // 내가 작성한 메세지인 경우
   if (loginMemberNo == msg.senderNo) {
      li.classList.add("my-chat");

      li.append(span, p);

   } else { // 상대가 작성한 메세지인 경우
      li.classList.add("target-chat");

      // 상대 프로필
      // <img src="/resources/images/user.png">
      const img = document.createElement("img");
      if (targetProfile == null) img.setAttribute("src", "/resources/images/member/user.png");
      else img.setAttribute("src", targetProfile);


      const div = document.createElement("div");

      // 상대 이름
      const b = document.createElement("b");
      b.innerText = targetName; // 전역변수

      const br = document.createElement("br");

      div.append(b, br, p, span);
      li.append(img, div);

   }

   ul.append(li)
   display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로

   selectChattingFn();

}

// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", () => {

   // 보내기 버튼에 이벤트 추가
   send.addEventListener("click", sendMessage);
});
