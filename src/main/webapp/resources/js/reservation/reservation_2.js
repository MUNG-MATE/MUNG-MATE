// 방문 날짜 설정(오늘 기준으로 그 달 한 달 간)
const date = new Date();

const weekdayList = ['일', '월', '화', '수', '목', '금', '토'];
const weekday = weekdayList[date.getDay()];

const year = date.getFullYear();
const month = date.getMonth() + 1;
const day = date.getDate();

const selectDay = document.getElementById("selectDay");

let lastDay;

if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
    lastDay = 31;
} else if(month == 4 || month == 6 || month == 9 || month == 11) {
    lastDay = 30;
} else {
    lastDay = 28;
}

let count = 0;
let index = date.getDay();

for(let i = day; i <= lastDay; i++) {

    if(index > 6) {
        index -= 7;
    }
    
    selectDay.innerHTML += `<option>${year}년 ${month}월 ${day + count}일(${weekdayList[index]})</option>`;
    count++;
    index++;
}



