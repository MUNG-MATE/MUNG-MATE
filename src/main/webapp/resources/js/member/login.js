const findInfoBtn1 = document.getElementById("findInfoBtn1");
const findInfoBtn2 = document.getElementById("findInfoBtn2");
const findprofile = document.getElementById("findprofile");
const findprofilePassword = document.getElementById("findprofilePassword");
const searchNoBtn = document.getElementById("searchNoBtn"); /* 돌아가기 버튼 */
const searchNoBtn2 = document.getElementById("searchNoBtn2");

/*------------------------ 로그인 영역 -----------------------------------*/ 

const loginForm = document.getElementById("loginForm");
const inputEmail = document.getElementById("inputEmail");
const inputPassword = document.getElementById("inputPassword");
const searchYesBtn = document.getElementById("searchYesBtn");
const searchInputName = document.getElementById("searchInputName");
const searchInputPhone = document.getElementById("searchInputPhone");
const findInfoTitle1 = document.getElementById("findInfoTitle1");
const findInfoTitle2 = document.getElementById("findInfoTitle2");
const profileCheck  = document.getElementsByClassName("profileCheck")[0];


if(loginForm != null){
    loginForm.addEventListener("submit", e => {
        if(inputEmail.value.trim().length == ""){
            alert("이메일을 입력해주세요");
            inputEmail.value = "";
            inputEmail.focus();

            e.preventDefault();
            return;
        }

        if(inputPassword.value.trim().length == 0){
            alert("비밀번호를 입력해주세요");
            
            inputPassword.value = "";
            inputPassword.focus();

            e.preventDefault();
            return;
        }
    });
}

if(searchYesBtn != null){

    searchYesBtn.addEventListener("click", ()=>{

        fetch("/member/findEmail",{
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify({"memberName": searchInputName.value, "memberTel": searchInputPhone.value})
        })
        .then(resp => resp.text())
        .then(result => {

            if(result == ""){
                
                alert("일치하는 회원이 존재하지 않습니다. 다시 입력해주세요.");
                searchInputName.value="";
                searchInputPhone.value="";
                searchInputName.focus();

            }else{

                profileCheck.innerHTML="";

                const title = document.createElement("div");
                title.innerHTML="아이디 찾기";

                const content1 = document.createElement("div");
                content1.innerHTML="인증된 이메일만 정보 찾기가 가능합니다.";

                const content2 = document.createElement("div");
                content2.setAttribute("id","findInfoContent");

                const content3 = document.createElement("div");
                content3.setAttribute("id","findInfoTitle1");
                content3.innerHTML="조회하신 회원의 아이디 내역";

                const content4 = document.createElement("div");
                content4.innerHTML = result + "입니다.";
                content4.setAttribute("id","findInfoTitle2")

                const content5 = document.createElement("div");
                const content6 = document.createElement("div");
                const content7 = document.createElement("div");
                
                const content8 = document.createElement("button");
                content8.classList.add("loginPageBtn");
                content8.setAttribute("id","searchNoBtn");

                const content9 = document.createElement("spen");
                content9.innerHTML = "돌아가기";
                content9.style.zIndex = 1;

                content8.append(content9); 
                
                content7.append(content8);

                profileCheck.append(title,content1,content2,content3,content4, content5, content6, content7);

                if(content8 != null){
                    content8.addEventListener("click",()=>{
                        findprofile.classList.toggle("modal");
                    })
                }
            }

        })
        .catch(err => {
            console.log(err);
        })
    });

}



/*------------------------ 로그인 영역 -----------------------------------*/ 


/*------------------------ 모달 영역 -----------------------------------*/ 




if(findInfoBtn1 != null){
    findInfoBtn1.addEventListener("click", ()=>{
        findprofile.classList.toggle("modal");
        
    });
}

if(findInfoBtn2 != null){
    findInfoBtn2.addEventListener("click", ()=>{
        findprofilePassword.classList.toggle("modal");
    })
}


if(searchNoBtn != null){
    searchNoBtn.addEventListener("click", ()=>{
        findprofile.classList.toggle("modal");
    })
}

if(searchNoBtn2 != null){
    searchNoBtn2.addEventListener("click", ()=>{
        findprofilePassword.classList.toggle("modal");
    })
}

/*------------------------ 모달 영역 -----------------------------------*/ 



/* -------------------------- 이메일 인증 -------------------------*/

// 인증번호 발송
const InputEmail = document.getElementById("searchInputEmail"); // 이메일 작성란
const emailCheck = document.getElementById("emailCheck"); // 인증번호 전송 버튼
const authKeyTime = document.getElementById("authKeyTime");
let count = 0;

let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

emailCheck.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    if(InputEmail.value.trim().length != 0){


    
            /* fetch() API 방식 ajax */
            fetch("/sendEmail/signUp?email="+InputEmail.value)
            .then(resp => resp.text())
            .then(result => {
                if(result > 0){
                    console.log("인증 번호가 발송되었습니다.");
                    tempEmail = InputEmail.value;
                }else{
                    console.log("인증번호 발송 실패");
                    alert("인증번호 발송 실패 !! ( 이메일이 일치하는 회원이 없습니다. )");
                    count = 0;
                }
            })
            .catch(err => {
                console.log("이메일 발송 중 에러 발생");
                console.log(err);
                count = 0;
            });
           
            alert("인증번호가 발송 되었습니다.");
    
            authKeyTime.innerText = "05:00";

            clearInterval(authTimer);
    
            authTimer = window.setInterval(()=>{
                            // 일정 시간이 지날때 마다 변화하는 구문
            authKeyTime.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
               
                // 남은 시간이 0분 0초인 경우
                if(authMin == 0 && authSec == 0){
                    checkObj.authKey = false;
                    clearInterval(authTimer);
                    return;
                }
    
                // 0초인 경우
                if(authSec == 0){
                    authSec = 60;
                    authMin--;
                }
    
                authSec--; // 1초 감소
                
            }, 1000)
    }else{
        alert("이메일을 입력해주시길 바랍니다.");
        count = 0;
        return;
    }

});

// 인증 확인
const signUpInputEmailCheck = document.getElementById("inputCheckNumber"); // 인증번호 입력란
const checkclear = document.getElementById("checkclear"); // 인증 버튼

checkclear.addEventListener("click", function(){

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        console.log(tempEmail);
        console.log(signUpInputEmailCheck.value);
        const obj = {"inputKey":signUpInputEmailCheck.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        // inputKey = 123456&email=user01

        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyTime.innerHTML="인증되었습니다.";
                authKeyTime.classList.add("confirm");
                count = 1;
                
            } else{
                clearInterval(authTimer);
                alert("인증번호가 일치하지 않습니다. 다시 인증을 진행해 주세요.");
                count = 0;
            }
        })
        .catch(err => console.log(err));

    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.");
        count=0;
        
    }

});


const findPwForm = document.getElementById("findPwForm");

findPwForm.addEventListener("submit", e=>{
    if(count ==  0){
        alert("인증에 실패하셨습니다. 다시 진행해주세요.");
        e.preventDefault();
    }else{
        if(!confirm("비밀번호 변경 화면으로 이동하시겠습니까?")){
            e.preventDefault();
        }
    }
})
