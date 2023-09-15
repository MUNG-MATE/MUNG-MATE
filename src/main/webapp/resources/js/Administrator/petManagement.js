// const box = document.getElementsByClassName("petsitterBox")

//     const sc = window.scrollY;
//     let boxCount = 2;
//     let isAnimating = false;
//     for(let i=2; i<box.length; i++){
//         box[i].style.display="none";
//     }

//     window.addEventListener('scroll', function(){
//         console.log( window.scrollY )
//         console.log(window.innerHeight)
//         console.log(document.body.offsetHeight) 
        
//         if( (window.innerHeight + window.scrollY + 210) >=document.body.offsetHeight){
            
//             if(boxCount < box.length){
//                 box[boxCount].style.display="flex";    
//                 boxCount++;
//                 console.log(boxCount);
//             }

//         }    
// });
const box = document.getElementsByClassName("petsitterBox");

let boxCount = 0; // 초기에는 0으로 설정

for (let i = 0; i < 2; i++) {
  if (boxCount < box.length) {
    box[boxCount].style.opacity = "1"; // 초기에 2개의 상자를 보이게 함
    boxCount++;
  }
}

window.addEventListener('scroll', function() {
  console.log(window.scrollY);
  console.log(window.innerHeight);
  console.log(document.body.offsetHeight);

  if ((window.innerHeight + window.scrollY + 1600) >= document.body.offsetHeight) {
    if (boxCount < box.length) {
      box[boxCount].style.opacity = "1"; // 투명도를 조절하여 부드럽게 나타나게 함
      boxCount++;
      console.log(boxCount);
    }
  }
});



function deleteList(e){

    if( confirm("펫시터자격을 정말 없애시겠습니까?")){
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
if(day < 10 ) day = "0"+month; day;

let sysdate = year+"-"+month+"-"+day;

const span = document.getElementsByClassName("sysdate");

for(let i=0; i<span.length; i++){
    span[i].innerText= sysdate;
}
    

