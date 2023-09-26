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
                    <img src="https://newsimg.hankookilbo.com/2016/03/17/201603171472767937_1.jpg">
                    <div class="mainImageIn">
                        <h1>언제나 가까운 곳에서<br> 안심할 수 있게</h1>
                        <button id="goReservation"><a href="/reservation/1">예약하러 가기</a></button>
                    </div>
                </div>

                <div class="slideshow-container">

                    <c:forEach items="${reviewList}" var="rList" varStatus="loop">
                        <a href = "/reviewBoard/reviewBoardList/${rList.boardNo}" method = "GET">
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
                                        <img src="${rList.imagePath}${rList.imageReName}">
                                    </div>
                                </div>
                            </div>

                            <c:if test="${loop.index % 4 == 3 || loop.last}">
                </div>
                </a>
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
                                        <h3> 산책의 중요성 </h3>
                                        <pre>

반려동물에게 산책은 바깥세상을 살피며 호기심을 충족하며 보호자와 교감 및
소통하는 시간으로, 신체적, 정신적 건강을 위해서 꼭 필요합니다.
                </pre>
                                    </div>
                                </div>
                            </section>

                            <section>
                                <div>
                                    <img class="H-img"
                                        src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201703/18/c2a695b1-56c5-4fff-a4bd-1ebc362a6b72.jpg"
                                        alt="시그니엘 드립백 커피">
                                </div>
                                <div>
                                    <div>
                                        <h3> 펫시터의 중요성 </h3>
                                        <p>반려견의 언어인 카밍시그널부터 가장 기초가 되는 산책 교육, 예절 교육, 분리불안 등<br>
                                            다양한 토픽에 대한 강형욱 훈련사님의 노하우를 담았습니다. </p>
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