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
