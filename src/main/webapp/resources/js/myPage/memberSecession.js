const agree = document.getElementById("agree");
const secessionBtn = document.getElementById("secessionBtn");


secessionBtn.addEventListener("click", function(e){

    if(!agree.checkd){
        alert("약관동의해주세요.");
        e.preventDefault();
    }
    return;
})