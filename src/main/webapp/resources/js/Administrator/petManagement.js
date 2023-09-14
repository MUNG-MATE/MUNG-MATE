const box = document.getElementsByClassName("petsitterBox")

    const sc = window.scrollY;
    let boxCount = 2;
    for(let i=2; i<box.length; i++){
        box[i].style.display="none";
    }

    window.addEventListener('scroll', function(){
        console.log( window.scrollY )
        console.log(window.innerHeight)
        console.log(document.body.offsetHeight) 
        
        if( (window.innerHeight + window.scrollY + 210) >=document.body.offsetHeight){
            
            if(boxCount < box.length){
                box[boxCount].style.display="flex";    
                boxCount++;
                console.log(boxCount);
            }
            
        }    
});

function deleteList(e){
    fetch("/Administrator/petManagement",{
        method : "put",
        header : {"Content-Type" : "application/json"},
        body : e.value
    })
    .then( resp => resp.text())
    .then(result =>{
        if(result >0){
            alert("탈퇴")
            location.href =location;
        }else{
            alert("실패")
        }
    })
    .catch(e => console.log(e));
    
}
