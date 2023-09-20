<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="selectReserveList" value="${map.selectReserveList}"/>

<c:set var="paymentW" value="${map.paymentW}"/>
<c:set var="paymentC" value="${map.paymentC}"/>
<c:set var="todayR" value="${map.todayR}"/>
<c:set var="tomorrowR" value="${map.tomorrowR}"/>
<c:set var="endR" value="${map.endR}"/>
<c:set var="lastMonthR" value="${map.lastMonthR}"/>
<c:set var="thisMonthR" value="${map.thisMonthR}"/>
<c:set var="lastMonthSales" value="${map.lastMonthSales}"/>
<c:set var="thisMonthSales" value="${map.thisMonthSales}"/>
<c:set var="F_totalSales" value="${map.F_totalSales}"/>
<c:set var="totalSales" value="${map.totalSales}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<link rel="stylesheet" href="/resources/css/Administrator/reserve.css">
</head>
<body>	
     <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
	<main>
        <section>
            <h3>2023년 00 월 00 일 기준 예약현황</h3>
            <table>
                <tbody>
                    <tr>
                        <td>결제 대기중 예약</td>
                        <td>${paymentW}건</td>
                        <td>지난달 예약</td>
                        <td>${lastMonthR}건</td>
                    </tr>

                    <tr>
                        <td>결제 완료된 예약</td>
                        <td>${paymentC}건</td>
                        <td>이번달 예약</td>
                        <td>${thisMonthR}건</td>
                    </tr>

                    <tr>
                        <td>오늘 예약</td>
                        <td>${todayR}건</td>
                        <td>지난달 매출</td>
                        <td>${lastMonthSales}원</td>
                    </tr>

                    <tr>
                        <td>내일 예약</td>
                        <td>${tomorrowR}건</td>
                        <td>이번달 매출</td>
                        <td>${thisMonthSales}원</td>
                    </tr>

                    <tr>
                        <td>종료된 예약</td>
                        <td>${endR}건</td>
                        <td>총매출</td>
                        <td>${totalSales}원</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section>
            <table>
                <thead>
                    <th>No</th>
                    <th>▼</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>예약일</th>
                    <th>예약금액</th>
                    <th>결제상태</th>
                    <th>예약상태</th>
                </thead>
                <tbody>
                    <c:forEach items="${selectReserveList}" var="selectReserveList">
                    <tr>
                        <td>${selectReserveList.rsNo}</td>
                        <td><input type="checkbox" class="check" name="checkbox" value="${selectReserveList.rsNo}"></td>
                        <td>${selectReserveList.memberEmail}</td>
                        <td>${selectReserveList.memberName}</td>
                        <td>${selectReserveList.memberTel}</td>
                        <td>${selectReserveList.rsDate}</td>
                        <td>${selectReserveList.servicePrice} 원</td>
                        <td>${selectReserveList.paySt}</td>
                        <td>${selectReserveList.petsitterSt}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

         <section>
            <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/Administrator/reserve?cp=1">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/Administrator/reserve?cp=${pagination.prevPage}">&lt;</a></li>

                   
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
        
                            <c:choose>
                               <c:when test="${ i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                               </c:when>
                            
                               <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/Administrator/reserve?cp=${i}">${i}</a></li>
                               </c:otherwise>
                            </c:choose>
                            
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/Administrator/reserve?cp=${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/Administrator/reserve?cp=${pagination.maxPage}">&gt;&gt;</a></li>

                </ul>
            </div>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/Administrator/reserve.js"></script>
</body>
</html>