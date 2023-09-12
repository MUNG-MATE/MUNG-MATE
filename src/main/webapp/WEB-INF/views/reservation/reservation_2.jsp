<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<form action="2" method="post">

			<h2>방문 날짜</h2>
			<select id="selectDay"></select>
	
			<h2>방문 시간</h2>
			<select id="selectTime">
				<option>09:00</option>
				<option>10:00</option>
				<option>11:00</option>
				<option>12:00</option>
				<option>13:00</option>
				<option>14:00</option>
				<option>15:00</option>
				<option>16:00</option>
				<option>17:00</option>
				<option>18:00</option>
				<option>19:00</option>
				<option>20:00</option>
				<option>21:00</option>
			</select>
	
			<h2>방문 장소</h2>
			<input type="text" name="addr">
			<input type="text" name="addrDetail">
		
			<h2>연락처</h2>
			<input type="text">
	
			<h2 id="h2Note">참고 사항</h2>
			<div class="note">
				<textarea id="noteArea" placeholder="위 사항 외에도 펫시터가 주의해야할 점이나 특이사항이 있다면 이곳에 적어주세요."></textarea>
			</div>
			
			<input type="hidden" name="selectDay">
			
			<br>
		
			<div id="btnArea">
				<button class="btnStyle prev">&lt 이전</button>
				<button class="btnStyle next">다음 &gt</button>
			</div>
		</form>
    </section>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/reservation/reservation_2.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>