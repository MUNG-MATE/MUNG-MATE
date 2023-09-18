<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>FAQ</title>
            <link rel="stylesheet" href="/resources/css/Administrator/faq.css">
        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
            <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
            <main>
                <section>
                    <article class="title-box">
                        <h1>FAQ</h1>
                        <div>
                            <h4>"FAQ를 통해서 원하시는 답변을 쉽고 빠르게 찾아보세요"<br>
                                질문 중 가장 빈도수가 높은 질문들을 모아, 친절한 답변과 함께 제공해드리고 있습니다.</h4>
                            <img src="/resources/images/Administrator/faq.png">
                        </div>
                    </article>
                    <article class="search-box">
                        <form action="/Administrator/faq/${boardCode}" method="GET" id="faqSearch">
                            <select name="faqCat" id="faqCat">
                                <option value="예약관련">예약관련</option>
                                <option value="서비스이용">서비스이용</option>
                                <option value="기타">기타</option>
                            </select>
                            <input type="text" name="faq" id="faq" autocomplete="off"
                                placeholder="원하는 검색을 입력해주세요."><button type="submit">Search</button>
                        </form>
                    </article>
                    <article class="faq-content">
                        <div>
                            <ul>
                                <li><a href="/Administrator/faq/3">예약관련</a></li>
                                <li><a href="/Administrator/faq/4">서비스이용</a></li>
                                <li><a href="/Administrator/faq/5">기타</a></li>


                            </ul>
                        </div>
                        <c:forEach items="${map.boardList}" var="faqList">
                            <table id="table">
                                    <form action="/Administrator/faq/update" method="POST" name="updateFrm">

                                <tr class="t-tr" id="result1">
                                    <td><img src="/resources/images/Administrator/report.png" class="td-img"></td>
                                    <td id="resultTitle">${faqList.title}</td>
                                    <td><div class="btn">
                                                <button id="writer">수정하기</button>
                                                <button id="writer" type="button" onclick="faqDelete()">삭제하기</button>
                                            </div></td>
                                    <td class="td">▼</td>
                                </tr>
                                  
                                <tr class="faq-answer" id="result2">
                                        <td rowspan="4" id="resultContent">
                                            ${faqList.content}
                                            <input type="hidden" name="content" value="${faqList.content}">
                                            <input type="hidden" name="title" value="${faqList.title}">
                                            <input type="hidden" name="boardNo" value="${faqList.boardNo}">
                                            <script>const boardNo = "${faqList.boardNo}"</script>
                                          
                                    </form>
                                    </td>
                                </tr>

                            </table>
                        </c:forEach>

                        <c:if test="${!empty loginMember}">
                            <button id="writer" onclick="location.href = '/Administrator/faqWrite'">작성하기</button>
                        </c:if>
                    </article>

                </section>
            </main>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <script>
                const title = "${faqList.title}"
                const content = "${faqList.content}"
                const boardList = "${map.boardList}"
            </script>

            <script src="/resources/js/Administrator/code.jquery.com_jquery-3.7.1.min.js"></script>
            <script src="/resources/js/Administrator/faq.js"></script>
        </body>

        </html>