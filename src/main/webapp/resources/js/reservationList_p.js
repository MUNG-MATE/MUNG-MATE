function selectReservationList(){

    fetch("/selectList")
    .then(resp => resp.json())
    .then(reservationList => {

        const content = document.getElementById("content");
        
        for(let rList of reservationList){
            
        

        }
    })
    .catch(err =>  console.log(err));
}