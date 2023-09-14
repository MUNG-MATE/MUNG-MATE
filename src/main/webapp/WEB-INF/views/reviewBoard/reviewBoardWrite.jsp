<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardWrite.css">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <main>
       
        <section>

            <h1>리뷰</h1>

            <form action="/board2/${boardCode}/insert" method="POST"
            class="board-write" id="boardWriteFrm" enctype="multipart/form-data">

                <div>

                    <!-- 게시물 제목 -->
                    <div class="titleArea">
                        <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요.">
                    </div>

                    <!-- 이미지 -->
                    <div class="imgContent">
                        <div class="imageArea">
                            <label for="img" id="labelImg">이미지 추가</label>
                            <input type="file" name="images" class="uploadImg" id="img">
                        </div>
                    </div>

                    <!-- 내용 -->
                    <div class="boardContent">
                        <textarea name="boardContent" placeholder="내용을 입력해주세요."></textarea>
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