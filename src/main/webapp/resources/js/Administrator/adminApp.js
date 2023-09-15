const contentCheckBtn = document.getElementsByClassName("contentCheckBtn")
const modal = document.getElementsByClassName("modal");
const back =document.getElementsByClassName("back");

for(let i = 0; i < contentCheckBtn.length; i++){
    // 확인하기 버튼을 클릭했을 때 모달창 뜨도록
    contentCheckBtn[i].addEventListener("click", function(){
         modal[i].style.display="block";
    
    })

    // 모달창 취소를 눌렀을 때 
    back[i].addEventListener("click", function(){
        modal[i].style.display="none";
    })
}

function insertApp(appNo, appLocation, appEx, appDate, memberEmail){

    
    const data = {'appNo' : appNo
                 ,'appLocation' : appLocation
                 ,'appEx' : appEx
                 ,'appDate' : appDate
                 ,'memberEmail' : memberEmail}

        if (confirm("정말 수락하시겠습니까?")) {

            fetch("/petsitter/admin/petsitterInsert", {
                method : "POST",
                headers : {"Content-Type" : "application/json"},
                body : JSON.stringify(data)
            })
            .then(resp => resp.text())
            .then(result => {
                
                if(result > 0){
                    alert("펫시터 신청이 정상적으로 수락되었습니다.");
                    location.reload(true);

                }
            })
            .catch(err => {
                console.log(err);
            })
            
        }

}


function deleteApp(memberNo){

    console.log("왔어")

    if (confirm("정말 수락하시겠습니까?")) {
    fetch("/petsitter/admin/petsitterDelete", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(memberNo)
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("일반회원 신청이 정상적으로 수락되었습니다.");
            location.reload(true);

        }else {
            console.log("실패 ㅜㅜ")
        }
    })
    .catch(e => console.log(e))
}


}
