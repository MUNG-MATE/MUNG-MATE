const management = document.querySelector("#management");
const managementType = document.querySelector("#managementType");
const managementSearch = document.querySelector("#managementSearch");

const options = document.querySelectorAll("#managementType > option");

(()=>{
    const params = new URL(location.href).searchParams;

    const key = params.get("managementType"); 
    const query = params.get("managementSearch");

    if(key !=null){ // 검색을 했을 때

        managementSearch.value= query; // 검색어를 화면에 출력

        // option태그를 하나씩 순차 접근해서 valuerk key랑 같으면
        // selected 속성 추가

        for(let op of options){
            if(op.value == key){
                op.selected =true;
            }

        }
    }

})();

const deleteButton = document.getElementById("delete");
const checkbox = document.getElementsByName("checkbox")
let checkarr = [];

deleteButton.addEventListener("click",function(){
    
    for(let i=0; i<checkbox.length; i++){

        if(checkbox[i].checked == true){
            checkarr.push(checkbox[i].value);
        }
    }

    fetch("/Administrator/management",{
        method : "delete",
        headers : {"Content-Type" : "application/json"},
        body : checkarr
    })
    .then( resp => resp.text())
    .then(result =>{
        if(result >0){
            alert("탈퇴")
        }else{
            alert("실패")
        }
    })
    .catch(e => console.log(err));
    
})