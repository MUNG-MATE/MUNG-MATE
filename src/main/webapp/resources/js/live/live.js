// live 버튼 클릭 시 보였다 안보였다 하기
const liveMadal = document.getElementById("liveMadal");
const gotoLive = document.getElementById("gotoLive");

const runTime = document.getElementById("runTime").innerText;

let hour = new Date('2023-09-22 ' + runTime).getHours();
if(hour < 10) hour = "0" + hour;

let min = new Date('2023-09-22 ' + runTime).getMinutes();
if(min < 10) min = "0" + min;

let sec = new Date('2023-09-22 ' + runTime).getSeconds();
if(sec < 10) sec = "0" + sec;

gotoLive.addEventListener("click", function () {
	if (liveMadal.style.display = "none") {
		liveMadal.style.display = "block";
		return;
	}
})


// 문서가 로딩될때 
document.addEventListener("DOMContentLoaded", function() {
    
	// 스타트 버튼 토글 적용함 
    let startStopButton = document.getElementById('startStopButton');
	// 경과 시간
    let timeEle = document.getElementById('elapsedTime');
	
	// 시작 시간 기본값 null 로컬에서 다시 값받아서 interval 돌리기위함
    let startTime = localStorage.getItem("startTime");
	var interval;

    function updateEleTime() {
		// 현재시간
        const currentTime = Date.now();
		// 현재시간 - 시작시간 = 진행시간
        const elapsedTime = Math.floor((currentTime - startTime) / 1000);
		// 시간 출력 		
        timeEle.textContent = elapsedTime + '초';
		localStorage.setItem("startTime", startTime)
    }

	function toggleTime(){
		if (!startTime) {
            startTime = Date.now();
			localStorage.setItem("startTime", startTime);
            interval = setInterval(updateEleTime, 1000);
			startStopButton.textContent = "중지";
        } else {
            clearInterval(interval);
            startTime = 0;
			localStorage.removeItem("startTime");
            timeEle.textContent = "";
			startStopButton.textContent = "시작";
        }
	}

	if(startTime){
		interval = setInterval(updateEleTime, 1000); 
		startStopButton.textContent = "중지";
	} else {
		startStopButton.textContent = "시작";
	}
	
    startStopButton.addEventListener("click", toggleTime);

});

function closeBtn(){
	liveMadal.style.display = "none"
}

/*


=======
function closeBtn() {
	liveMadal.style.display = "none";
}



// ------------------------------------------------------------------------------

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		center: new kakao.maps.LatLng(37.499031, 127.032904), // 지도의 중심좌표
		level: 2
		// 지도의 확대 레벨 
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {

	if (petsitterFlag == 'Y') { // 펫시터인 경우
		getCurrentPlace();
		setInterval(() => getCurrentPlace(), 10000);

	} else { // 일반 회원인 경우
		selectLocation();
		setInterval(() => selectLocation(), 10000);
	}

	function getCurrentPlace() { // GeoLocation을 이용해서 접속 위치를 얻어오는 함수


		// 펫시터 현재 위치 DB 삽입
		navigator.geolocation.getCurrentPosition(function (position) {

			var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

			var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = ''; // 인포윈도우에 표시될 내용입니다

			const data = {
				"lat": lat, "lon": lon
			};

			fetch("/live/insertLocation?lat=" + lat + "&lon=" + lon)
				.then(resp => resp.text())
				.then(result => {
					if (result > 0) {

						selectLocation();

					} else {
						console.log("실패");
					}
				})
				.catch(err => console.log(err))

		})
	}

	// 펫시터 현재 위치 지도 표시
	function selectLocation() {

 
	   fetch("/live/selectLocation?rsNo=1")
		  .then(resp => resp.json())
		  .then(locationList => {
 
			 console.log(locationList);
			 var linePath = [];
 
			 /* for(let location of locationList) {
				linePath.push(new kakao.maps.LatLng(location.lat, location.lon));
			 } 
 
			 for (let i = 0; i < locationList.length - 1; i++) {
				linePath.push(new kakao.maps.LatLng(locationList[i].lat, locationList[i].lon));
			 }
 
			 linePath.push(new kakao.maps.LatLng(locationList[locationList.length - 1].lat, locationList[locationList.length - 1].lon));
 
			 // 마커와 인포윈도우를 표시합니다
			 var locPosition = new kakao.maps.LatLng(locationList[locationList.length - 1].lat, locationList[locationList.length - 1].lon);
 
			 displayMarker(locPosition);
 
			 // 지도에 표시할 선을 생성합니다
			 var polyline = new kakao.maps.Polyline({
				path: linePath, // 선을 구성하는 좌표배열 입니다
				strokeWeight: 5, // 선의 두께 입니다
				strokeColor: 'RGB(0, 30, 60)', // 선의 색깔입니다
				strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
				strokeStyle: 'solid' // 선의 스타일입니다
			 });
 
			 polyline.setPath(linePath);
			 polyline.setMap(map);
 
		  })
		  .catch(err => console.log(err))
=======

		fetch("/live/selectLocation?rsNo=1")
			.then(resp => resp.json())
			.then(locationList => {

				console.log(locationList);
				var linePath = [];

				/* for(let location of locationList) {
				   linePath.push(new kakao.maps.LatLng(location.lat, location.lon));
				} */

				for (let i = 0; i < locationList.length - 1; i++) {
					linePath.push(new kakao.maps.LatLng(locationList[i].lat, locationList[i].lon));
				}

				linePath.push(new kakao.maps.LatLng(locationList[locationList.length - 1].lat, locationList[locationList.length - 1].lon));

				// 마커와 인포윈도우를 표시합니다
				var locPosition = new kakao.maps.LatLng(locationList[locationList.length - 1].lat, locationList[locationList.length - 1].lon);

				displayMarker(locPosition);

				// 지도에 표시할 선을 생성합니다
				var polyline = new kakao.maps.Polyline({
					path: linePath, // 선을 구성하는 좌표배열 입니다
					strokeWeight: 5, // 선의 두께 입니다
					strokeColor: 'RGB(0, 30, 60)', // 선의 색깔입니다
					strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle: 'solid' // 선의 스타일입니다
				});

				polyline.setPath(linePath);
				polyline.setMap(map);

			})
			.catch(err => console.log(err))

	}

} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

	displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {

	// 마커 디자인
	var imageSrc = '/resources/images/user.png', // 마커이미지의 주소입니다
		imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		markerPosition = locPosition; // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position: markerPosition,
		image: markerImage // 마커이미지 설정 
	});

	// // 마커를 생성합니다
	// var marker = new kakao.maps.Marker({
	//    map : map,
	//    position : locPosition
	// });

	marker.setMap(map);

	// 지도 중심좌표를 접속위치로 변경합니다
	map.setCenter(locPosition);

