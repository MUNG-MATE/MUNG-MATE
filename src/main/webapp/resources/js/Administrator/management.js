function managementList(){
    fetch("/Administrator/management/delete")
    .then( resp => resp.json())
    .then(manageList =>{

        const tbody = document.getElementById("tbody");
        tbody.innerHTML ="";

        for(let mList of manageList){
            
            const tr = document.createElement("tr");
            const td1 = document.createElement("td");
            const td2 = document.createElement("td");
            const td3 = document.createElement("td");
            const td4 = document.createElement("td");
            const td5 = document.createElement("td");
            const td6 = document.createElement("td");
            const td7 = document.createElement("td");
            const td8 = document.createElement("td");

            const input = document.createElement("input");
            input.setAttribute("type","checkbox");
            input.setAttribute("name","checkbox");
            input.setAttribute("value",mList.memberNo);


            if(mList.petsitterFlag == 'Y') td7.classList.add("green");
            if(mList.sessionFlag == 'Y') td8.classList.add("red");
            
            
            td1.innerText = mList.memberNo;
            td2.appendChild(input);
            td3.innerText = mList.memberEmail;
            td4.innerText = mList.memberName;
            td5.innerText = mList.memberTel;
            td6.innerText = mList.enrollDate;
            td7.innerText = mList.petsitterFlag;
            td8.innerText = mList.sessionFlag;

            tr.append(td1,td2,td3,td4,td5,td6,td7,td8);
            tbody.append(tr);
        }

    })
    .catch(e => console.log(e));
}


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
const checkbox = document.getElementsByName("checkbox");

const flag = document.getElementsByName("flag");
const petflag = document.getElementsByName("petflag");

let checkarr = [];

for(let i=0; i<flag.length; i++){

    if(flag[i].value =='Y'){
        flag[i].previousElementSibling.classList.add("red");
    }
    if(petflag[i].value =='Y'){
        petflag[i].previousElementSibling.classList.add("green");
    }
}   

deleteButton.addEventListener("click",function(){

    let flags = false;
   
    for(let i=0; i<checkbox.length; i++){
        
        if(checkbox[i].checked){
            flags = true;
            checkarr.push(checkbox[i].value);

            if(flag[i].value !='Y'){

                fetch("/Administrator/management",{
                    method : "put",
                    headers : {"Content-Type" : "application/json"},
                    body : JSON.stringify(checkarr)
                })
                .then( resp => resp.text())
                .then(result =>{
            
                    if(result >0){
                        alert("탈퇴")
                        location.href =location;
                        //managementList()
                    }else{
                        alert("실패")
                    }
                })
                .catch(e => console.log(e));
            }else{
                alert("이미 탈퇴된회원입니다.")
                checkbox[i].checked =false;
            }
        }
    }

    if(!flags) alert("회원을 선택한후 탈퇴버튼을 눌러주세요!")
    
})

