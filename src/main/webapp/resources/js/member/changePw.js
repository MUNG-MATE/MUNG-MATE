const inputnewPassword = document.getElementById("inputnewPassword");
const inputPasswordcheck = document.getElementById("inputPasswordcheck");
const inputCheckText1 = document.getElementById("inputCheckText1");
const inputCheckText2 = document.getElementById("inputCheckText2");

const checkObj = {
    "inputnewPassword" : false,
    "inputPasswordcheck" : false
};

inputnewPassword.addEventListener("input",()=>{

    if(inputnewPassword.value.trim().length == 0 ){
        inputnewPassword.value = "";

        inputCheckText1.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.";
        inputCheckText1.classList.remove("confirm","error");

        checkObj.inputnewPassword = false;
        return;
    }

    const regEx = /^[a-zA-Z0-9\!\@\#\-\_]{6,20}$/;

    if(regEx.test(inputnewPassword.value)){
        checkObj.inputnewPassword = true;

        if(inputPasswordcheck.value.trim().length == 0){
            
            inputCheckText1.innerText="유효한 비밀번호 형식입니다.";
            inputCheckText1.classList.add("confirm");
            inputCheckText1.classList.remove("error");

        }else{
 
            if(inputnewPassword.value == inputPasswordcheck.value){ 

                inputCheckText2.innerText="비밀번호가 일치합니다.";
                inputCheckText2.classList.add("confirm");
                inputCheckText2.classList.remove("error");
    
                checkObj.inputPasswordcheck = true;
    
            }else{
    
                inputCheckText2.innerText="비밀번호가 일치하지 않습니다.";
                inputCheckText2.classList.add("error");
                inputCheckText2.classList.remove("confirm");
    
                checkObj.inputPasswordcheck = false;

            }

        }
    }else{

        inputCheckText1.innerText="비밀번호 형식이 유효하지 않습니다.";
        inputCheckText1.classList.add("error");
        inputCheckText1.classList.remove("confirm");

        checkObj.inputnewPassword = false;
    }

});

inputPasswordcheck.addEventListener("input", ()=>{

    if(checkObj.inputnewPassword){ 

      
        if(inputPasswordcheck.value == inputnewPassword.value){ 

            inputCheckText2.innerText="비밀번호가 일치합니다.";
            inputCheckText2.classList.add("confirm");
            inputCheckText2.classList.remove("error");

            checkObj.inputPasswordcheck = true;

        }else{

            inputCheckText2.innerText="비밀번호가 일치하지 않습니다.";
            inputCheckText2.classList.add("error");
            inputCheckText2.classList.remove("confirm");

            checkObj.inputPasswordcheck = false;

        }

    }else{ 
        checkObj.inputPasswordcheck = false;
    }
});

const changePwForm = document.getElementById("changePwForm");

changePwForm.addEventListener("submit", e=>{
    for(let i in checkObj){

        if(!checkObj[i]){

            switch(i){
                case "inputnewPassword" : alert("새로운 비밀번호가 유효하지 않습니다."); break;

                case "inputPasswordcheck" : alert("새로운 비밀번호 확인이 유효하지 않습니다."); break;
            }

            document.getElementById(i).focus();

            e.preventDefault();
            return;
        }


    }
});