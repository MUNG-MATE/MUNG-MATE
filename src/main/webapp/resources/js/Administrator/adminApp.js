

function selectApp(){

    $.ajax({
        url :"/admin/selectbookList",
        type : "get",
        dataType : "JSON",
        success : function(appList){

            

        },
        error : function(){
            console.log("에러발생!!!");    
        }
    })



}







function insertApp(appNo, appLocation, appEx, appDate, memberEmail){

    
    const data = {'appNo' : appNo
                 ,'appLocation' : appLocation
                 ,'appEx' : appEx
                 ,'appDate' : appDate
                 ,'memberEmail' : memberEmail}

        if (confirm("정말 수락하시겠습니까?")) {

            fetch("/petsitter/admin/petsitterInsert", {
                method : "POST",
                headers : {"Content-Type" : "application/json"},
                body : JSON.stringify(data)
            })
            .then(resp => resp.text())
            .then(result => {
                console.log(result);
            })
            .catch(err => {
                console.log(err);
            })
            
        }

}
