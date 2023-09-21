<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터 신고목록</title>
<link rel="stylesheet" href="/resources/css/Administrator/declarationList.css">
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
                            <th>펫시터이름</th>
                            <th>신고날짜</th>
                            <th>신고내용</th>
                            <th>상세내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr class="declarationList-content">
                            <td colspan="8">
                                Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?1111
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr class="declarationList-content">
                            <td colspan="8">
                                Lorem ipsum dolor sit amet consectetur, aliquid dolores deserunt, magnam sint nam distinctio modi tenetur odio?1111
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td><img src="/resources/images/Administrator/singo.png" class="td-img"></td>
                            <td>문광민</td>
                            <td>12</td>
                            <td>펫시터</td>
                            <td>2023-03-11</td>
                            <td>이놈이 내 개잡아먹음!</td>
                            <td class="td">▼</td>
                        </tr>
                    </tbody>
                </table>
            </article>
        </section>

        <section>
            <div class="pagination-area">

                <ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/Administrator/management?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/Administrator/management?cp=${pagination.prevPage}${sp}">&lt;</a></li>

                   
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
        
                            <c:choose>
                               <c:when test="${ i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                               </c:when>
                            
                               <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/Administrator/management?cp=${i}${sp}">${i}</a></li>
                               </c:otherwise>
                            </c:choose>
                            
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/Administrator/management?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/Administrator/management?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                </ul>
            </div>
        </section>

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/Administrator/declarationList.js"></script>
</body>
</html>