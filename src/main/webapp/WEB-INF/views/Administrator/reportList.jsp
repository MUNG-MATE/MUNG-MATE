<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="reportList" value="${map.reportList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 신고목록</title>
<link rel="stylesheet" href="/resources/css/Administrator/reportList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>	
     <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
	<main>
        <section>
            <article class="titlebox">
                <h2>펫시터 신고목록</h2>
            </article>
        </section>

        <section>            
            <article class="declarationList">
                <table>
                    <thead>
                        <tr>
                            <th>신고번호</th>
                            <th>▼</th>
                            <th>신고자이름</th>
                            <th>신고자번호</th>
                            <th>펫시터번호</th>
                            <th>신고날짜</th>
                            <th>신고내용</th>
                            <th>상세내용</th>
                        </tr>
                    </thead>
                    <tbody>
                         <c:forEach items="${reportList}" var="reportList">
                        <tr>
                            <td >${reportList.reportNo}</td>
                            <td ><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td >${reportList.memberName}</td>
                            <td >${reportList.memberNo}</td>
                            <td >${reportList.petsitterNo}</td>
                            <td >${reportList.reportDate}</td>
                            <td class="tdContent">${reportList.reportContent}</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr class="declarationList-content">
                            <td colspan="8">
                                ${reportList.reportContent}
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </article>
        </section>

        <section>
            <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/Administrator/reportList?cp=1">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/Administrator/reportList?cp=${pagination.prevPage}">&lt;</a></li>

                   
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
        
                            <c:choose>
                               <c:when test="${ i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                               </c:when>
                            
                               <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/Administrator/reportList?cp=${i}">${i}</a></li>
                               </c:otherwise>
                            </c:choose>
                            
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/Administrator/reportList?cp=${pagination.nextPage}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/Administrator/reportList?cp=${pagination.maxPage}">&gt;&gt;</a></li>

                </ul>
            </div>
        </section>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/Administrator/declarationList.js"></script>
</body>
</html>