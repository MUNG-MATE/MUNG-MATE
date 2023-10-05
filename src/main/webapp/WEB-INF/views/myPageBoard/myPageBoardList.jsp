<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="postList" value="${map.postList}"/>
<c:set var="imageList" value="${imageList}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 게시글 목록</title>

    <link rel="stylesheet" href="/resources/css/myPageBoard/myPageBoardList.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>

        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    	<jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    <main>


        <!-- 게시판 제목 영역 -->
        <div>
            <h1>내 게시글 조회</h1>
        </div>

        <c:if test="${empty postList}" >
            <div id="nothing">
				<h2>작성하신 게시글이 존재하지 않습니다.</h2>
			</div>
        </c:if>  


        <section>
			<c:forEach items="${postList}" var="post">
	           <!-- 게시글 한 칸 영역 -->
	           <div class="h-list">
	
	               <div>
	                   <div></div>
	                   <h2><a id="reviewTitle" href="/reviewBoard/reviewBoardList/${post.boardNo}?cp=${pagination.currentPage}${sp}"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;${post.boardTitle}</a></h2>
	                   <div>${post.memberNickname} | ${post.boardDate }</div>
	               </div>
	
	               <div class="thumbNail">
	                   <img class="thumbNail" src="${post.imagePath}" class="h-listImg">
	               </div>
	
	           </div>
			</c:forEach>
        </section>

        <!-- 페이지 네이션 영역 -->
        <div class="pagination">
        	<ul class="pagination">
                
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="/myPage/myPost?cp=1${sp}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="/myPage/myPost?cp=${pagination.prevPage}${sp}">&lt;</a></li>

                   
                    <!-- 특정 페이지로 이동 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
        
                            <c:choose>
                               <c:when test="${ i == pagination.currentPage}">
                                    <!-- 현재 보고있는 페이지 -->
                                    <li><a class="current">${i}</a></li>
                               </c:when>
                            
                               <c:otherwise>
                                    <!-- 현재 페이지를 제외한 나머지 -->
                                    <li><a href="/myPage/myPost?cp=${i}${sp}">${i}</a></li>
                               </c:otherwise>
                            </c:choose>
                            
                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="/myPage/myPost?cp=${pagination.nextPage}${sp}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="/myPage/myPost?cp=${pagination.maxPage}${sp}">&gt;&gt;</a></li>

                </ul>
        </div>





    </main>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    
</body>
</html>