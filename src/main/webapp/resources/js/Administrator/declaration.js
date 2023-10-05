const petsitters = document.getElementById("declarationNo");
const petsitterInfoBox = document.getElementById("petsitterInfo");

let petNo = 0;

petsitters.addEventListener("change", ()=>{

    const petsitterNo = petsitters.value;
    petNo = petsitters.value;
    fetch("/Administrator/declaration/pesitter",{
        method :"post",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(petsitterNo)
    })
    .then(resp => resp.json())
    .then(petsitterList =>{
        
        
        petsitterInfoBox.innerHTML=""
        
        for(let petsitter of petsitterList){
        
            const petSitterInfo = document.createElement("div");
            petSitterInfo.classList.add("pet-sitter-info");
            
            const petsitterImg = document.createElement("img");
    
            if( petsitter.profileImage !=null){
                petsitterImg.setAttribute("src",petsitter.profileImage);
            }else{
                petsitterImg.setAttribute("src","/resources/images/member/petsitter.jpg")
            }
    
            const ul = document.createElement("ul");
    
            const li1 = document.createElement("li");
            li1.innerText="이름 : "+petsitter.memberName+"펫시터"
            const li2 = document.createElement("li");
            li2.innerText="전화번호 : "+petsitter.memberTel
            const li3 = document.createElement("li");
            li3.innerText="예약일 : "+petsitter.rsDate
            const li4 = document.createElement("li");
            li4.innerText="서비스시작시간 : "+petsitter.rsStartDate
            const li5 = document.createElement("li");
            li5.innerText="이용시간 : "+petsitter.serviceTime
            const li6 = document.createElement("li");
            li6.innerText="이용금액 : "+petsitter.servicePrice
    
            ul.append(li1,li2,li3,li4,li5,li6);
    
            petSitterInfo.append(petsitterImg,ul);
            
            const textarea = document.createElement("textarea");
            textarea.setAttribute("name","singo");
            textarea.setAttribute("id","singo");
            textarea.setAttribute("placeholder","신고하는 이유를 상세하게 적어주세요.");

            petsitterInfoBox.append(petSitterInfo,textarea);
        }

       
    })
    .catch(e => console.log(e));
})
/* function textValidate(){

    const textarea = document.getElementById("singo");

    flag = false;

    if(petNo == 0){
        alert("신고할 펫시터를 선택해주세요.")
        return flag;
    }

    if( textarea.value.trim().length <= 20) {
        textarea.value="";
        textarea.focus();
        alert("신고하는이유를 상세하게 써주세요!!");
        return flag;
        
    }

    
    const obj = {"memberNo" : loginMemberNo ,"petNo": petNo}
    

    fetch("/Administrator/declaration/check",{
        method :"post",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(obj)
    })
    .then(resp=>resp.text())
    .then(result => {
    
        if(result > 0){
            
            alert("이미신고완료된 펫시터입니다.")
            location.href =location;

        }else{ 
            flag = true;
        

        }
    })
    .catch(e => {
        console.log(e);
    });

    return flag;
} */

function textValidate() {
    const textarea = document.getElementById("singo");
    let flag = false;

    if (petNo == 0) {
        alert("신고할 펫시터를 선택해주세요.")
        return flag;
    }

    if (textarea.value.trim().length <= 20) {
        textarea.value = "";
        textarea.focus();
        alert("신고하는 이유를 상세하게 써주세요!!");
        return flag;
    }

    const obj = { "memberNo": loginMemberNo, "petNo": petNo }

    return fetch("/Administrator/declaration/check", {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(obj)
    })
    .then(resp => resp.text())
    .then(result => {
        if (result > 0) {
            alert("이미 신고 완료된 펫시터입니다.")
            location.href = location;
            
        } else {
            flag = true;
        }
        return flag;
    })
    .catch(e => {
        console.log(e);
        return flag;
    });
}


