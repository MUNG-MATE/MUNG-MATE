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

window.onload = function(){
    fetch("/Administrator/faq")
    .then(resp => resp.text())
    .then(result => {
        console.log("불러오기 성공")
    })
    .catch(e => console.log(e));

}

function faqDelete(){

    const resultTitle = document.getElementById("resultTitle");
    const resultContent = document.getElementById("resultContent");
    const result1 = document.getElementById("result1");
    const result2 = document.getElementById("result2");
    const table = document.getElementById("table");

    console.log("boardNo : " + boardNo);


    fetch("/Administrator/faqDelete", {
        method : "POST",
        headers : {"Content-Type" : "application/text"},
        body : boardNo
    })
    .then(resp => resp.text())
    .then(result => {

        if(result > 0){
            console.log(boardList)
            table.innerHTML = "";
            location.reload(true);
          


        }else{
            console.log("실패~");
        }
    })
    .catch(e => console.log(e))
   

    return;
}

