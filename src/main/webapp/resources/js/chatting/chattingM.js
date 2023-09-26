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
document.getElementById("start").addEventListener("click",e =>{

   fetch("/chatting/target")
   .then(resp => resp.json())
   .then(targetList =>{

      document.getElementById("chattingInfo").innerHTML = "";

      for(let target of targetList){
         
         const h3 = document.createElement("h3");
         h3.setAttribute("id","chattingStart")
         h3.setAttribute("data-id",target.memberNo);
         h3.innerText="채팅시작";

         const img = document.createElement("img");
         img.setAttribute("data-id",target.memberNo);

         if(target.profileImage == null) img.setAttribute("src", "/resources/images/user.png ")
         else img.setAttribute("src",target.profileImage);

         const span1 = document.createElement("span");
         const span2 = document.createElement("span");
         
         span1.setAttribute("data-id",target.memberNo);
         span2.setAttribute("data-id",target.memberNo);

         span1.innerText = target.memberName+ "펫시터"
         span2.innerText = target.memberTel;

         document.getElementById("chattingInfo").append(h3,img,span1,span2);

         h3.addEventListener('click',chattingEnter);
      }
   })
   .catch(err => console.log(err) );

})
   
function chattingEnter(e){
   console.log(e.target)
   console.log(e.currentTarget);
   const targetNo = e.currentTarget.getAttribute("data-id");

   fetch("/chatting/enter?targetNo="+targetNo)
   .then(resp => resp.text())
   .then(chattingNo => {
      console.log(chattingNo);
      alert("여기까지와라")
      
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

function selectRoomList(){

   fetch("/chatting/petsitter")
   .then(resp => resp.json())
   .then(roomList => {
      console.log(roomList);

      // 채팅방 목록 지우기
      chattingList.innerHTML = "";

      // 조회한 채팅방 목록을 화면에 추가
      for(let room of roomList){
         const li = document.createElement("li");
         li.classList.add("chatting-item");
         li.setAttribute("chat-no", room.chattingNo);
         li.setAttribute("target-no", room.targetNo);

         if(room.chattingNo == selectChattingNo){
            li.classList.add("select");
         }

         // item-header 부분
         const itemHeader = document.createElement("div");
         itemHeader.classList.add("item-header");

         const listProfile = document.createElement("img");
         listProfile.classList.add("list-profile");

         if(room.targetProfile == undefined)   
            listProfile.setAttribute("src", "/resources/images/user.png");
         else                        
            listProfile.setAttribute("src", room.targetProfile);

         itemHeader.append(listProfile);

         // item-body 부분
         const itemBody = document.createElement("div");
         itemBody.classList.add("item-body");

         const p = document.createElement("p");

         const targetName = document.createElement("span");
         targetName.classList.add("target-name");
         targetName.innerText = room.targetNickName;
         
         const recentSendTime = document.createElement("span");
         recentSendTime.classList.add("recent-send-time");
         recentSendTime.innerText = room.sendTime;
         
         
         p.append(targetName, recentSendTime);
         
         
         const div = document.createElement("div");
         
         const recentMessage = document.createElement("p");
         recentMessage.classList.add("recent-message");

         if(room.lastMessage != undefined){
            recentMessage.innerHTML = room.lastMessage;
         }
         
         div.append(recentMessage);

         itemBody.append(p,div);

         // 현재 채팅방을 보고있는게 아니고 읽지 않은 개수가 0개 이상인 경우 -> 읽지 않은 메세지 개수 출력
         if(room.notReadCount > 0 && room.chattingNo != selectChattingNo ){
         // if(room.chattingNo != selectChattingNo ){
            const notReadCount = document.createElement("p");
            notReadCount.classList.add("not-read-count");
            notReadCount.innerText = room.notReadCount;
            div.append(notReadCount);
         }else{

            fetch("/chatting/updateReadFlag",{
               method : "PUT",
               headers : {"Content-Type": "application/json"},
               body : JSON.stringify({"chattingNo" : selectChattingNo, "memberNo" : loginMemberNo})
            })
            .then(resp => resp.text())
            .then(result => console.log(result))
            .catch(err => console.log(err));

         }
         li.append(itemHeader, itemBody);
         chattingList.append(li);
      }

      roomListAddEvent();
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