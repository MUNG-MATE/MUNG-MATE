<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="selectReserveList" value="${map.selectReserveList}"/>

<c:set var="endR" value="${map.endR}"/>
<c:set var="noCompletedR" value="${map.noCompletedR}"/>

<c:set var="yesterdayR" value="${map.yesterdayR}"/>
<c:set var="todayR" value="${map.todayR}"/>
<c:set var="tomorrowR" value="${map.tomorrowR}"/>
<c:set var="thisMonthR" value="${map.thisMonthR}"/>
<c:set var="FMonthR" value="${map.FMonthR}"/>


<c:set var="thisMonthSales" value="${map.thisMonthSales}"/>
<c:set var="FtotalSales" value="${map.FtotalSales}"/>
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
            <h3 id="sysdate"></h3>
            <table>
                <tbody>
                    <tr>
                        <td>서비스 진행전 예약</td>
                        <td>${noCompletedR}건</td>
                        <td>다음달 예약</td>
                        <td>${FMonthR}건</td>
                    </tr>

                    <tr>
                        <td>서비스 완료된 예약</td>
                        <td>${endR}건</td>
                        <td>이번달 예약</td>
                        <td>${thisMonthR}건</td>
                    </tr>

                    <tr>
                        <td>어제 예약</td>
                        <td>${yesterdayR}건</td>
                        <td>이번달 매출 예상</td>
                        <td>${thisMonthSales}원</td>
                        
                    </tr>

                    <tr>
                        <td>오늘 예약</td>
                        <td>${todayR}건</td>
                        <td>서비스전 매출</td>
                        <td>${FtotalSales}원</td>
                        
                    </tr>
                    <tr>
                        <td>내일 예약</td>
                        <td>${tomorrowR}건</td>
                        <td>예상 총매출</td>
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
                    <th>결제</th>
                    <th>서비스상태</th>
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
                        <td>완료</td>
                        <td>${selectReserveList.serviceSt}</td>
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
    
    <script>

    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth()+1;
    let day = date.getDate(); 

    if(month < 10 ) month = "0"+month; month;
    if(day < 10 ) day = "0"+day; day;

    let sysdate = year+"년 "+month+"월 "+day+" 일 기준 예약현황"

    const h3 = document.getElementById("sysdate");

        h3.innerText= sysdate;
    
    </script>
</body>
</html>