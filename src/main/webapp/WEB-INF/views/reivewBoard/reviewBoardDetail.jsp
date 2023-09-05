<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 게시판 상세조회</title>

    <link rel="stylesheet" href="../css/reviewBoardDetail.css">
</head>
<body>

    <main>

        <header class="head">

            <!-- 로고 영역 -->
            <div>
                <a href="#">
                    <img src="../image/logo.png" alt="" class="headerLogo">
                </a>
            </div>
            
            <nav class="menu">

                <!-- 회원가입 및 로그인 영역 -->
                <div class="menu-1">
                    <a href="#">Login</a>
                    <span>|</span>
                    <a href="#">Join</a>
                </div>


                <!-- 메뉴 리스트 영역 -->
                <div class="menu-2">
                    <a href="#">Info</a>
                    <a href="#">Matching</a>
                    <a href="#">Community</a>
                    <a href="#">Guide</a>

                </div>
            </nav>

        </header>

        <section>

            <!-- 제목 영역 -->
            <div>
                <h1>강아지를 돌봐주셔서 너무 감사합니다.</h1>
            </div>

            <!-- 게시글 상단 작성자 정보 영역 -->
            <div class="h-topArea">

                <!-- 작성자 프로필 영역 -->
                <div>
                    <img src="../image/logo.png" class="h-profileImg">
                </div>

                <!-- 작성자 상세 정보 영역 -->
                <div>

                    <p>작성자</p>
                    <p>
                        <span>2023-08-29</span>
                        <span>조회수</span>
                        <span class="h-btnArea">
                            <button id="h-updateBtn">수정</button>
                            <button id="h-deleteBtn">삭제</button>

                        </span>
                    </p>

                </div>
            </div>

            <!-- 이미지 영역 -->
            <div class="h-imgArea">
                <img src="../image/MUNGImg.jpeg">
            </div>

            <!-- 내용 영역 -->
            <div class="h-contentArea">
                <p>여기는 내용 영역 입니다.</p>
            </div>

            <!-- 목록으로 버튼 영역 -->
            <div class="h-backListBtnArea">
                <button id="h-backListBtn">목록으로</button>
            </div>

            <!-- 댓글 영역 -->
            <div>
                <div class="h-replyArea">

                    <div>
                        <img src="../image/logo.png" id="h-replyProfile">
                    </div>
                    
                    <div>
                        <div><small>작성자 아이디</small><small>2023-08-29</small></div>
                        <div><p>댓글 내용 입니다.</p></div>

                    </div>

                </div>

                <!-- 댓글 수정 삭제 버튼 영역 -->
                <div class="h-replyBtnArea">
                    <button id="h-replyUpdateBtn">수정</button>
                    <button id="h-replyDeleteBtn">삭제</button>
                </div>
            </div>

            <!-- 댓글 작성 영역 -->
            <div class="h-replyWriter">

                <div>
                    <textarea name="" id="h-replyTextarea" cols="120" rows="5" placeholder="내용을 입력해주세요."></textarea>
                </div>
                <div>
                    <button id="h-replyBtn">댓글 등록</button>
                </div>

            </div>


        </section>

        <footer>

        </footer>


    </main>
    
</body>
</html>