const agreeBtn = document.getElementsByClassName("agreeBtn");
const refuseBtn = document.getElementsByClassName("refuseBtn");

/* 클릭하면 예약상태 Y 로 바뀜 */
for(let i=0; i<agreeBtn.length; i++){
agreeBtn[i].addEventListener("click",()=>{
    

        if(confirm("수락 하시겠습니까?")){
            fetch("/agree?rsNo="+ rsNo)
            .then(resp => resp.text())
            .then(result => {
                if(result > 0){
                    alert("성공");
                }else{
                    alert("실패");
                }
            })
            .catch( err => console.log(err))
        }
        
    })
}

/* 클릭하면 예약상태 그대로 N 유지. */
refuseBtn.addEventListener("click",()=>{
        if(confirm("거절 하시겠습니까?")){
    
        fetch("/refuse?rsNo="+ rsNo)
        .then(resp => resp.text())
        .then(result => {
            if(result>0){
                
            }
    
        })
        .catch( err => console.log(err))
    }
})