const toggleButtons = document.querySelectorAll('.td'); 

toggleButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        const faqAnswerRows = document.querySelectorAll('.faq-answer'); 

        // 현재 클릭한 버튼 다음의 답변 행을 토글하여 보이거나 숨깁니다.
        faqAnswerRows.forEach((row, rowIndex) => {
            if (rowIndex === index) {
                if (row.style.display === 'block' || row.style.display === '') {
                    row.style.display = 'none';
                } else {
                    row.style.display = 'block';
                }
            } else {
                row.style.display = 'none'; 
            }
        });
    });
});


// faq 삭제 함수
function faqDelete(boardNo){

    const resultTitle = document.getElementById("resultTitle");
    const resultContent = document.getElementById("resultContent");
    
    if(confirm("정말 삭제하시겠습니까?")){
        fetch("/Administrator/faqDelete", {
            method : "POST",
            headers : {"Content-Type" : "application/text"},
            body : boardNo
        })
        .then(resp => resp.text())
        .then(result => {
    
            if(result > 0){
                table.innerHTML = "";
                location.reload(true);
            }else{
                console.log("실패~");
            }
        })
        .catch(e => console.log(e))
    }
    return;
}


const faqFrm = document.getElementsByName("faqFrm")[0];
const boardTitle = document.getElementById("boardTitle");
const boardContent = document.getElementsByName("content")[0];

if(faqFrm != null){

    faqFrm.addEventListener("submit", e => {
    
        console.log("눌렀다")
    
        if(boardTitle.value.trim().length == 0){
            alert("제목을 입력해주세요");
            boardTitle.focus();
            e.preventDefault();
            return;
        }
    
        if(boardContent.value.trim().length == 0){
            alert("내용을 입력해주세요");
            boardContent.focus();
            e.preventDefault();
            return;
        }
    })
}




// notice 삭제 함수
function noticeDelete(){

    const resultTitle = document.getElementById("resultTitle");
    const resultContent = document.getElementById("resultContent");

    if(confirm("정말 삭제하시겠습니까?")){
        fetch("/Administrator/noticeDelete", {
            method : "POST",
            headers : {"Content-Type" : "application/text"},
            body : boardNo
        })
        .then(resp => resp.text())
        .then(result => {
    
            if(result > 0){
                table.innerHTML = "";
                location.reload(true);
            }else{
                console.log("실패~");
            }
        })
        .catch(e => console.log(e))
    }
    return;
}


const noticeFrm = document.getElementsByName("faqFrm")[0];

faqFrm.addEventListener("submit", e => {

    console.log("눌렀다")

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요");
        boardTitle.focus();
        e.preventDefault();
        return;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 입력해주세요");
        boardContent.focus();
        e.preventDefault();
        return;
    }
})



