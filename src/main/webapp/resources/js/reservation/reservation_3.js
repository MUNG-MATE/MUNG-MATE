const birth = document.getElementById("birth");

const date = new Date();
const year = date.getFullYear();

for(let i = year; i > year-20; i--) {

    birth.innerHTML += `<option>${i}년</option>`;
}

const month = document.getElementById("month");

for(let i = 1; i < 13; i++) {
    month.innerHTML += `<option>${i}월</option>`;
}