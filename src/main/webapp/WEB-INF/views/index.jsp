<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>MUNG MATE</title>
                <link rel="stylesheet" href="/resources/css/index.css">
            </head>
            <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

            <body>

                <div class="mainImage">
                    <img src="/resources/images/mainImage2.jpg">
                    <div class="mainImageIn">
                        <h1>언제나 가까운 곳에서<br> 안심할 수 있게</h1>
                        <button id="goReservation"><span>예약하러 가기</span></button>
                    </div>
                </div>

                <div class="slideshow-container">

                    <c:forEach items="${reviewList}" var="rList" varStatus="loop">
                        <c:if test="${loop.index % 4 == 0}">
                            <div class="mySlides" id="mySlides">
                        </c:if>
                        <div class="review">
                            <div class="reviewContent">
                                <div class="reviewInfo">
                                    <img src="${rList.profileImage}">
                                    <span class="reviewNickname">${rList.memberNickname}</span>
                                </div>
                                <p>
                                    ${rList.boardContent}
                                </p>
                                <div class="reviewImage">
                                    <img src="/resources/images/${rList.imageReName}">
                                </div>
                            </div>
                        </div>

                        <c:if test="${loop.index % 4 == 3 || loop.last}">
                </div>
                </c:if>
                </c:forEach>

                <a class="prev" id="prev" onclick="plusSlides(-1)"><img src="/resources/images/chevron-left.svg"></a>
                <a class="next" id="next" onclick="plusSlides(1)"><img src="/resources/images/chevron-right.svg"></a>

                <br>
                </div>

                <div class="content">

                    <div class="mainPageContent3">
                        <div class="fade-in">
                            <div class="imgArea">
                                <img src="/resources/images/house-heart.svg">
                            </div>
                            <div>
                                24시간 가정 돌봄
                            </div>
                            <div>
                                가족처럼 예쁨받는<br>
                                가정돌봄 서비스
                            </div>
                        </div>
                        <div class="fade-in">
                            <div class="imgArea">
                                <img src="/resources/images/산책.png">
                            </div>
                            <div>매일매일 산책하기</div>
                            <div>
                                스트레스 없는 생활 <br>
                                우리 아이를 위한 선택
                            </div>
                        </div>
                        <div class="fade-in">
                            <div class="imgArea">
                                <img src="/resources/images/search.svg">
                            </div>
                            <div>
                                체계적 검증시스템
                            </div>
                            <div>
                                꼼꼼하게 진행되는<br>
                                펫시터 등록 프로세스
                            </div>
                        </div>
                        <div class="fade-in">
                            <div class="imgArea">
                                <img src="/resources/images/핸드폰.gif">
                            </div>
                            <div>
                                모바일에서도 원스톱
                            </div>
                            <div>
                                예약부터 결제까지<br>
                                간편하게 해결됩니다.
                            </div>
                        </div>
                        <div class="fade-in">
                            <div class="imgArea">
                                <img src="/resources/images/안전.png">
                            </div>
                            <div>
                                안전보장 프로그램
                            </div>
                            <div>
                                예상 못한 사고의<br>
                                대비 정책
                            </div>
                        </div>
                    </div>
                </div>

                <div class=content2>

                    <article class="mainContainerbox">

                        <div class="mainContent_inner">

                            <section>
                                <div>
                                    <img class="H-img"
                                        src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/2le10oKKJsTRCMHUjW7fj6uFXp4.jpg"
                                        alt="해온 프리미엄 배딩">
                                </div>
                                <div>
                                    <div>
                                        <h3> 노즈워크를 아시나요?</h3>
                                        <pre>

노즈워크란 한국어로 번역하자면 후각 활동입니다. 
반려견이 코를 이용하는 모든 후각 활동을 노즈워크라 부를 수 있습니다. 
바닥에 뿌린 간식을 찾는 것, 장난감을 숨기고 찾는 것, 
공항에서 일하는 마약 탐지견, 인명구조 견들이 재난 시 사람을 찾는 활동들도 노즈워크라 부를 수 있습니다.
                </pre>
                                    </div>
                                </div>
                            </section>

                            <section>
                                <div>
                                    <img class="H-img"
                                        src="https://eshop.lottehotel.com/uploads/banner/b2bbeedfa09e1040cb5901d0aca57325.jpg"
                                        alt="시그니엘 드립백 커피">
                                </div>
                                <div>
                                    <div>
                                        <h3>시그니엘 드립백 커피</h3>
                                        <p>시그니엘의 전문 바리스타가 직접 개발한<br>
                                            프리미엄 원두 세트로 하루를 향기롭게 시작해보세요.</p>
                                    </div>
                                </div>
                            </section>

                        </div>

                    </article>

                </div>




                <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            </body>

            
            <script src="/resources/js/index.js"></script>

            </html>