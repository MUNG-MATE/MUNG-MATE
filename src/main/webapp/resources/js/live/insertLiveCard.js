// 이미지 파일 추가
const inputImage = document.getElementById("inputImage");
const petImage = document.getElementById("petImage");
let deleteCheck = -1;

const startTime = document.getElementById("startTime");
const endTime = document.getElementById("endTime");

const localTime = localStorage.realTime.substring(0,2);

startTime.innerText = guessAmPm(localTime) + " : " + localStorage.realTime.substring(5,7);
endTime.innerText = guessAmPm(new Date().getHours()) + " : " + new Date().getMinutes();



function guessAmPm(localTime) {
    if(localTime > 12) {
        localTime = localTime - 12;
        if(localTime < 10) localTime = "0" + localTime;
        localTime = "오후 " + localTime;

    } else {
        if(localTime < 10) localTime = "0" + localTime;
        localTime = "오전 " + localTime;
    }

    return localTime;
}

inputImage.addEventListener("change", e => {
    const maxSize = 1 * 1024 * 1024 * 5; // 이미지 최대 크기 : 5MB

    const file = e.target.files[0];

    if(file == undefined) {
        console.log("파일 선택이 취소됨");
        deleteCheck = -1; 
        petImage.setAttribute("src", '/resources/images/reservation/inputpetimage.png');
        return;
    }

    if(file.size > maxSize) { // 선택된 파일의 크기가 최대 크기를 초과한 경우
        alert("5MB 이하의 이미지를 선택해주세요.");
        inputImage.value = "";
        deleteCheck = -1;
        petImage.setAttribute("src", '/resources/images/reservation/inputpetimage.png');
        return;
    }

    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = e => {
        petImage.setAttribute("src", e.target.result);
        deleteCheck = 1;
    }

});

const insertForm = document.getElementById("insertForm");
const inputContent = document.getElementById("inputContent");

insertForm.addEventListener("submit", e => {
    if(inputContent.value.trim() == "") {
        alert("내용을 입력해주세요.");
        inputContent.value = "";
        inputContent.focus();
        e.preventDefault();
        return;
    }

    if(deleteCheck == -1) {
        alert("사진을 선택헤주세요.");
        e.preventDefault();
        return;
    }
})