const checkObj = {
    "signUpInputEmail" : false,
    "memberPw" : false,
    "memberPwConfirm" : false,
    "memberNickname" : false,
    "memberTel" : false,
    "authKey" : false
};

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
        
        fetch("/dupCheck/email?email=" + signUpInputEmail.value)

        .then( (response) => response.text()) 

        .then( count => {
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