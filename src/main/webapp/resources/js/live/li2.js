document.addEventListener("DOMContentLoaded", function() {

    console.log('g');
    let startBtn = document.getElementById('startButton');
    let timeEle = document.getElementById('elapsedTime');


    let startTime = 0;
    var interval;

    function updateEleTime() {
        const currentTime = Date.now();
        const elapsedTime = Math.floor((currentTime - startTime) / 1000);
        timeEle.textContent = "경과 시간 : " + elapsedTime + " 초";
    }

    startButton.addEventListener("click", function(){
        if (startTime === 0) {
            startTime = Date.now();
            interval = setInterval(updateEleTime, 1000);
        } else {
            clearInterval(interval);
            startTime = 0;
            timeEle.textContent = "경과 시간 : 0초 ";
        }

    });




});