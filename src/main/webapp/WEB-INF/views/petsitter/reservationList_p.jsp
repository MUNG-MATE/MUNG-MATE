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
            <div>
                <c:forEach items="${rList}" var="rList">
                
                <div class="main_second">
                    <div class="content">
                        <div><img id="petPhoto" src="${rList.petProfile}"></div>
                        <hr>
                        <div class="info">"${rList.memberNickname}" / ${rList.rsAddress} <br> ${rList.rsDate} / ${rList.rsStartDate}</div>
                        <div class="select-btn"><button id="" class="custom-btn btn-15 addTarget">조회</button></div>
                            <%-- 팝업창  --%>
                            <div id="addTargetPopupLayer" class="popup-layer-close">  
                                <div class="detail">
                                    <span id="closeBtn">&times</span>
                                    <div><img id="detailPhoto" src="${rList.petProfile}"></div>
                                    <hr>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;서비스 : ${rList.serviceType}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;반려견 이름 : ${rList.petName}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;성별 : ${rList.petGender}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;견종 : ${rList.petType}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;지역 : ${rList.rsAddress}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;시간 : ${rList.rsDate}/${rList.rsStartDate}</div>
                                    <div class="detailInfo"><i class="fa-solid fa-play" style="color:rgb(0,30,60);"></i>&nbsp;특이사항 : ${rList.petOption}</div>
                                    <div><button class="custom-btn btn-16 agreeBtn" onClick="">수락</button></div>
                                    <div><button class="custom-btn btn-16 refuseBtn">거절</button></div>
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
        const addTargetPopupLayer = document.querySelectorAll("#addTargetPopupLayer"); // 팝업 레이어
        const addTarget = document.getElementsByClassName("addTarget");
        const closeBtn = document.querySelectorAll("#closeBtn"); // 닫기 버튼

        // 검색 팝업 레이어 열기

        for(let i=0; i<addTarget.length; i++){

            addTarget[i].addEventListener("click", e => {
            addTargetPopupLayer[i].classList.toggle("popup-layer-close");
            });
            // 검색 팝업 레이어  닫기
            closeBtn[i].addEventListener("click", e => {
            addTargetPopupLayer[i].classList.toggle("popup-layer-close");
            });
        }



    </script>
    <script>

        // 예약번호 전역 변수로 선언!
        const rsNo = "${rList.rsNo}";

    </script>

    <script src="/resources/js/reservationList_p.js"></script>


    
</body>
</html>