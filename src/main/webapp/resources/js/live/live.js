let serviceFlag = false;
let rsNo = 0;
let reservation;

if(lgMemberNo != '') {

	if(psFlag == 'Y') {
		document.getElementById("startStopButton").style.display = 'block';
	}

    fetch("/myPage/selectRsList?memberNo=" + lgMemberNo)
    .then(resp => resp.json())
    .then(rsList => {
        for(let rs of rsList) {

			// 오늘 날짜 구하기
            let year = new Date().getFullYear();
			let month = new Date().getMonth()+1;
			let day = new Date().getDate();
			if(month < 10) month = "0" + month;
			if(day < 10) day = "0" + day;
			let hours = new Date().getHours();
			if(hours < 10) hours = "0" + hours;
			let minutes = new Date().getMinutes();
			if(minutes < 10) minutes = "0" + minutes;
			let today = year+"-"+month+"-"+day+" "+hours+":"+minutes; // 2023-09-27 02:00
			let rsDate = rs.rsDate.substring(0,10) + " " + rs.rsStartDate;
			
			// 오늘이 예약 날짜/시간이면서 서비스 상태가 N인 경우
			if(today >= rsDate && rs.serviceState == 'N') {
				reservation = rs;

				document.getElementById("profile").setAttribute("src", reservation.petSitterList[0].profileImg);
				document.getElementById("petSitterNm").innerHTML = reservation.petSitterList[0].memberNm;

				rsNo = rs.rsNo;
				serviceFlag = true;
				return;

			} else { 
				serviceFlag = false;
			}
        }

		if(!serviceFlag) {
			document.getElementById("liveMadal").remove();
			document.getElementById("gotoLive").remove();
		}
    })
    .catch(err => {
        console.log(err);
    })
} else {
	document.getElementById("liveMadal").remove();
	document.getElementById("gotoLive").remove();
}

// live 버튼 클릭 시 보였다 안보였다 하기
const liveMadal = document.getElementById("liveMadal");
const gotoLive = document.getElementById("gotoLive");

if(gotoLive != null) {
	gotoLive.addEventListener("click", function () {
		if (liveMadal.style.display = "none") {
			liveMadal.style.display = "block";
			map.relayout();
		}
	})
}

window.addEventListener("keyup", e => {
	if(e.key == "Escape" && liveMadal.style.display == "block") {
		liveMadal.style.display = "none";
	}
})

// 문서가 로딩될때 
document.addEventListener("DOMContentLoaded", function () {

	// 스타트 버튼 토글 적용함 
	let startStopButton = document.getElementById('startStopButton');
	// 경과 시간
	let timeEle = document.getElementById('elapsedTime');
	let readyTime = document.getElementById('startTime');

	// 시작 시간 기본값 null 로컬에서 다시 값받아서 interval 돌리기위함
	let startTime = localStorage.getItem("startTime");
	let realTime = localStorage.getItem("realTime");
	var interval;

	// 서비스 시작한 시간
	function currentStartTime() {

		const currentStartTime = new Date;

		let hour = currentStartTime.getHours();
		let min = currentStartTime.getMinutes();
		let sec = currentStartTime.getSeconds();

		if (hour < 10) hour = "0" + hour;
		if (min < 10) min = "0" + min;
		if (sec < 10) sec = "0" + sec;

		realTime = hour + " : " + min + " : " + sec;

		localStorage.setItem("realTime", realTime)
	}

	function updateEleTime() {
		// 현재시간
		const currentTime = new Date;
		// 현재시간 - 시작시간 = 진행시간
		const elapsedTime = Math.floor((currentTime - startTime) / 1000);

		let hour = parseInt(elapsedTime / 3600);
		let min = parseInt((elapsedTime % 3600) / 60);
		let sec = elapsedTime % 60;

		if (hour < 10) hour = "0" + hour;
		if (min < 10) min = "0" + min;
		if (sec < 10) sec = "0" + sec;

		// 시간 출력 	초단위는 나중에 원래대로 변경할 예정!
		timeEle.textContent = hour + " : " + min + " : " + sec;
		localStorage.setItem("startTime", startTime)
		readyTime.innerHTML = localStorage.getItem("realTime");

	}

	function toggleTime() {

		if (!startTime) {
			currentStartTime();
			startService();
			startTime = Date.now();
			localStorage.setItem("startTime", startTime);
			interval = setInterval(updateEleTime, 1000);
			startStopButton.textContent = "서비스 종료";
			startStopButton.setAttribute("type", "submit");
			
		} else {
			if(confirm("서비스를 종료하고 라이브 카드를 작성하시겠습니까?")) {
				clearInterval(interval);
				startTime = 0;
				localStorage.removeItem("startTime");
				timeEle.textContent = "";

				location.href = "/live/card/insert?rsNo=" + rsNo +
								"&memberNm=" + reservation.petSitterList[0].memberNm + 
								"&profileImg=" + reservation.petSitterList[0].profileImg;
				// 이 주소는 라이브 카드 페이지로 변경하면 됩니다 !
			}
		}
	}

	if (startTime) {
		interval = setInterval(updateEleTime, 1000);
		startStopButton.textContent = "서비스 종료";
	} else {
		startStopButton.textContent = "서비스 시작";
	}
	startStopButton.addEventListener("click", toggleTime);
});


function closeBtn() { liveMadal.style.display = "none"; }

let sharedData = localStorage.getItem("startTime");

if(sharedData){ console.log("공유된 데이터 : " , sharedData); }
else{ console.log('공유된 데이터 없음'); }

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
function startService() {
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
					console.log("lat : " + lat);
					console.log("lon : " + lon);
	
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
	
				for (let location of locationList) {
					linePath.push(new kakao.maps.LatLng(location.lat, location.lon));
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
	
		fetch("/live/selectPetImage?rsNo=1")
		.then(resp => resp.json())
		.then(petImageList => {
	
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
			customOverlay.setMap(null);
			customOverlay.setMap(map);
	
			/* // 마커 디자인
			var imageSrc = petImageList[0].petProfile, // 마커이미지의 주소입니다
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
		
			marker.setMap(null);
			marker.setMap(map); */
		
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		})
		.catch(err => console.log(err))
	
	}
}