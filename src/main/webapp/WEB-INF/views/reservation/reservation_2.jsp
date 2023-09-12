<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_2.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">예약 서비스[2/4]</h1>
   	<h4 id="resSubTitle">언제/어디로 방문할까요?</h4>
   	
	<section id="container">
		<form action="2" method="post">

			<h2>방문 날짜</h2>
			<div>
				<input type="text" id="input_date" class="rs_input" placeholder="방문 날짜를 선택해주세요." readonly/>
				<div id="div_calendar">
					<div id="date_controller">
						<button type="button" class="month-btn" onclick="changeMonth(-1);">
							<i class="fa fa-chevron-left"></i>
						</button>
						<input type="number" id="year" class="form-control" onchange="changeYear();">
						<select dir="rtl" id="month" class="form-control" onchange="changeMonth();">
							<option value="1">1월</option>
							<option value="2">2월</option>
							<option value="3">3월</option>
							<option value="4">4월</option>
							<option value="5">5월</option>
							<option value="6">6월</option>
							<option value="7">7월</option>
							<option value="8">8월</option>
							<option value="9">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
						</select>
						<button type="button" class="month-btn" onclick="changeMonth(1);">
							<i class="fa fa-chevron-right"></i>
						</button>
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="day-of-week">일</th>
								<th class="day-of-week">월</th>
								<th class="day-of-week">화</th>
								<th class="day-of-week">수</th>
								<th class="day-of-week">목</th>
								<th class="day-of-week">금</th>
								<th class="day-of-week">토</th>
							</tr>
						</thead>
						<tbody id="tb_tbody"></tbody>
					</table>
				</div>
			</div>

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
			<input type="text" name="addr" class="rs_input" placeholder="주소">
			<input type="text" name="addrDetail" class="rs_input" placeholder="상세 주소">
		
			<h2>연락처</h2>
			<input type="text" class="rs_input" placeholder="'-' 제외 후 입력해주세요.">
	
			<h2 id="h2Note">참고 사항</h2>
			<div class="note">
				<textarea id="noteArea" placeholder="위 사항 외에도 펫시터가 주의해야할 점이나 특이사항이 있다면 이곳에 적어주세요."></textarea>
			</div>
			
			<input type="hidden" name="selectDay" class="rs_input">
			
			<br>
		
			<div id="btnArea">
				<button class="btnStyle prev">&lt 이전</button>
				<button class="btnStyle next">다음 &gt</button>
			</div>
		</form>
    </section>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/reservation/reservation_2.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>