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