const serviceDivOne = document.getElementsByClassName("serviceDiv-one");
const serviceDivTwo = document.getElementsByClassName("serviceDiv-two");
const serviceDiv2 = document.getElementsByClassName("serviceDiv2");
const serviceSubSection2 = document.getElementById("serviceSubSection2");
const serviceSubSection3 = document.getElementById("serviceSubSection3");
const nextBtn = document.getElementById("nextBtn");

/* serviceDivOne 산책 클릭 시  */


serviceDivOne[0].addEventListener("mouseover", () => {
    if(!serviceDivOne[0].classList.contains("clicked")) {
        serviceDivOne[0].classList.add("hovered");
    }
})

serviceDivOne[0].addEventListener("mouseout", () => {
    if(!serviceDivOne[0].classList.contains("clicked")) {
        serviceDivOne[0].classList.remove("hovered");
    }
})

serviceDivOne[0].addEventListener("click", () => {
    removeEvent();
    if(!serviceDivOne[0].classList.contains("clicked")) {

        
        serviceDivOne[0].classList.add("clicked");
        serviceDivOne[0].classList.remove("hovered");
        serviceDivTwo[0].classList.remove("clicked");
        serviceSubSection2.style.display = 'flex';
        serviceSubSection3.style.display = 'none';
        return;
    }

    if(serviceDivOne[0].classList.contains("clicked")) {
        serviceDivOne[0].classList.remove("clicked");
        serviceSubSection2.style.display = 'none';
    }
    
})

function removeEvent(){

    for(let i = 0; i < serviceDiv2.length; i++) {

        serviceDiv2[i].classList.remove("clicked")
    };


}

    




/* serviceDivTwo 돌봄 클릭 시 */
serviceDivTwo[0].addEventListener("mouseover", () => {
    if(!serviceDivTwo[0].classList.contains("clicked")) {
        serviceDivTwo[0].classList.add("hovered");
    }
})

serviceDivTwo[0].addEventListener("mouseout", () => {
    if(!serviceDivTwo[0].classList.contains("clicked")) {
        serviceDivTwo[0].classList.remove("hovered");
    }
})

serviceDivTwo[0].addEventListener("click", () => {
    removeEvent()
    if(!serviceDivTwo[0].classList.contains("clicked")) {

        
        serviceDivTwo[0].classList.add("clicked");
        serviceDivTwo[0].classList.remove("hovered");
        serviceDivOne[0].classList.remove("clicked");
        serviceSubSection3.style.display = 'flex';
        serviceSubSection2.style.display = 'none';
        return;
    }

    if(serviceDivTwo[0].classList.contains("clicked")) {
        serviceDivTwo[0].classList.remove("clicked");
        serviceSubSection3.style.display = 'none';
    }
    
})



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


function servicePrice(content) {
    console.log(content);
    
    // 선택한 내용을 input 요소에 설정
    document.getElementById('selectMoney').value = content;
}

function serviceTime(content) {
    console.log(content);
    
    // 선택한 내용을 input 요소에 설정
    document.getElementById('selectTime').value = content;
}

function serviceType(content) {
    console.log(content);
    
    // 선택한 내용을 input 요소에 설정
    document.getElementById('selectedService').value = content;
}


nextBtn.addEventListener("click", e => {

    let flag = false;

    for(let i=0; i < serviceDiv2.length; i++){

        if(serviceDiv2[i].classList.contains("clicked")){
            flag = true;
            
        }
        
    }
    
    if(!flag){
        alert('서비스를 선택하신 뒤 버튼을 눌러주세요');
        e.preventDefault();

    }
})










