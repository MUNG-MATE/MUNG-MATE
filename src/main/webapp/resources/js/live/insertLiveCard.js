// // LIVE 버튼 삭제
// gotoLive.remove();

// 이미지 파일 추가
const inputImage = document.getElementById("inputImage");
const petImage = document.getElementById("petImage");
let deleteCheck = -1;

const startTime = document.getElementById("startTime");
const endTime = document.getElementById("endTime");

let localTime = localStorage.realTime.substring(0,2);

if(localTime > 12) {
    localTime = localTime - 12;
    localTime = "오후 " + localTime;
} else {
    localTime = "오전 " + localTime;
}

let currentMinutes = new Date().getMinutes();
if(currentMinutes < 10) currentMinutes = "0" + currentMinutes;

startTime.innerText = localTime + " : " + localStorage.realTime.substring(5,7);
document.getElementById("inputStartTime").value = localTime + " : " + localStorage.realTime.substring(5,7);
endTime.innerText = guessAmPm(new Date().getHours()) + " : " + currentMinutes;
document.getElementById("inputEndTime").value = guessAmPm(new Date().getHours()) + " : " + currentMinutes;

function guessAmPm(localTime) {
    if(localTime > 12) {
        localTime = localTime - 12;
        if(localTime < 10) localTime = "0" + localTime;
        localTime = "오후 " + localTime;

    } else {
        if(localTime < 10) localTime = "0" + localTime;
        localTime = "오전 " + localTime;
    }

    return localTime;
}

inputImage.addEventListener("change", e => {
    const maxSize = 1 * 1024 * 1024 * 5; // 이미지 최대 크기 : 5MB

    const file = e.target.files[0];

    if(file == undefined) {
        console.log("파일 선택이 취소됨");
        deleteCheck = -1; 
        petImage.setAttribute("src", '/resources/images/reservation/inputpetimage.png');
        return;
    }

    if(file.size > maxSize) { // 선택된 파일의 크기가 최대 크기를 초과한 경우
        alert("5MB 이하의 이미지를 선택해주세요.");
        inputImage.value = "";
        deleteCheck = -1;
        petImage.setAttribute("src", '/resources/images/reservation/inputpetimage.png');
        return;
    }

    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = e => {
        petImage.setAttribute("src", e.target.result);
        deleteCheck = 1;
    }

});

const insertForm = document.getElementById("insertForm");
const inputContent = document.getElementById("inputContent");

insertForm.addEventListener("submit", e => {
    if(inputContent.value.trim() == "") {
        alert("내용을 입력해주세요.");
        inputContent.value = "";
        inputContent.focus();
        e.preventDefault();
        return;
    }

    if(deleteCheck == -1) {
        alert("사진을 선택헤주세요.");
        e.preventDefault();
        return;
    }
})

const params = new URL(location.href).searchParams;
const reservationNo = params.get("rsNo");

fetch("/live/selectLocation?rsNo=" + reservationNo)
.then(resp => resp.json())
.then(locationList => {

    // 지도에 선을 표시할 좌표 리스트
    var linePath = [];
    
    // DB에 저장된 좌표를 좌표 리스트에 삽입
    for (let location of locationList) {
        linePath.push(new kakao.maps.LatLng(location.lat, location.lon));
    }
    console.log(linePath);
    // 지도에 표시할 선을 생성합니다
    var polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 5, // 선의 두께 입니다
        strokeColor: 'RGB(0, 30, 60)', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });
    
    //polyline.setPath(linePath);
    polyline.setMap(map);
    
    // 마커와 인포윈도우를 표시합니다
    var locPosition = new kakao.maps.LatLng(locationList[locationList.length - 1].lat,
                                            locationList[locationList.length - 1].lon);
    displayMarker(locPosition);
})
.catch(err => console.log(err))

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {
	
    fetch("/live/selectPetImage?rsNo=" + reservationNo)
    .then(resp => resp.json())
    .then(petImageList => {

        // 커스텀 오버레이 이미지
        var content =
        `<div>
        <img src="${petImageList[0].petProfile}" id="petProfile">
        <div id="petName">${petImageList[0].petName}</div>
        </div>`
        
        // 커스텀 오버레이를 생성합니다
        var customOverlay = new kakao.maps.CustomOverlay({
            position: locPosition,
            content: content,
            yAnchor: 1.0
        });
        
        // 커스텀 오버레이를 지도에 표시합니다
        customOverlay.setMap(map);
    
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    })
    .catch(err => console.log(err))

}