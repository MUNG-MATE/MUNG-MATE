const nickName = document.getElementById("nickName");
const memberName = document.getElementById("name");
const phone = document.getElementById("phone");
const memberInfoUpdate = document.getElementById("memberInfoUpdate");

// 닉네임 유효성 검사
if(memberInfoUpdate != null){
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
        memberName.addEventListener("input", () => {

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
        if(nickName.style.color == "red"){
            alert("닉네임이 유효하지 않습니다.");
            nickName.focus();
            e.preventDefault();
            return;
        }
        // 이름이 유효하지 않은 경우
        if(memberName.style.color == "red"){
            alert("이름이 유효하지 않습니다.");
            memberName.focus();
            e.preventDefault();
            return;
        }

        // 전화번호가 유효하지 않은 경우
        if(memberTel.style.color == "red"){
            alert("전화번호가 유효하지 않습니다.")
            memberTel.focus();
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
if(imageInput != null){

    originalImage = profileImage.getAttribute("src");

    if(originalImage == "/resources/images/user.png"){
        initCheck = false; // false == 기본이미지
    }else {
        initCheck = true; // true == 기본이미지가 아닌 경우
    }

    imageInput.addEventListener("change", e => {

        const file = e.target.files[0];

        if(file == undefined){
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

    // 사진을 지웠을 때
    deleteImage.addEventListener("click", () => {
        profileImage.setAttribute("src", "/resources/images/user.png");
        imageInput.value = "";

        deleteCheck = 0;
    })


}
