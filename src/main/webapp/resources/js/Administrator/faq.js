// 검색창 이전 검색 기록을 남겨놓기
const faqSearch = document.getElementById("faqSearch");
const searchKey = document.getElementById("faqCat");
const searchQuery = document.getElementById("faq");

const options = document.querySelectorAll("#faqCat > option");

(()=>{
    const params = new URL(location.href).searchParams;

    const key = params.get("faqCat"); // 옵션
    const query = params.get("faq"); // 검색어
    if(key != null){ //검색을 했을때
        searchQuery.value = query; // 검색어를 화면에 출력
        
        // option태그를 하나씩 순차 접근해서 value가 key랑 같으면
        // selected 속성 추가
        for(let op of options){
            if(op.value == key){
                op.selected = true;
            }
        }

    }

})();

// 검색어 입력 없이 제출된 경우
faqSearch.addEventListener("submit", e=>{

    if(searchQuery.value.trim().length == 0){// 검색어 미 입력시
        e.preventDefault(); // form 기본 이벤트 제거

        location.href = location.pathname// 해당 게시판 1페이지로 이동

    
    }

})




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

 


