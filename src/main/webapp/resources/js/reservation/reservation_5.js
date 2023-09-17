const paymentAmount = document.getElementById("payment_amount");
const backgroundArea = document.getElementsByClassName("backgroundArea");
const nextBtn = document.getElementsByClassName("btnStyle next");

(function(){
    paymentAmount.innerHTML = "0원";
})();


let totalPrice = 0;


// backgroundArea[0].addEventListener("click", e => {


//     totalPrice += rsServicePrice;
//     paymentAmount.innerHTML = totalPrice.toLocaleString('ko-KR') + '원';

// })

// backgroundArea[1].addEventListener("click", e => {

//     totalPrice -= rsServicePrice;
//     paymentAmount.innerHTML = totalPrice.toLocaleString('ko-KR') + '원';

// })


// backgroundArea[2].addEventListener("click", e => {

//     totalPrice += rsServicePrice;
//     paymentAmount.innerHTML = totalPrice.toLocaleString('ko-KR') + '원';

// })


for(let i = 0; i < backgroundArea.length; i++) {

    
    backgroundArea[i].addEventListener("click", e => {

        paymentAmount.innerHTML = ('');

        if(!backgroundArea[i].classList.contains("clicked")) {

            backgroundArea[i].classList.add("clicked");
            totalPrice += rsServicePrice;
            paymentAmount.innerHTML = totalPrice.toLocaleString('ko-KR') + '원';
            e.preventDefault();
        }else{
            backgroundArea[i].classList.remove("clicked");
            totalPrice -= rsServicePrice;
            paymentAmount.innerHTML = totalPrice.toLocaleString('ko-KR') + '원';
            e.preventDefault();
        }
    })
    
}

let flag = false;
nextBtn[0].addEventListener("click", e =>{

    for(let i = 0; i < backgroundArea.length; i++){

        if(backgroundArea[i].classList.contains("clicked")){

            flag = true;
        }

    }

    if(!flag){

        alert('서비스를 이용할 반려견을 선택해주세요.');
        e.preventDefault();
    }


})

