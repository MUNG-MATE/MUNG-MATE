const serviceDivOne = document.getElementsByClassName("serviceDiv-one");
const serviceDivTwo = document.getElementsByClassName("serviceDiv-two");
const serviceDiv2 = document.getElementsByClassName("serviceDiv2");
const walkArea = document.getElementsByClassName("serviceDiv one");
const serviceSubSection2 = document.getElementById("serviceSubSection2");

/* serviceDivOne 산책 클릭 시  */
for(let i = 0; i < serviceDivOne.length; i++) {

    serviceDivOne[i].addEventListener("mouseover", () => {
        if(!serviceDivOne[i].classList.contains("clicked")) {
            serviceDivOne[i].classList.add("hovered");
        }
    })
    
    serviceDivOne[i].addEventListener("mouseout", () => {
        if(!serviceDivOne[i].classList.contains("clicked")) {
            serviceDivOne[i].classList.remove("hovered");
        }
    })

    serviceDivOne[i].addEventListener("click", () => {
        if(!serviceDivOne[i].classList.contains("clicked")) {
            for(let j = 0; j < serviceDivOne.length; j++) {
                serviceDivOne[j].classList.remove("clicked");
                serviceDivOne[j].classList.remove("hovered");
            }
            serviceDivOne[i].classList.add("clicked");
            return;
        }

        if(serviceDivOne[i].classList.contains("clicked")) {
            serviceDivOne[i].classList.remove("clicked");
        }
        
    })

    


}

/* serviceDivTwo 돌봄 클릭 시 */
for(let i = 0; i < serviceDivTwo.length; i++) {

    serviceDivTwo[i].addEventListener("mouseover", () => {
        if(!serviceDivTwo[i].classList.contains("clicked")) {
            serviceDivTwo[i].classList.add("hovered");
        }
    })
    
    serviceDivTwo[i].addEventListener("mouseout", () => {
        if(!serviceDivTwo[i].classList.contains("clicked")) {
            serviceDivTwo[i].classList.remove("hovered");
        }
    })

    serviceDivTwo[i].addEventListener("click", () => {
        if(!serviceDivTwo[i].classList.contains("clicked")) {
            for(let j = 0; j < serviceDivTwo.length; j++) {
                serviceDivTwo[j].classList.remove("clicked");
                serviceDivTwo[j].classList.remove("hovered");
            }
            serviceDivTwo[i].classList.add("clicked");
            return;
        }

        if(serviceDivTwo[i].classList.contains("clicked")) {
            serviceDivTwo[i].classList.remove("clicked");
        }
        
    })
}



/* 밑에 영역 */
for(let i = 0; i < serviceDiv2.length; i++) {

    serviceDiv2[i].addEventListener("mouseover", () => {
        if(!serviceDiv2[i].classList.contains("clicked")) {
            serviceDiv2[i].classList.add("hovered");
        }
    })
    
    serviceDiv2[i].addEventListener("mouseout", () => {
        if(!serviceDiv2[i].classList.contains("clicked")) {
            serviceDiv2[i].classList.remove("hovered");
        }
    })

    serviceDiv2[i].addEventListener("click", () => {
        if(!serviceDiv2[i].classList.contains("clicked")) {
            for(let j = 0; j < serviceDiv2.length; j++) {
                serviceDiv2[j].classList.remove("clicked");
                serviceDiv2[j].classList.remove("hovered");
            }
            serviceDiv2[i].classList.add("clicked");
            return;
        }

        if(serviceDiv2[i].classList.contains("clicked")) {
            serviceDiv2[i].classList.remove("clicked");
        }
        
    })
}

walkArea.addEventListener("click", () => {

    serviceSubSection2.style.display = 'flex';


})






