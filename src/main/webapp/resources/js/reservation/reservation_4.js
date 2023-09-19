const profileArea = document.getElementsByClassName("profileArea");
const review = document.getElementsByClassName("review");
const nextBtn = document.getElementById("nextBtn");



for(let i = 0; i < profileArea.length; i++) {

    
    

    profileArea[i].addEventListener("mouseover", () => {
        if(!profileArea[i].classList.contains("clicked")) {
            profileArea[i].classList.add("hovered");
        }
    })
    
    profileArea[i].addEventListener("mouseout", () => {
        if(!profileArea[i].classList.contains("clicked")) {
            profileArea[i].classList.remove("hovered");
        }
    })

    profileArea[i].addEventListener("click", () => {
        if(!profileArea[i].classList.contains("clicked")) {
            for(let j = 0; j < profileArea.length; j++) {
                profileArea[j].classList.remove("clicked");
                profileArea[j].classList.remove("hovered");
            }
            profileArea[i].classList.add("clicked");
            console.log(profileArea[i].classList)
            if(profileArea[i].classList.value != 'profileArea clicked'){
               const value =  document.getElementsByClassName("petSitterValue");
               value.removeAttribute("name");
            }
            return;
        }

        if(profileArea[i].classList.contains("clicked")) {
            profileArea[i].classList.remove("clicked");
        }
        
    })
}


// const petSitterFrm = document.getElementsById("petSitterFrm");
// const profile = document.getElementsById("profileArea");

function selectPetSitterNo(content) {
    console.log(content);
    
    // 선택한 내용을 input 요소에 설정
    document.getElementById('selectPetSitterNo').value = content;
}

nextBtn.addEventListener("click", e => {

    

    if(document.getElementById('selectPetSitterNo').value == ""){
        alert("펫시터를 선택해주세요.");
        e.preventDefault();
        return;
    }
        
    
    
  
  } )
