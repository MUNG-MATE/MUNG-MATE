<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 펫시터 찜 목록</title>

    <link rel="stylesheet" href="/resources/css/petsitterLikeList-style.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />


    <a href="3" class="scroll-top-btn">Top</a>

    <main>

        <div class="main_container">
            
            <div class="main_first">
                <div>나의 찜 목록</div>
                <div>${memberNm} 님이 관심있는 펫시터 분들 이에요!</div>

            </div>
            <div class="PetsitterInformation">
        

                <c:forEach var="i" items="${petSitterLikeList}">
                    <div class="profileArea" id="profileArea">
                        <div class="imageArea">
                            <img src=${i.profileImg} class="profileImage">
                        </div>
                        <div class="info">
                            <div class="petsitterName">${i.memberNm} 펫시터</div>
                        </div>
                        <div>
                            <p class="history" name="location">선호 지역 : ${i.location}</p>
                            <p class="history" name="memberTel">전화번호 : ${i.memberTel}</p>
                            <p class="history" name="memberEmail">이메일 : ${i.memberEmail}</p>
                            
                            <input type="hidden" value="${i.petSitterNo}" class="petSitterNo">
                        </div>
                    </div>
                </c:forEach>
                
        
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