const paymentAmount = document.getElementById("payment_amount");
const backgroundArea = document.getElementsByClassName("backgroundArea");

(function(){
    paymentAmount.innerHTML = "";
})();


let totalPrice = 0;


backgroundArea[0].addEventListener("click", e => {

    totalPrice += rsServicePrice;
    paymentAmount.innerHTML = totalPrice;
console.log("test");
})

backgroundArea[1].addEventListener("click", e => {

    totalPrice -= rsServicePrice;
    paymentAmount.innerHTML = totalPrice;
console.log("test");
})

backgroundArea[2].addEventListener("click", e => {

    totalPrice += rsServicePrice;
    paymentAmount.innerHTML = totalPrice;
console.log("test");
})


for(let i = 0; i < backgroundArea.length; i++) {

    
    backgroundArea[i].addEventListener("mouseover", () => {
        backgroundArea[i].classList.add("clicked");
        // if(!background[i].classList.contains("clicked")) {
        // }
    })


}
