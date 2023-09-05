<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 목록</title>

    <link rel="stylesheet" href="/css/reviewBoardList.css">

</head>
<body>

    <main>
        <header class="head">

            <!-- 로고 영역 -->
            <div>
                <a href="#">
                    <img src="../image/miniLogo.png" alt="" class="headerLogo">
                </a>
            </div>
            
            <div class="menu">

                <!-- 메뉴 리스트 영역 -->
                <div class="menu-2">
                    <a href="#">Info</a>
                    <a href="#">Matching</a>
                    <a href="#">Community</a>
                    <a href="#">Guide</a>
                    <img src="../image/menuIcon.png" alt="메뉴 아이콘">
                </div>
            </div>

        </header>

        <section>

            <h1>리뷰 게시판</h1>

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







        </section>
        


        <!-- footer 영역 -->
        <footer></footer>





    </main>
    
</body>
</html>