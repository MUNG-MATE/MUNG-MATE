const findInfoBtn1 = document.getElementById("findInfoBtn1");
const findInfoBtn2 = document.getElementById("findInfoBtn2");
const findprofile = document.getElementById("findprofile");
const findprofilePassword = document.getElementById("findprofilePassword");
const searchNoBtn = document.getElementById("searchNoBtn"); /* 돌아가기 버튼 */
const searchNoBtn2 = document.getElementById("searchNoBtn2");


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








