// 시작시간
function startTime() {
	const startTime = document.getElementById("startTime")
	startTime.innerHTML = currentTime();
 }
 
 // 시작시간
 function currentTime() {
	const currentTime = new Date();
 
	let hour = currentTime.getHours();
	let min = currentTime.getMinutes();
	let sec = currentTime.getSeconds();
 
	// 만약 10보다 작은 숫자라면 0을 붙혀서
	if (hour < 10) hour = "0" + hour;
	if (min < 10) min = "0" + min;
	if (sec < 10) sec = "0" + sec;
 
	return hour + " : " + min + " : " + sec;
 }
 
 
 // 진행 중
 function runTime() {
	console.log("D")
	const runTime = document.getElementById("runTime")
	runTime.innerHTML = "00 : 00 : 00";
	ingTime();
 }
 
 
 // 진행 중
 function ingTime() {
	const runTime = document.getElementById("runTime")
 
	let hour = "00";
	let min = "00";
	let sec = "00";
 
	runTime.innerHTML = hour + " : " + min + " : " + sec;
 
	setInterval(function () {
	   sec++;
	   if(sec < 10){
		  sec = "0" + sec;
	   }
	   
	   if (sec === 60) {
		  sec = "00";
		  min++;
		  
		  if(min < 10){
			 min = "0" + min;
		  }
		  
		  if (min === 60) {
			 min = "00";
			 hour++;
 
			 if(hour < 10){
		  hour = "0" + hour;
	   }
		  }
		  
	   }
 
	   
 
	   const Time = hour + " : " + min + " : " + sec;
	   return runTime.innerHTML = Time;
	}, 1000);
 
 }
 
 
 
 
 
 
 
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
	var imageSrc = '/resources/images/1.gif', // 마커이미지의 주소입니다
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
 }
 
 
 