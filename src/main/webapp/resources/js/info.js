const profileArea = document.getElementsByClassName("profileArea");
const wishListBtn = document.getElementsByClassName("wishListBtn");
const petSitterNo = document.getElementsByClassName("petSitterNo");

for( let i =0; i < profileArea.length; i++){

    
    
    wishListBtn[i].addEventListener("click", e => {
        
        let check;

        // if(memberNo == null){
        //    alert("로그인 후 이용해주세요.");
        //    return;
        // }


        if(!e.target.classList.contains("good")){
            check = 0;
        }else{
            check = 1;
        }
        
        
        const data = { "petSitterNo" : petSitterNo[i].value,
                        "check" : check,
                        "memberNo" : memberNo};

        fetch("/wishList", {
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(response => response.json())
        .then(result => {

            if(result == -1 ){ // INSERT, DELETE 실패 시 
                console.log("처리 실패");
                return;
            }

            if(result == 1){

                alert("찜 목록에 추가 되었습니다.");
                wishListBtn[i].classList.add("good");
            }

            if(result == 2){
                alert("찜 목록에 삭제 되었습니다.");
                wishListBtn[i].classList.remove("good");
            }

            
        })
        .catch(e => {console.log(e);
                console.log("에러");
            })


        

    
    })
}