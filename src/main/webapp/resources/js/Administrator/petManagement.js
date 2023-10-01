window.onload = function(){
  setTimeout(function(){
    scrollTo(0,0);
  },100)
};

/* const box = document.getElementsByClassName("petsitterBox");

let boxIndex = 2; 
let isAnimating = false; 

function revealBox(index) {
  if (index < box.length && !isAnimating) {
    isAnimating = true;
    box[index].style.opacity = "1"; 

    setTimeout(() => {
      isAnimating = false; 
    }, 1000); 
  }
}

box[0].style.opacity = "1";
box[1].style.opacity = "1";

window.addEventListener('scroll', function() {
  console.log(window.scrollY); 
  console.log(window.innerHeight); 
  console.log(document.body.offsetHeight); 
  if ((window.innerHeight *400 *boxIndex)>=document.body.offsetHeight) {
    console.log("값=="+ (window.innerHeight *300 *boxIndex))
    if (boxIndex === 0 || !isAnimating) {
      revealBox(boxIndex);
      boxIndex++;
    }
  }
}); */

const box = document.getElementsByClassName("petsitterBox");

let boxIndex = 0;
let isAnimating = false;

function revealBox(index) {
  if (index < box.length && !isAnimating) {
    isAnimating = true;
    box[index].style.opacity = "1";

    setTimeout(() => {
      isAnimating = false;
      boxIndex++; // 다음 상자를 나타내기 위해 인덱스를 증가
      revealBox(boxIndex); // 다음 상자를 나타냅니다.
    }, 650);
  }
}

window.addEventListener('scroll', function() {
  console.log(window.scrollY); 
  console.log(window.innerHeight); 
  console.log(document.body.offsetHeight); 

  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    // 스크롤이 맨 아래에 도달하면 다음 상자를 나타냅니다.
    revealBox(boxIndex);
  }
});

// 초기에 첫 번째 상자를 보이게 함
revealBox(boxIndex);


function deleteList(e){

    if( confirm("해당 펫시터의 자격을 없애시겠습니까?")){
        console.log(e.value);
        fetch("/Administrator/petManagement",{
            method : "put",
            headers : {"Content-Type" : "application/json"},
            body : e.value
        })
        .then( resp => resp.text())
        .then(result =>{
            console.log("ttt=="+result);
            if(result >0){
                alert("탈퇴")
                location.href =location;
            }else{
                alert("실패")
            }
        })
        .catch(e => console.log(e));

    }


}

let date = new Date();
let year = date.getFullYear();
let month = date.getMonth()+1;
let day = date.getDate(); 

if(month < 10 ) month = "0"+month; month;
if(day < 10 ) day = "0"+day; day;

let sysdate = year+"-"+month+"-"+day;

const span = document.getElementsByClassName("sysdate");

for(let i=0; i<span.length; i++){
    span[i].innerText= sysdate;
}
    

