<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>notice</title>
            <link rel="stylesheet" href="/resources/css/Administrator/faq.css">
            <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>
            
        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
            <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
            <main>
                <section>
                    <article class="title-box">
                        <h1>Notice</h1>
                        <div>
                            <h4>"공지사항을 통해서 멍메이트의 최신 소식을 확인해보세요"</h4>
                            <img src="/resources/images/Administrator/faq.png">
                        </div>
                    </article>
                    <article class="search-box">
                        
                    </article>
                    <article class="faq-content">
                        <div>
                            <ul class="noticeWriteBtnArea">
                                <c:if test="${loginMember.adminFlag == 'Y'}">
                                    <button id="writer" onclick="location.href = '/Administrator/noticeWrite/1'">작성하기</button>
                                </c:if>
                            </ul>
                        </div>
                        <c:forEach items="${map.boardList}" var="noticeList">
                            <table id="table">
                                <form action="/Administrator/notice/update/1" method="POST" name="updateFrm">

                                <tr class="t-tr" id="result1">
                                    <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                                    <td id="resultTitle">${noticeList.title}</td>
                                    <td><div class="btn">
                                                    <c:if test="${loginMember.adminFlag == 'Y'}" >
                                                        <button id="writer">수정하기</button>
                                                        <button id="writer" type="button" onclick="noticeDelete()">삭제하기</button>
                                                    </c:if>
                                            </div></td>
                                    <td class="td">▼</td>
                                </tr>
                                <tr class="faq-answer" id="result2">
                                        <td rowspan="4" id="resultContent">
${noticeList.content}
                                            <input type="hidden" name="content" value="${noticeList.content}">
                                            <input type="hidden" name="title" value="${noticeList.title}">
                                            <input type="hidden" name="boardNo" value="${noticeList.boardNo}">
                                            <script>const boardNo = "${noticeList.boardNo}"</script>
                                            
                                    </form>
                                    </td>
                                </tr>

                            </table>
                        </c:forEach>

                    </article>


                </section>

                <!-- 페이지 네이션 영역 -->
        <div class="pagination-area">
            <ul class="pagination">

                <c:set var="pagination" value="${map.pagination}"/>

                <c:if test="${!empty boardList}" >
                <!-- 첫 페이지로 이동 -->
                <li><a href="/Administrator/notice/${boardCode}?cp=1${sp}"><i class="fa-solid fa-angles-left"></i></a></li>

                <!-- 이전 목록 마지막 번호로 이동 -->
                <li><a href="/Administrator/notice/${boardCode}?cp=${pagination.prevPage}${sp}"><i class="fa-solid fa-chevron-left"></i></a></li>
                </c:if>

           
                <!-- 특정 페이지로 이동 -->
                <c:forEach var="i" begin="${pagination.startPage}"
                            end="${pagination.endPage}" step="1">

                    <c:choose>
                       <c:when test="${ i == pagination.currentPage}">
                            <!-- 현재 보고있는 페이지 -->
                            <li><a class="current">${i}</a></li>
                       </c:when>
                    
                       <c:otherwise>
                            <!-- 현재 페이지를 제외한 나머지 -->
                            <li><a href="/Administrator/notice/${boardCode}?cp=${i}${sp}">${i}</a></li>

                       </c:otherwise>
                    </c:choose>

                </c:forEach>
                
                <c:if test="${!empty boardList}" >
                <!-- 다음 목록 시작 번호로 이동 -->
                <li><a href="/Administrator/notice/${boardCode}?cp=${pagination.nextPage}${sp}"><i class="fa-solid fa-chevron-right"></i></a></li>

                <!-- 끝 페이지로 이동 -->
                <li><a href="/Administrator/notice/${boardCode}?cp=${pagination.maxPage}${sp}"><i class="fa-solid fa-angles-right"></i></a></li>
                </c:if>

            </ul>
        </div>



            </main>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <script>
                const title = "${noticeList.title}"
                const content = "${noticeList.content}"
                const boardList = "${noticeList.boardList}"
            </script>

            <script src="/resources/js/Administrator/code.jquery.com_jquery-3.7.1.min.js"></script>
            <script src="/resources/js/Administrator/faq.js"></script>
        </body>

        </html>