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
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
    <h1 id="resTitle">결제</h1>
    <h4 id="resSubTitle">서비스 정보를 확인하고 결제 방법을 선택해주세요.</h4>
    <!-- ${rs}
    ${rs.petSitterNo} -->
    
    
    <form action="5" method="post">
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
                        <c:set var = "addr" value =  "${fn:split(loginMember.memberAddress, '^^^')}"/>
                        <th>방문 장소</th>
                        <td><div>${addr[1]} ${addr[2]}</div></td>
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
                </table>
            </div>
            <div class="containerDiv right">
                <h2>결제 정보</h2>
                <span>결제 금액</span>
                <h3 id="payment_amount">${rs.servicePrice}</h3>
    
                <span>결제 방법</span>
                <ul id="payment">
                    <li>신용카드</li>
                    <li>계좌이체</li>
                    <li>무통장 입금</li>
                    <li>카카오페이</li>
                </ul>
            </div>
        </section>
        <div class="petListArea">
            <c:forEach var="i" items="${pet}">

                <div class="backgroundArea">
    
                    <table>
                        <tr>
                            <th>펫 프로필</th>
                            <td><div id="petProfile"><img src="${i.petProfile}" id="petProfile"></div></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><div>${i.petName}</div></td>
                        </tr>
                        <tr>
                            <th>품종</th>
                            <td><div>${i.petType}</div></td>
                        </tr>
                        <tr>
                            <th>생년월</th>
                            <td><div>${i.petBirth}</div></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td><div>${i.petGender}</div></td>
                        </tr>
                    </table>
                </div>
            </c:forEach>

        </div>
        <div id="btnArea">
            <button type="button" class="btnStyle prev" onclick="history.go(-3)">&lt 이전</button>
            <button class="btnStyle next">결제</button>
        </div>

        <input type="hidden" name="servicePrice" id="selectMoney" value="${rs.servicePrice}" >
        <input type="hidden" name="serviceTime" id="selectTime" value="${rs.serviceTime}">
        <input type="hidden" name="serviceType" id="selectedService" value="${rs.serviceType}">
        <input type="hidden" name="rsDate" value="${rs.rsDate}">
        <input type="hidden" name="rsStartDate" value="${rs.rsStartDate}">
        <input type="hidden" name="petSitterNo" id="selectPetSitterNo">
    </form>

    <script src="/resources/js/reservation/reservation_5.js"></script>
    <script>
        const rsServicePrice = Number("${rs.servicePrice}");
    </script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>