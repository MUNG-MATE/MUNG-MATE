
const checkObj = {
    "signUpInputNickname" : false,
    "signUpInputEmail" : false,
    "signUpInputPassword" : false,
    "signUpInputPasswordCheck" : false,
    "signUpInputPhone" : false,
    "authKey" : false,
    "agree" : false
};


const signUpInputNickname = document.getElementById("signUpInputNickname");
const nickMessage = document.getElementById("nickMessage");

signUpInputNickname.addEventListener("input", ()=>{


    if(signUpInputNickname.value.trim().length == 0 ){
        signUpInputNickname.value = "";

        nickMessage.innerText = "한글,영어,숫자로만 2~10글자";
        nickMessage.classList.remove("confirm","error");

        checkObj.signUpInputNickname = false;

        return;
    }

    const regEx = /^[가-힣\w\d]{2,10}$/;

    if(regEx.test(signUpInputNickname.value)){ 

        fetch("/member/dupCheck/nickname?nickname=" + signUpInputNickname.value)
        .then(resp => resp.text()) 
        .then(count => {

            if(count == 0 ){

                nickMessage.innerText="사용 가능한 닉네임 입니다.";
                nickMessage.classList.add("confirm");
                nickMessage.classList.remove("error");
                checkObj.signUpInputNickname = true; 

            }else{

                nickMessage.innerText="이미 사용중인 닉네임 입니다.";
                nickMessage.classList.add("error");
                nickMessage.classList.remove("confirm");
                checkObj.signUpInputNickname = false; 

            }

        })
        .catch(err => {console.log(err)})


    }else{ 

        nickMessage.innerText="닉네임 형식이 유효하지 않습니다.";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");
        checkObj.signUpInputNickname = false; 

    }
});




const signUpInputEmail = document.getElementById("signUpInputEmail");
const emailMessage = document.getElementById("emailMessage");

signUpInputEmail.addEventListener("input", () =>{

    if(signUpInputEmail.value.trim().length == 0){
        signUpInputEmail.value = "";
        emailMessage.innerText="메일을 입력해 주시길 바랍니다.";

        emailMessage.classList.remove("confirm","error");

        checkObj.signUpInputEmail = false;

        return;
    }

    const regEx = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regEx.test(signUpInputEmail.value)){
        
        fetch("/member/dupCheck/email?email=" + signUpInputEmail.value)

        .then( (response) => response.text()) 

        .then( count => {
            console.log(count);

            if(count == 0){
                emailMessage.innerText="사용 가능한 이메일 입니다.";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");
                checkObj.signUpInputEmail = true; 

            }else{
                emailMessage.innerText="이미 사용중인 이메일 입니다.";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");
                checkObj.signUpInputEmail = false;
            }

        } )

        .catch( err => console.log(err))

    }else{ 
        emailMessage.innerText="이메일 형식이 유효하지 않습니다.";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");
        checkObj.memberEmail = false; 
    }


}); 

const signUpInputPassword = document.getElementById("signUpInputPassword");
const signUpInputPasswordCheck = document.getElementById("signUpInputPasswordCheck");
const pwMessage1 = document.getElementById("pwMessage1");
const pwMessage2 = document.getElementById("pwMessage2");

signUpInputPassword.addEventListener("input", ()=>{

      if(signUpInputPassword.value.trim().length == 0 ){
        signUpInputPassword.value = "";

        pwMessage1.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
        pwMessage1.classList.remove("confirm","error");

        checkObj.signUpInputPassword = false;
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    if(regEx.test(signUpInputPassword.value)){
        checkObj.signUpInputPassword = true;

        if(signUpInputPasswordCheck.value.trim().length == 0){
            
            pwMessage1.innerText="유효한 비밀번호 형식입니다.";
            pwMessage1.classList.add("confirm");
            pwMessage1.classList.remove("error");

        }else{
 
            if(signUpInputPasswordCheck.value == memberPw.value){ 

                pwMessage2.innerText="비밀번호가 일치합니다.";
                pwMessage2.classList.add("confirm");
                pwMessage2.classList.remove("error");
    
                checkObj.signUpInputPasswordCheck = true;
    
            }else{
    
                pwMessage2.innerText="비밀번호가 일치하지 않습니다.";
                pwMessage2.classList.add("error");
                pwMessage2.classList.remove("confirm");
    
                checkObj.memberPwConfirm = false;

            }

        }

    }else{

        pwMessage1.innerText="비밀번호 형식이 유효하지 않습니다.";
        pwMessage1.classList.add("error");
        pwMessage1.classList.remove("confirm");

        checkObj.signUpInputPassword = false;
    }


});


signUpInputPasswordCheck.addEventListener("input", ()=>{

    if(checkObj.signUpInputPassword){ 

    
        if(signUpInputPasswordCheck.value == signUpInputPassword.value){ 

            pwMessage2.innerText="비밀번호가 일치합니다.";
            pwMessage2.classList.add("confirm");
            pwMessage2.classList.remove("error");

            checkObj.signUpInputPasswordCheck = true;

        }else{ 

            pwMessage2.innerText="비밀번호가 일치하지 않습니다.";
            pwMessage2.classList.add("error");
            pwMessage2.classList.remove("confirm");

            checkObj.signUpInputPasswordCheck = false;

        }

    }else{ 
        checkObj.signUpInputPasswordCheck = false;
    }
});

const signUpInputPhone = document.getElementById("signUpInputPhone");
const telMessage = document.getElementById("telMessage");

// 전화번호가 입력 되었을 때
signUpInputPhone.addEventListener("input", ()=>{

    // 전화번호가 입력 되지 않은 경우
    if(signUpInputPhone.value.trim().length == 0 ){
        signUpInputPhone.value = "";

        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";
        telMessage.classList.remove("confirm","error"); // 검정 글씨

        checkObj.signUpInputPhone = false; // 빈칸 == 유효 X

        return;
    }

    // 정규표현식으로 유효성 검사
    const regEx = /^(070|02|0[1-9]{1}[0-9]{1})[0-9]{3,4}[0-9]{4}$/;

    if(regEx.test(signUpInputPhone.value)){

        telMessage.innerText="유효한 전화번호 형식입니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");
        checkObj.signUpInputPhone = true; 

    }else{ 

        telMessage.innerText="전화번호 형식이 유효하지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");
        checkObj.signUpInputPhone = false; 

    }
});

// -------------------------- 이메일 인증 -------------------------

// 인증번호 발송
const emailCheck = document.getElementById("emailCheck"); // 인증번호 전송 버튼
const authKeyMessage = document.getElementById("authKeyMessage"); // 인증번호 관련 메시지 창
const authKeyTime = document.getElementById("authKeyTime");
let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

emailCheck.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;

    checkObj.authKey = false;

    if(checkObj.signUpInputEmail){ // 중복이 아닌 이메일인 경우

        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUp?email="+signUpInputEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.");
                tempEmail = signUpInputEmail.value;
            }else{
                console.log("인증번호 발송 실패");
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
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

    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        signUpInputEmail.focus();
    }

});

// 인증 확인
const signUpInputEmailCheck = document.getElementById("signUpInputEmailCheck"); // 인증번호 입력란
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
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;

            } else{
                alert("인증번호가 일치하지 않습니다.");
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));

    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.");
    }

});

document.getElementById("signUpFrm").addEventListener("submit", e=> {

    for(let key in checkObj){

        if(!checkObj[key]){

            switch(key){
                case "signUpInputEmail" : alert("이메일이 유효하지 않습니다."); break;

                case "signUpInputPassword" : alert("비밀번호가 유효하지 않습니다."); break;

                case "signUpInputPasswordCheck" : alert("비밀번호가 확인되지 않습니다."); break;

                case "signUpInputNickname" : alert("닉네임이 유효하지 않습니다"); break;

                case "signUpInputPhone" : alert("전화번호가 유효하지 않습니다."); break;

                case "authKey" : alert("이메일 인증 오류!!!"); break;

            }
            document.getElementById(key).focus();

            e.preventDefault();
            return;
        }


    }
})  
