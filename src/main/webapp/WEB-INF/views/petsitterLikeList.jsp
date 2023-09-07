<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 펫시터 찜 목록</title>

    <link rel="stylesheet" href="../../resources/css/petsitterLikeList-style.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/header.jsp" />


    <a href="#" class="scroll-top-btn">Top</a>

    <main>

        <div class="main_container">
            <div class="main_first">
                <div>나의 찜 목록</div>
                <div>""님이 관심있는 펫시터 분들 이에요!</div>

            </div>
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">김광수 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">박정흠 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">문광민 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">홍승남 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">최용혁 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            <div class="main_second">
                <div class="main_content">
                    <div><img class="petsitter-photo" src="/images/petsitter-photo.jpeg"></div>
                    <div>
                        <div class="like_header">
                            <div class="like_title">오서현 펫시터</div>
                            <div><img class="petsitter-profile" src="/images/petsitter-profile.jpeg"></div>
                            <span id="delete">&times;</span>
                        </div>
                        <hr>
                        <div class="like_explain">
                            <i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;우리 아이들의 마음을 이해하는 소통의 창이 되어드릴게요~!!
                        </div>
                        <div class="book-btn"><a href="#"><button class="custom-btn btn-15">예약하기</button></a></div>
                    </div>
                </div>
            </div>
            
            
       
    </main>


    <footer>
    </footer>

    <script>
        /* 스크롤 함수 */
        document.addEventListener('DOMContentLoaded', function () {
            var scrollTopBtn = document.querySelector('.scroll-top-btn');

            window.addEventListener('scroll', function () {
                if (window.pageYOffset > 500) {
                    scrollTopBtn.classList.add('show');
                } else {
                    scrollTopBtn.classList.remove('show');
                }
            });

            scrollTopBtn.addEventListener('click', function (e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });
        });
    </script>

</body>
</html>