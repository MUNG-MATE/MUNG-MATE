<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>펫시터 예약 목록</title>

    <link rel="stylesheet" href="../../../resources/css/petsitter/reservationList-style_p.css">
    <script src="https://kit.fontawesome.com/de9012b52d.js" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <a href="#" class="scroll-top-btn">Top</a>

    <main>
        <section class="main_container">
            <div class="main_first">
                <div>새로운 예약 목록</div>
                <div>"[닉네임]"펫시터 님 에게 신청된 새로운 예약 목록 이에요!</div>
            </div>
            <div class="main_second">

                <c:forEach items="${rList_p.reservationList}" var="rList">
                <div>
                    <div class="content">
                        <div><img id="petPhoto" src="${rList.petProfile}"></div>
                        <hr>
                        <div class="info">${rList.memberNickname} / [예약주소] <br> [방문날짜] / [방문시간]</div>
                        <div class="select-btn"><button id="addTarget" class="custom-btn btn-15">조회</button></div>
                            <%-- 팝업창  --%>
                            <div id="addTargetPopupLayer" class="popup-layer-close">  
                                <div class="detail">
                                    <span id="closeBtn">&times</span>
                                    <div><img id="detailPhoto" src="../../../resources/images/dog-profile.jpg"></div>
                                    <hr>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;이름 : 김광수</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;지역 : 서울 강남구</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;반려견 수 : 2 마리</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;반려견 크기 : 대형</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;시간 : 10월 6일 09:00~17:50</div>
                                    <div><button class="custom-btn btn-16">수락</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>  
                </c:forEach>
            </div>

        </section>


    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


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

        /* 팝업창 */
        const addTargetPopupLayer = document.querySelector("#addTargetPopupLayer"); // 팝업 레이어

        const closeBtn = document.querySelector("#closeBtn"); // 닫기 버튼

        // 검색 팝업 레이어 열기
        addTarget.addEventListener("click", e => {
        addTargetPopupLayer.classList.toggle("popup-layer-close");
        });

        // 검색 팝업 레이어  닫기
        closeBtn.addEventListener("click", e => {
        addTargetPopupLayer.classList.toggle("popup-layer-close");
        });

        function selectReservationList(){

            fetch("/selectList")
            .then(resp => resp.json())
            .then(reservationList => {

                const content = document.getElementById("content");
                
                for(let rList of reservationList){
                    
                

                }
            })
            .catch(err =>  console.log(err));
        }




    </script>

    
</body>
</html>