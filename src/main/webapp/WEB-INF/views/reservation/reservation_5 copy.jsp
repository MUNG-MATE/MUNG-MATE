<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_5.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
    <h1 id="resTitle">결제</h1>
    <h4 id="resSubTitle">서비스 정보를 확인하고 결제 방법을 선택해주세요.</h4>

    <h2>반려견 정보</h2>
    <div class="aaa">

        <div class="petArea">
            <div id="petImageArea">
                <img src="/resources/images/reservation/happy.jpg" id="aaaImage">
            </div>
            <div id="dogInfo">
                <ul>
                    <li>요청 서비스 :</li>
                    <li>방문 일정  :</li>
                    <li>방문 장소  :</li>
                    <li>반려견 이름 :</li>
                </ul>
            </div>
            <div id="textArea">

            </div>
            

        </div>
            
        
    </div>


    <div class="">
        <h2>결제 정보</h2>
        <span>결제 금액</span>
        <h3>19,500원</h3>

        <span>결제 방법</span>
        <ul id="payment">
            <li>신용카드</li>
            <li>계좌이체</li>
            <li>무통장 입금</li>
            <li>카카오페이</li>
        </ul>
    </div>


    <div id="btnArea">
        <button class="btnStyle prev">&lt 이전</button>
        <button class="btnStyle next">결제</button>
    </div>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</html>