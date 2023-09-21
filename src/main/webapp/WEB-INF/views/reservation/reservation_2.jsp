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
	<h1 id="resTitle">예약 서비스[2/3]</h1>
   	<h4 id="resSubTitle">언제/어디로 방문할까요?</h4>
	<section id="container">
		<form action="2" method="post" id="reservationForm">

			<h2>방문 날짜</h2>
			<div>
				<input type="text" id="input_date" name="rsDate" class="rs_input" placeholder="방문 날짜를 선택해주세요." readonly/>
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
			<select id="selectTime" name="rsStartDate">
				<option>09:00</option>
				<option>09:30</option>
				<option>10:00</option>
				<option>10:30</option>
				<option>11:00</option>
				<option>11:30</option>
				<option>12:00</option>
				<option>12:30</option>
				<option>13:00</option>
				<option>13:30</option>
				<option>14:00</option>
				<option>14:30</option>
				<option>15:00</option>
				<option>15:30</option>
				<option>16:00</option>
				<option>16:30</option>
				<option>17:00</option>
				<option>17:30</option>
				<option>18:00</option>
				<option>18:30</option>
				<option>19:00</option>
				<option>19:30</option>
				<option>20:00</option>
				<option>20:30</option>
				<option>21:00</option>
			</select>


			<c:set var = "addr" value =  "${fn:split(loginMember.memberAddress, '^^^')}"/>


			<h2><label for="rsAddress">방문 장소</label></h2>

			<input type="text" name="rsAddress" id="rs_input0" placeholder="주소" onclick="sample6_execDaumPostcode()">
			<input type="text" name="rsAddress" id="rs_input1" placeholder="상세 주소" >
		



			<h2>연락처</h2>
			<input type="text" class="rs_input" placeholder="'-' 제외 후 입력해주세요." value="${loginMember.memberTel}">
			
			
			<br>
		
			<div id="btnArea">
				<button type="button" class="btnStyle prev" onclick="history.back()">&lt 이전</button>
				<button id="nextBtn" class="btnStyle next">다음 &gt</button>
			</div>

			<input type="hidden" name="servicePrice" id="selectMoney" value="${rs.servicePrice}" >
			<input type="hidden" name="serviceTime" id="selectTime" value="${rs.serviceTime}">
			<input type="hidden" name="serviceType" id="selectedService" value="${rs.serviceType}">
			<input type="hidden" name="serviceNo" id="serviceNo" value="${rs.serviceNo}">

		</form>
    </section>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/reservation/reservation_2.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
        function sample6_execDaumPostcode() {

            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('rs_input0').value = data.zonecode;
                    document.getElementById("rs_input0").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("rs_input1").focus();
                }
            }).open();
        }
    </script>


</body>
</html>