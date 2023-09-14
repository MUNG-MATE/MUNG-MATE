<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>FAQ 수정</title>

            <link rel="stylesheet" href="/resources/css/reviewBoard/reviewBoardWrite.css">

        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
            <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

            <main>

                <section>
                    <h1>FAQ 수정</h1>

                    <div>
                        <form action="/Administrator/faq" method="POST">
                            <!-- 게시물 제목 -->
                            <div class="titleArea">
                                <input type="text" id="boardTitle" name="title" value="${administrator.title}">
                            </div>

                            <select name="boardCode" id="boardCode">
                                <option value="3">예약관련</option>
                                <option value="4">서비스이용</option>
                                <option value="5">기타</option>
                            </select>

                            <!-- 내용 -->
                            <div class="boardContent">
                                <textarea name="content"
                                    value="${administrator.content}">${administrator.content}</textarea>
                            </div>

                            <div class="frame">
                                <button class="custom-btn btn-5" type="submit"><span>등록</span></button>
                            </div>

                    </div>
                        <input type="hidden" name = "boardNo" value = "${administrator.boardNo}">
                    </form>


                </section>


            </main>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        </body>

        </html>