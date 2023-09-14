const petListdiv = document.getElementById("petListdiv"); // 제일 큰 부분


function deletePet(petNo,petName,petType,petOption,petGender,petProfile){

    
    fetch("/myPage/petInfo/delete", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : petNo
    })
    .then(resp => resp.text())
    .then(result => {
        if(result > 0){
            alert("소중한 반려견 정보가 삭제되었습니다.");
            
            location.reload(true);

        }
    })
    .catch(e => {console.log(e)});
    
}