
// 댓글 목록 조회
function selectReplyList(){

    // REST(REpresentational State Transfer) API
    // - 자원을 이름으로 구분(Representational)하여
    //   자원의 상태(State)를 주고 받는 것(Transfer)
    
    // -> 주소를 명시하고
    // Http method(GET, POST, PUT, DELETE)를 이용해
    // 지정된 자원에 대한 CRUD 진행

    // Create   : 생성, 삽입  (POST)
    // Read     : 조회       (GET)
    // Update   : 수정       (PUT, PETCH)
    // Delete   : 삭제       (DELETE)

    // 기본적으로 form태그는 GET/POST만 지원

    fetch("/reply?boardNo=" + boardNo) // * GET 방식은 "주소에 파라미터를 담아서 전달"한다
    .then(response => response.json()) // 응답객체 파싱작업
    .then(cList => { // cList : 댓글 목록(객체 배열 형태)
        console.log(cList);

        // 화면에 출력되어 있는 댓글 목록 삭제
        const replyList = document.getElementById("replyList"); // ul태그
        replyList.innerText = "";

        // cList에 저장된 요소를 하나씩 접근
        for(let reply of cList){

            // 행
            const replyRow = document.createElement("li");
            replyRow.classList.add("reply-row");

            // 답글일 경우 child-reply 클래스 추가
            if(reply.parentNo != 0)  replyRow.classList.add("child-reply");


            // 작성자
            const replyWriter = document.createElement("p");
            replyWriter.classList.add("reply-writer");

            // 프로필 이미지
            const profileImage = document.createElement("img");

            if( reply.profileImage != null ){ // 프로필 이미지가 있을 경우
                profileImage.setAttribute("src", reply.profileImage);
            }else{ // 없을 경우 == 기본이미지
                profileImage.setAttribute("src", "/resources/images/user.png");
            }

            // 작성자 닉네임
            const memberNickname = document.createElement("span");
            memberNickname.innerText = reply.memberNickname;
            
            // 작성일
            const replyDate = document.createElement("span");
            replyDate.classList.add("reply-date");
            replyDate.innerText =  "(" + reply.replyCreateDate + ")";

            // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
            replyWriter.append(profileImage , memberNickname , replyDate);

            

            // 댓글 내용
            const replyContent = document.createElement("p");
            replyContent.classList.add("reply-content");
            replyContent.innerText = reply.replyContent;

            // 행에 작성자, 내용 추가
            replyRow.append(replyWriter, replyContent);

            
            // 로그인이 되어있는 경우 답글 버튼 추가
            if(loginMemberNo != ""){
                // 버튼 영역
                const replyBtnArea = document.createElement("div");
                replyBtnArea.classList.add("reply-btn-area");

                // 답글 버튼
                const childReplyBtn = document.createElement("button");
                childReplyBtn.setAttribute("onclick", "showInsertReply("+reply.replyNo+", this)");
                childReplyBtn.innerText = "답글";

                // 버튼 영역에 답글 버튼 추가
                replyBtnArea.append(childReplyBtn);

                // 로그인한 회원번호와 댓글 작성자의 회원번호가 같을 때만 버튼 추가
                if( loginMemberNo == reply.memberNo   ){

                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.innerText = "수정";

                    // 수정 버튼에 onclick 이벤트 속성 추가
                    updateBtn.setAttribute("onclick", "showUpdateReply("+reply.replyNo+", this)");                        


                    // 삭제 버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.innerText = "삭제";
                    // 삭제 버튼에 onclick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteReply("+reply.replyNo+")");                       


                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    replyBtnArea.append(updateBtn, deleteBtn);

                } // if 끝
                

                // 행에 버튼영역 추가
                replyRow.append(replyBtnArea); 
            }
            

            // 댓글 목록(ul)에 행(li)추가
            replyList.append(replyRow);
        }


    })
    .catch(err => console.log(err));

}


//-------------------------------------------------------------------------------------------------


// 댓글 등록
const addReply = document.getElementById("addReply");
const replyContent = document.getElementById("replyContent");

addReply.addEventListener("click", e => { // 댓글 등록 버튼이 클릭이 되었을 때

    // 1) 로그인이 되어있나? -> 전역변수 memberNo 이용
    if(loginMemberNo == ""){ // 로그인 X
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(replyContent.value.trim().length == 0){ // 미작성인 경우
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        replyContent.value = ""; // 띄어쓰기, 개행문자 제거
        replyContent.focus();
        return;
    }

    // 3) AJAX를 이용해서 댓글 내용 DB에 저장(INSERT)
    const data = {"replyContent" : replyContent.value,
                    "memberNo" : loginMemberNo,
                    "boardNo" : boardNo} // JS 객체 (k:v)형태

    fetch("/reply", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data) // JS객체 -> JSON 파싱
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){ // 등록 성공
            alert("댓글이 등록되었습니다.");

            replyContent.value = ""; // 작성했던 댓글 삭제

            selectReplyList(); // 비동기 댓글 목록 조회 함수 호출
            // -> 새로운 댓글이 추가되어짐

        } else { // 실패
            alert("댓글 등록에 실패했습니다...");
        }
    })
    .catch(err => console.log(err));
});


// -----------------------------------------------------------------------------------
// 댓글 삭제
function deleteReply(replyNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        fetch("/reply",{
            method: "DELETE",
            headers: {"Content-Type" : "application/json"},
            body : replyNo // 값 하나만 보낼시에는 JSON 필요 없다!!
        })
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                alert("삭제되었습니다");
                selectReplyList(); // 목록을 다시 조회해서 삭제된 글을 제거
            }else{
                alert("삭제 실패");
            }
        })
        .catch(err => console.log(err));

    }
}




// ------------------------------------------------------------------------------------------
// 댓글 수정 화면 전환 

let beforeReplyRow; // 수정 전 원래 행의 상태를 저장할 변수


function showUpdateReply(replyNo, btn){
                     // 댓글번호, 이벤트발생요소(수정버튼)

    // ** 댓글 수정이 한 개만 열릴 수 있도록 만들기 **
    // 댓글 수정을 위한 textarea를 모두 얻어옴 -> 수정이 활성화 되어 있을 경우 1개, 없으면 0개
    const temp = document.getElementsByClassName("update-textarea");  

    if(temp.length > 0){ // 수정이 한 개 이상 열려 있는 경우

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){ // 확인

            temp[0].parentElement.innerText = beforeReplyRow;
            // reply-row                       // 백업한 댓글
            // 백업 내용으로 덮어 씌워 지면서 textarea 사라짐
       
        }else{ // 취소
            return;
        }
    }


    // 1. 댓글 수정이 클릭된 행을 선택
    const replyRow = btn.parentElement.parentElement; // 수정 버튼의 부모의 부모

    // 2. 행 내용 삭제 전 현재 상태를 저장(백업) (문자열)
    //    (전역변수 이용)
    beforeReplyRow = replyRow.innerText;


    // 3. 댓글에 작성되어 있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정
    
    let beforeContent = replyRow.children[1].innerText;

    // 이것도 가능!
    //let beforeContent = btn.parentElement.previousElementSibling.innerText;


    // 4. 댓글 행 내부 내용을 모두 삭제
    replyRow.innerText = "";

    // 5. textarea 요소 생성 + 클래스 추가  +  **내용 추가**
    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");

    // ******************************************
    // XSS 방지 처리 해제
    beforeContent =  beforeContent.replaceAll("&amp;", "&");
    beforeContent =  beforeContent.replaceAll("&lt;", "<");
    beforeContent =  beforeContent.replaceAll("&gt;", ">");
    beforeContent =  beforeContent.replaceAll("&quot;", "\"");
    
    // ******************************************
    textarea.value = beforeContent; // 내용 추가

    // 6. replyRow에 생성된 textarea 추가
    replyRow.append(textarea);


    // 7. 버튼 영역 + 수정/취소 버튼 생성
    const replyBtnArea = document.createElement("div");
    replyBtnArea.classList.add("reply-btn-area");
    

    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", "updateReply("+replyNo+", this)");


    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", "updateCancel(this)");


    // 8. 버튼영역에 버튼 추가 후 
    //    replyRow(행)에 버튼영역 추가
    replyBtnArea.append(updateBtn, cancelBtn);
    replyRow.append(replyBtnArea);

}


// -----------------------------------------------------------------------------------
// 댓글 수정 취소
function updateCancel(btn){
    // 매개변수 btn : 클릭된 취소 버튼
    // 전역변수 beforeReplyRow : 수정 전 원래 행(댓글)을 저장한 변수

    if(confirm("댓글 수정을 취소하시겠습니까?")){
        selectReplyList();
    }
}

// -----------------------------------------------------------------------------------
// 댓글 수정(AJAX)
function updateReply(replyNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const replyContent = btn.parentElement.previousElementSibling.value;

    const data = {"replyContent" : replyContent,
                    "replyNo" : replyNo}

    fetch("/reply",{
        method: "PUT",
        headers: {"content-type" : "application/json"},
        body: JSON.stringify(data)
    })
    .then(resp=> resp.text())
    .then(result => {
        if(result > 0){
            alert("댓글이 수정되었습니다.");
            selectReplyList();
        }else{
            alert("댓글 수정 실패");
        }
    })
    .catch(err => console.log(err));

}

// -------------------------------------------------------------------------------
// -------------------------------------------------------------------------------

// 답글 작성 화면 추가 
// -> 답글 작성 화면은 전체 화면에 1개만 존재 해야한다!

function showInsertReply(parentNo, btn){
                        // 부모 댓글 번호, 클릭한 답글 버튼


    // ** 답글 작성 textarea가 한 개만 열릴 수 있도록 만들기 **
    const temp = document.getElementsByClassName("replyInsertContent");

    if(temp.length > 0){ // 답글 작성 textara가 이미 화면에 존재하는 경우

        if(confirm("다른 답글을 작성 중입니다. 현재 댓글에 답글을 작성 하시겠습니까?")){
            temp[0].nextElementSibling.remove(); // 버튼 영역부터 삭제
            temp[0].remove(); // textara 삭제 (기준점은 마지막에 삭제해야 된다!)
        
        } else{
            return; // 함수를 종료시켜 답글이 생성되지 않게함.
        }
    }
    
    // 답글을 작성할 textarea 요소 생성
    const textarea = document.createElement("textarea");
    textarea.classList.add("replyInsertContent");
    
    // 답글 버튼의 부모의 뒤쪽에 textarea 추가
    // after(요소) : 뒤쪽에 추가
    btn.parentElement.after(textarea);


    // 답글 버튼 영역 + 등록/취소 버튼 생성 및 추가
    const replyBtnArea = document.createElement("div");
    replyBtnArea.classList.add("reply-btn-area");


    const insertBtn = document.createElement("button");
    insertBtn.innerText = "등록";
    insertBtn.setAttribute("onclick", "insertChildReply("+parentNo+", this)");


    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", "insertCancel(this)");

    // 답글 버튼 영역의 자식으로 등록/취소 버튼 추가
    replyBtnArea.append(insertBtn, cancelBtn);

    // 답글 버튼 영역을 화면에 추가된 textarea 뒤쪽에 추가
    textarea.after(replyBtnArea);

}


// 답글 취소
function insertCancel(btn){
                    // 취소
    btn.parentElement.previousElementSibling.remove(); // 취소의 부모의 이전 요소(textarea) 제거
    btn.parentElement.remove(); // 취소의 부모 요소(reply-btn-area) 제거
}


// 답글 등록
function insertChildReply(parentNo, btn){
                        // 부모 댓글 번호, 답글 등록 버튼

    // 누가?                loginMemberNo(로그인한 회원의 memberNo )(전역변수)
    // 어떤 내용?           textarea에 작성된 내용
    // 몇번 게시글?         현재 게시글 boardNo (전역변수)
    // 부모 댓글은 누구?    parentNo (매개변수)

    // 답글 내용
    const replyContent = btn.parentElement.previousElementSibling.value;

    // 답글 내용이 작성되지 않은 경우
    if(replyContent.trim().length == 0){
        alert("답글 작성 후 등록 버튼을 클릭해주세요.");
        btn.parentElement.previousElementSibling.value = "";
        btn.parentElement.previousElementSibling.focus();
        return;
    }

    const data = {"replyContent" : replyContent,
                    "memberNo" : loginMemberNo,
                    "boardNo" : boardNo,
                    "parentNo" : parentNo
                }
                

    fetch("/reply", {
        method: "POST",
        headers: {"Content-type" : "application/json"},
        body: JSON.stringify(data)
    })
    .then(response => response.text()) // "문자열 형태" 의 응답데이터 시에 response.text() !!
    .then(result => {
        if(result > 0){ // 등록 성공
            alert("답글이 등록되었습니다.");
            selectReplyList(); // 비동기 댓글 목록 조회 함수 호출

        } else { // 실패
            alert("답글 등록에 실패했습니다...");
        }
    })
    .catch(err => console.log(err));


}

