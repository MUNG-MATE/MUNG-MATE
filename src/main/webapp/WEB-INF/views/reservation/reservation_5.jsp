<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_5.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
    <h1 id="resTitle">결제</h1>
    <h4 id="resSubTitle">서비스 정보를 확인하고 결제 방법을 선택해주세요.</h4>
    ${rs}
    <!-- ${rs.petSitterNo} -->
    
    
    <form action="5" method="post" id="reservationForm">
        <section id="container">
            <div class="containerDiv left">
                <h2>서비스 정보</h2>
                <table>
                    <tr>
                        <th>요청 서비스</th>
                        <td><div>${rs.serviceType} [${rs.serviceTime}]</div></td>
                    </tr>
                    <tr>
                        <th>방문 일정</th>
                        <td><div>${rs.rsDate} ${rs.rsStartDate}</div></td>
                    </tr>
                    <tr>
                        <!-- <c:set var = "addr" value =  "${fn:split(rs.rsAddress, '^^^')}"/> -->
                        <th>방문 장소</th>
                        <td><div>${rs.rsAddress}</div></td>
                    </tr>
                   
                    <tr>
                        <th>펫 시터</th>
                        <td>
                            <div id="petsitterArea">
                                <div class="imageArea">
                                    <img src="${petSitter.profileImg}" class="profileImage">
                                </div>
                                <div class="info">
                                    <div class="petsitterName">${petSitter.memberNm} 펫시터</div>
                                    <div class="point">${petSitter.location}</div>
                                    <a href="#" class="review">${petSitter.memberTel}</a>
                                </div>
                            </div>
                        </td>

                    </tr>

                    <tr>
                        
                        <th>결제 금액</th>
                        <td><div id="payment_amount"></div></td>
                    </tr>
                </table>
            </div>
            <div class="containerDiv right">

                <c:forEach var="i" items="${pet}">

                    <div class="backgroundArea">
        
                        <div id="petProfile"><img src="${i.petProfile}" id="petProfile"></div>
                        <input type="hidden" name="petNo" class="petNo" value="${i.petNo}">
                        ${i.petName}
                        
                    </div>
                </c:forEach>

                <!-- <h2>결제 정보</h2>
                <span>결제 금액</span>
                <h3 id="payment_amount">${rs.servicePrice}</h3>
    
                <span>결제 방법</span>
                <ul id="payment">
                    <li>신용카드</li>
                    <li>계좌이체</li>
                    <li>무통장 입금</li>
                    <li>카카오페이</li>
                </ul> -->
            </div>

            
        </section>
        
        <div class="petListArea">
            

        </div>
        <div id="btnArea">
            <button type="button" class="btnStyle prev" onclick="history.go(-3)">&lt 이전</button>
            <button type="button" class="btnStyle next" id="creditBtn">결제</button>
        </div>

        <input type="hidden" name="servicePrice" id="selectMoney" value="${rs.servicePrice}" >
        <input type="hidden" name="serviceTime" id="selectTime" value="${rs.serviceTime}">
        <input type="hidden" name="serviceType" id="selectedService" value="${rs.serviceType}">
        <input type="hidden" name="rsDate" id="selectDate" value="${rs.rsDate}">
        <input type="hidden" name="rsStartDate" id="selectStartDate" value="${rs.rsStartDate}">
        <input type="hidden" name="petSitterNo" id="selectPetSitterNo" value="${rs.petSitterNo}">
        <input type="hidden" name="serviceNo" id="serviceNo" value="${rs.serviceNo}">
        <input type="hidden" name="rsAddress" id="selectAddr" value="${rs.rsAddress}">
    </form>

    <script src="/resources/js/reservation/reservation_5.js"></script>
    <script>
        const rsServicePrice = Number("${rs.servicePrice}");
        const memberNo = "${loginMember.memberNo}";
    </script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>