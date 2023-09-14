// 생년월 - option 태그 생성


const birth = document.getElementById("birth");

const date = new Date();
const year = date.getFullYear();
if(birth != null){

    for(let i = year; i > year-20; i--) {
    
        birth.innerHTML += `<option>${i}년</option>`;
    }

    const month = document.getElementById("month");
    
    for(let i = 1; i < 13; i++) {
        month.innerHTML += `<option>${i}월</option>`;
    }
}


// 이미지 파일 추가
const inputImage = document.getElementById("inputImage");
const imageText = document.getElementById("imageText");
const petImage = document.getElementById("petImage");
let deleteCheck = -1;
if(inputImage != null){

    inputImage.addEventListener("change", e => {
    
        console.log("test");
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
    
            const url = e.target.result;
            petImage.setAttribute("src", url);
            document.getElementsByTagName("label")[0].append(img);
    
            deleteCheck = 1;
        }
    
    });
}

const petInfoUpdate = document.getElementById("petInfoUpdate");
const petName = document.getElementById("petName");
const petType = document.getElementById("petType");
const petBirth = document.getElementById("petBirth");
const note = document.getElementById("note");
const gender = document.getElementsByName("gender");


petInfoUpdate.addEventListener("submit", e=>{

    if(petName.value.trim().length == 0){
        alert("반려견 이름을 작성해주세요.");
        petName.focus();
        e.preventDefault();
        return;
    }

    if(petType.value.trim().length == 0){
        alert("반려견 품종을 작성해주세요.");
        petType.focus();
        e.preventDefault();
        return; 
    }

    if(petBirth.value.trim().length == 0){
        alert("반려견 생년월을 작성해주세요.");
        petBirth.focus();
        e.preventDefault();
        return;
    }
    
    if(!gender[0].checked && !gender[1].checked){
        alert("반려견 성별을 선택해주세요.");
        e.preventDefault();
        return;
    }
  
    if(note.value.trim().length == 0){

       if(confirm("반려견의 특이사항 없이 등록하시겠습니까?")){
            note.innerHTML = "사랑하는 우리 아이는 특이사항이 없습니다.";
            e.preventDefault();
            return;
       }else{
            note.focus();
            e.preventDefault();
            return;
       }


    }

    if(inputImage.value.trim().length == 0){
        
        if(confirm("반려견의 프로필 사진을 지정하지 않고 등록하시겠습니까?")){
        }else{
            e.preventDefault();
            return;
        }

    }


});
