<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="managementList" value="${map.managementList}"/>
<c:set var="petCount" value="${map.petCount}"/>
<c:set var="commonCount" value="${map.commonCount}"/>
<c:set var="mungCount" value="${map.mungCount}"/>
<c:set var="flagCount" value="${map.flagCount}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="/resources/css/Administrator/management.css">
</head>
<body>	
	 <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />	
     <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<main>

        <c:if test="${!empty param.managementType}" >
            <c:set var="sp" value="&managementType=${param.managementType}&managementSearch=${param.managementSearch}"/>
        </c:if>
        
        <section>
            <article class="people">
                <h4>전체사용자 : ${mungCount} 명</h4>
                <div>
                <h4>일반사용자 : ${commonCount} 명</h4>
                <h4>펫시터 : ${petCount} 명</h4>
                <h4>탈퇴대기 : <span>${flagCount}</span> 명</h4>
                </div>
            </article>

            <article class="search-box">
                <form action="management" method="get" id="management">
                    <select name="managementType" id="managementType">
                        <option value="전체">전체</option>
                        <option value="일반회원">일반회원</option>
                        <option value="펫시터">펫시터</option>
                        <option value="탈퇴대기">탈퇴대기</option>
                    </select>
                        <input type="text" name="managementSearch" id="managementSearch" autocomplete="off" placeholder="키워드를입력하세요.">
                        <button>검색</button><button type="button" id="delete">탈퇴</button>
                </form>
            </article>
        </section>

        <section>
            <table>
                <thead>
                    <th>No</th>
                    <th>▼</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>회원가입일</th>
                    <th>펫시터(Y/N)</th>
                    <th>회원탈퇴(Y/N)</th>
                </thead>
                <tbody>
                    <c:if test="${empty managementList}" >
                    <tr><td colspan="8">조회결과가 없습니다.</td></tr>
                    </c:if>
                    <c:forEach items="${managementList}" var="managementList">
                        <tr>
                            <td>${managementList.memberNo}</td>
                            <td><input type="checkbox" name="checkbox" value="${managementList.memberNo}"></td>
                            <td>${managementList.memberEmail}</td>
                            <td>${managementList.memberName}</td>
                            <td>${managementList.memberTel}</td>
                            <td>${managementList.enrollDate}</td>
                            <td>${managementList.petsitterFlag}</td>
                            <td>${managementList.sessionFlag}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
    <script src="/resources/js/Administrator/management.js"></script>
    
</body>
</html>