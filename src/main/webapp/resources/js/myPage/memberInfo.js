const updateBtn = document.getElementById("updateBtn");
const modal = document.getElementById("modal");

// 수정하기 버튼을 클릭했을 때 모달창 뜨도록
updateBtn.addEventListener("click", function(){
     modal.style.display="block";

})

// 모달창 취소를 눌렀을 때 
document.getElementById("back").addEventListener("click", function(){
    modal.style.display="none";
})



