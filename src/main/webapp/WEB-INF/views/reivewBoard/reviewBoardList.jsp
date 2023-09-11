<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="../../../resources/css/reviewBoard/reviewBoardList.css">

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />


    <main>

       
        <!-- 게시판 제목 영역 -->
        <div>
            <h1>리뷰 게시판</h1>
        </div>

        <section>

            <!-- 게시글 한 칸 영역 -->
            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>

            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>

            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>

            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>

            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>

            <div class="h-list">

                <div>
                    <div>리뷰 게시판</div>
                    <h2>강아지를 돌봐주셔서 너무 감사합니다.</h2>
                    <div>닉네임 | 2023-08-29</div>
                </div>

                <div>
                    <img src="../image/노홍철.jpg" class="h-listImg">
                </div>

            </div>


        </section>

        <!-- 페이지 네이션 영역 -->
        <div class="pagination"></div>


    </main>

    <!-- footer 영역 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
</body>
</html>