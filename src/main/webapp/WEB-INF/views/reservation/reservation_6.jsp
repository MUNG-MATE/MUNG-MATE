<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_6.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
    <section id="container">
        <i class="fa-solid fa-circle-check fa-5x"></i>
        <br>
        <strong>예약 완료</strong>
        <p id="message">${loginMember.memberNickname} 고객님! 멍메이트와 함께 해주셔서 감사합니다.
아래 버튼으로 연결되는 마이페이지 예약 확인 화면을 이용해
예약 정보 확인 하실 수 있습니다.</p>
        <div id="reservationBtn">
            <a href="/myPage/selectRsList">예약 관리</a>
        </div>
    </section>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>