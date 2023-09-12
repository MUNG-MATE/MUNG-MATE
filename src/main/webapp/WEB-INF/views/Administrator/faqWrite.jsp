<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ 작성</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardWrite.css">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <main>
       
        <section>
        <form action = "/Administrator/faqWrite" method = "POST">

            <h1>FAQ 작성</h1>

            <div>

                <!-- 게시물 제목 -->
                <div class="titleArea">
                    <input type="text" id="boardTitle" name="title" placeholder="제목을 입력해주세요.">
                </div>

                <select name="boardCode" id="boardCode">
                        <option value="3">예약관련</option>
                        <option value="4">서비스이용</option>
                        <option value="5">기타</option>
                    </select>

                <!-- 내용 -->
                <div class="boardContent">
                    <textarea name="content" placeholder="내용을 입력해주세요."></textarea>
                </div>

                <div class="frame">
                    <button class="custom-btn btn-5"><span>등록</span></button>
                </div>

            </div>

        </form>


        </section>
        

    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>