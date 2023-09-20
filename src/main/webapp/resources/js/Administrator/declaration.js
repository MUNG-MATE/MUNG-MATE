const petsitter = document.getElementById("declarationNo");

petsitter.addEventListener("change", ()=>{
    
    const petsitterNo = petsitter.value;

    fetch("/Administrator/declaration/pesitter",{
        method :"post",
        headers : {"Content-Type" : "application/json"},
        body : petsitterNo
    })
    .then(resp => resp.text())
    .then(result =>{
        console.log(result);
        if(result >0){
            alert("성공")
        }else{
            alert("실패");
        }
    })
    .catch(e => console.log(e));
})

function textValidate(){
    const textarea = document.getElementById("singo");
    if( textarea.value.trim().length <= 20) {
        textarea.value="";
        textarea.focus();
        alert("신고하는이유를 상세하게 써주세요!!")
        return false;
    }
    return true;
}