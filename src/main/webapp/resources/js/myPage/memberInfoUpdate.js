const nickName = document.getElementById("nickName");
const memberName = document.getElementById("name");
const phone = document.getElementById("phone");
const memberInfoUpdate = document.getElementById("memberInfoUpdate");

// 닉네임 유효성 검사
if (memberInfoUpdate != null) {
    initNickname = nickName.value;
    initTel = phone.value;
    initName = memberName.value;

    nickName.addEventListener("input", () => {

        // 변경 전 닉네임과 입력 값이 같을 경우
        if (initNickname == nickName.value) {
            nickName.removeAttribute("style");
            return;
        }

        // 정규 표현식으로 유효성 검사
        const regEx = /^[가-힣\w\d]{2,10}$/;

        if (regEx.test(nickName.value)) {
            nickName.style.color = "green";
        } else {
            nickName.style.color = "red";
        }
    })

    // 이름 유효성 검사
    memberName.addEventListener("input", () => {

        // 변경 전 이름과 입력 값이 같을 경우
        if (initName == memberName.value) {
            memberName.removeAttribute("style");
            return;
        }

        // 정규 표현식으로 유효성 검사
        const regEx = /^[가-힣]{2,5}$/;

        if (regEx.test(memberName.value)) {
            memberName.style.color = "green";
        } else {
            memberName.style.color = "red";
        }


    })

    // 전화번호 유효성 검사
    phone.addEventListener("input", () => {

        // 변경 전 전화번호와 입력 값이 같을 경우
        if (initTel == phone.value) {
            phone.removeAttribute("style");
            return;
        }

        // 정규 표현식으로 유효성 검사
        const regEx = /^(070|02|0[1-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;

        if (regEx.test(phone.value)) {
            phone.style.color = "green";
        } else {
            phone.style.color = "red";
        }
    })

    // 만약 제출을 할 때 유효하지 않은 값이 있다면 제출 막기
    document.getElementById("memberInfoUpdate").addEventListener("submit", e => {

        // 닉네임이 유효하지 않은 경우
        if (nickName.style.color == "red") {
            alert("닉네임이 유효하지 않습니다.");
            nickName.focus();
            e.preventDefault();
            return;
        }
        // 이름이 유효하지 않은 경우
        if (memberName.style.color == "red") {
            alert("이름이 유효하지 않습니다.");
            memberName.focus();
            e.preventDefault();
            return;
        }

        // 전화번호가 유효하지 않은 경우
        if (memberTel.style.color == "red") {
            alert("전화번호가 유효하지 않습니다.")
            memberTel.focus();
            e.preventDefault();
            return;
        }

        if(nickName.value == initNickname && memberName.value == initName && memberTel.value == initTel){
            alert("변경 후 클릭해주세요.");
            e.preventDefault();
            return;
        }

    })
}

// 프로필 이미지
const profileImage = document.getElementById("profileImage"); //img 태그
const deleteImage = document.getElementById("deleteImage"); // X 버튼
const imageInput = document.getElementById("imageInput"); // input 태그

let initCheck;
let deleteCheck = -1; // 프로필 상태
let originalImage; // 초기 프로필 이미지 파일 경로

// 화면에 
if (imageInput != null) {

    originalImage = profileImage.getAttribute("src");

    if (originalImage == "/resources/images/user.png") {
        initCheck = false; // false == 기본이미지
    } else {
        initCheck = true; // true == 기본이미지가 아닌 경우
    }

    imageInput.addEventListener("change", e => {

        const maxSize = 1 * 1024 * 1024 * 2;
        
        const file = e.target.files[0];

        if (file == undefined) {
            deleteCheck = -1;

            profileImage.setAttribute("src", originalImage);

            return;
        }

        if (file.size > maxSize) { 
            alert("2MB 이하의 이미지를 선택해주세요.");
            imageInput.value = "";

            deleteCheck = -1; 

            profileImage.setAttribute("src", originalImage);
            return;
        }

        const reader = new FileReader();
        reader.readAsDataURL(file);

        reader.onload = e => {
            const url = e.target.result;
            profileImage.setAttribute("src", url);

            deleteCheck = 1;
        }
    })
    const imagesChoicedelete = document.getElementById("imagesChoicedelete");

    imagesChoicedelete.addEventListener("click", () => {

            profileImage.setAttribute("src", "/resources/images/user.png");


    })

    memberInfoUpdate.addEventListener("submit", e=> {
        
        let flag = true;
        // 프로필 이미지가 없다 -> 있다
        if(!initCheck && deleteCheck == 1) flag = false;
        // 이전 프로필 이미지가 있다 -> 삭제
        if(initCheck && deleteCheck == 0) flag = false;
        
        // 이전 프로필 이미지가 있다 -> 새 이미지
        if(initCheck && deleteCheck == 1) flag = false;

        if(flag){ // flag == true -> 제출하면 안되는 경우
            e.preventDefault(); // form 기본 이벤트 제거
            alert("이미지 변경 후 클릭해주세요.");
            
        }
    })



}    

