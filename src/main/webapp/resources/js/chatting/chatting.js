// live.jsp 에서 시작버튼 누르면 onClick 해서 채팅방생성하는 함수 발동
// 해당 펫시터와 해당고객 1대1 채팅방. (선생님꺼 targetNo 를 petsitterNo or 고객 memberNo 로하면 될듯)
// so, 채팅상대목록(검색)은 필요 없음.

const chattingPet = document.getElementById("chattingStart").getAttribute("petsitterNo");
const chattingMember = document.getElementById("chattingStart").getAttribute("petsitterNo");

let petsitter = chattingPet;
let member = chattingMember;

let selectChattingNo; // 선택한 채팅방 번호
let selectTargetNo; // 현재 채팅 대상
let selectTargetName; // 대상의 이름
let selectTargetProfile; // 대상의 프로필


// 채팅방 입장 또는 선택 함수
   
   const li = document.getElementById("chattingStart")

   li.addEventListener('click',chattingEnter);
   
   function chattingEnter(e){
   
   const targetNo = e.currentTarget.getAttribute("petsitterNo");

   fetch("/chatting/enter?targetNo="+targetNo)
   .then(resp => resp.text())
   .then(chattingNo => {
      alert("여기까지와라")
      console.log(chattingNo);
      
      setTimeout(()=>{ 
         // 만약 채팅방 목록 중 이미 존재하는 채팅방이 있으면 클릭해서 입장
         const itemList = document.querySelectorAll(".chatting-item")
         for(let item of itemList) {      
            if(item.getAttribute("chat-no") == chattingNo){
               item.focus();
               item.click();
               addTargetPopupLayer.classList.toggle("popup-layer-close");
               targetInput.value = "";
               resultArea.innerHTML = "";
               return;
            }
         }

      }, 200);

   })
   .catch(err => console.log(err));
}


// 채팅 메세지 영역
const display = document.getElementsByClassName("display-chatting")[0];

// 비동기로 메세지 목록을 조회하는 함수
function selectChattingFn() {
   fetch("/chatting/selectMessage?" + `chatNo=${chatNo}&memberNo=${loginMemberNo}`)
      .then(resp => resp.json())
      .then(messageList => {
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

               li.append(span, p);

            } else { // 상대가 작성한 메세지인 경우
               li.classList.add("target-chat");

               // 상대 프로필
               // <img src="/resources/images/user.png">
               const img = document.createElement("img");
               img.setAttribute("src", selectTargetProfile);

               const div = document.createElement("div");

               // 상대 이름
               const b = document.createElement("b");
               b.innerText = selectTargetName; // 전역변수

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
         "targetNo": 2,
         "chatNo" : chatNo,
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
         img.setAttribute("src", selectTargetProfile);

         const div = document.createElement("div");

         // 상대 이름
         const b = document.createElement("b");
         b.innerText = selectTargetName; // 전역변수

         const br = document.createElement("br");

         div.append(b, br, p, span);
         li.append(img, div);

      }

      ul.append(li)
      display.scrollTop = display.scrollHeight; // 스크롤 제일 밑으로



}

// 문서 로딩 완료 후 수행할 기능
document.addEventListener("DOMContentLoaded", () => {

   /* // 채팅방 목록에 클릭 이벤트 추가
   roomListAddEvent(); */

   // 보내기 버튼에 이벤트 추가
   send.addEventListener("click", sendMessage);
});