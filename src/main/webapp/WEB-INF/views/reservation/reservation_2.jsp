<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_2.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">예약 서비스[2/4]</h1>
   	<h4 id="resSubTitle">언제/어디로 방문할까요?</h4>
   	
	<section id="container">
    	<h2>방문 날짜</h2>
    	<select id="selectDay"></select>

	    <h2>방문 시간</h2>
	    <select>
	        <option>오전 09:00</option>
	        <option>오전 10:00</option>
	        <option>오전 11:00</option>
	        <option>오후 12:00</option>
	        <option>오후 01:00</option>
	        <option>오후 02:00</option>
	        <option>오후 03:00</option>
	        <option>오후 04:00</option>
	        <option>오후 05:00</option>
	        <option>오후 06:00</option>
	        <option>오후 07:00</option>
	        <option>오후 08:00</option>
	        <option>오후 09:00</option>
	    </select>
	
	    <h2>방문 장소</h2>
	    <input type="text" name="addr">
	    <input type="text" name="addrDetail">
	
	    <h2>연락처</h2>
	    <input type="text">
	
	    <br>
	
	    <div id="btnArea">
	        <button class="btnStyle prev">&lt 이전</button>
	        <button class="btnStyle next">다음 &gt</button>
	    </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/reservation/reservation_2.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>