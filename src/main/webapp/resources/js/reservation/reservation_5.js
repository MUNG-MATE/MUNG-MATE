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

const selectDate = document.getElementById("selectDate"); // 날짜
const selectStartDate = document.getElementById("selectStartDate"); // 서비스 시작 시간
const selectAddr = document.getElementById("selectAddr"); // 방문 장소
const selectPetSitterNo = document.getElementById("selectPetSitterNo"); // 펫시터 번호
const serviceNo = document.getElementById("serviceNo");// 서비스 번호
const selectedService = document.getElementById("selectedService"); // 서비스 방식
const selectMoney = document.getElementById("selectMoney"); // 가격
const petNo = document.querySelectorAll(".petNo") // 펫 번호

let petList = [];


for(let i =0; i < backgroundArea.length; i++){
    backgroundArea[i].addEventListener("click", ()=>{

        if(backgroundArea[i].classList.contains("clicked")){
                petList.push(petNo[i].value);
        
        }
    });
}


const reservationForm = document.getElementById("reservationForm");
const creditBtn = document.getElementById("creditBtn");
creditBtn.addEventListener("click", e=>{
    
    
     const data = { "rsDate" : selectDate.value,
                   "rsStartDate" : selectStartDate.value,
                   "rsAddress" : selectAddr.value,
                   "rsSitterNo" : selectPetSitterNo.value,
                   "rsMemberNo" : memberNo,
                   "serviceNo" : serviceNo.value,
                   "petNoList" : petList,
                   "price" : totalPrice
                };
                
    // 결제 api
    $("#creditBtn").click(function () {
        
        console.log(data);

        IMP.init('imp06854558'); 
        IMP.request_pay({
        pg: "inicis",
        pay_method: "card",
        merchant_uid : 'merchant_'+new Date().getTime(),
        name : selectedService.value,
        amount : '1',
        buyer_email : 'choiyonghyuk97@gmail.com',
        buyer_name : '우리 멍메이트',
        }, function (rsp) { // callback
            if (rsp.success) {
            // 결제 성공 시 로직,
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
                 
            // ajax
            fetch("/reservation/pay", {
                method  : "POST",
                headers : {"Content-Type" : "application/json"},
                body    : JSON.stringify(data)
            })
    
            .then(resp => resp.text())
    
            .then( result => {
                if(result > 0 ){
                    console.log("결제 완료!");
                    
                     location.href = "6";
                } else {
                    alert("결제에 실패하셨습니다.");
                    e.preventDefault();
                    
                }
            })
    
            .catch(err => {
                console.log(err);
            });
    
             } else {
            // 결제 실패 시 로직,
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            }
    
            // alert(msg)
        })
        
    
    })
})


