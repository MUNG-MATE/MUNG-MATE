<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>notice</title>
            <link rel="stylesheet" href="/resources/css/Administrator/faq.css">
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
                            <ul>


                            </ul>
                        </div>
                        <c:forEach items="${map.boardList}" var="noticeList">
                            <table id="table">

                                <tr class="t-tr" id="result1">
                                    <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                                    <td id="resultTitle">${noticeList.title}</td>
                                    <td></td>
                                    <td class="td">▼</td>
                                </tr>
                                <tr class="faq-answer" id="result2">
                                    <form action="/Administrator/notice/update/1" method="POST" name="updateFrm">
                                        <td rowspan="4" id="resultContent">
                                            ${noticeList.content}
                                            <input type="hidden" name="content" value="${noticeList.content}">
                                            <input type="hidden" name="title" value="${noticeList.title}">
                                            <input type="hidden" name="boardNo" value="${noticeList.boardNo}">
                                            <script>const boardNo = "${noticeList.boardNo}"</script>
                                            <div class="btn">
                                                <button id="writer">수정하기</button>
                                                <button id="writer" type="button" onclick="noticeDelete()">삭제하기</button>
                                            </div>
                                    </form>
                                    </td>
                                </tr>

                            </table>
                        </c:forEach>

                        <c:if test="${!empty loginMember}">
                            <button id="writer" onclick="location.href = '/Administrator/noticeWrite/1'">작성하기</button>
                        </c:if>
                    </article>

                </section>
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