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

management.addEventListener("submit", e=>{

    if(managementSearch.value.trim().length == 0){ 
        e.preventDefault(); 

        location.href = location.pathname
        // location.pathname : 쿼리스트링을 제외한 실제 주소
        

    }



})