const profileArea = document.getElementsByClassName("profileArea");
const review = document.getElementsByClassName("review");

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
            return;
        }

        if(profileArea[i].classList.contains("clicked")) {
            profileArea[i].classList.remove("clicked");
        }
        
    })
}

