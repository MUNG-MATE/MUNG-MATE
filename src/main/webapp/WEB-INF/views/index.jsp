<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="/resources/css/index.css">
</head>

<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="mainImage">
        <img src="/resources/images/mainImage2.jpg">
        <div class="mainImageIn">
            <h1>언제나 가까운 곳에서<br> 안심할 수 있게</h1>
            <button id="goReservation">예약하러 가기</button>
        </div>
    </div>

    <div class="content">

        <div class="mainPageContent3">
            <div class="fade-in">
                <div class="imgArea">
                    <img src="/resources/images/MungMateLogo.png">
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
                    <img src="/resources/images/MungMateLogo.png">
                </div>
                <div>매일매일 산책하기</div>
                <div>
                    스트레스 없는 생활 <br>
                    우리 아이를 위한 선택
                </div>
            </div>
            <div class="fade-in">
                <div class="imgArea">
                    <img src="/resources/images/MungMateLogo.png">
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
                    <img src="/resources/images/MungMateLogo.png">
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
                    <img src="/resources/images/MungMateLogo.png">
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


        <!-- 후기 슬라이드 -->
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="slideAll">
                    <div class="numbertext"></div>

                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="slideAll">
                    <div class="numbertext"></div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mySlides fade">
                <div class="slideAll">
                    <div class="numbertext"></div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="review">
                        <div class="reviewContent">
                            <div class="reviewInfo">
                                <img src="/resources/images/user.png">
                            <span class="reviewNickname">강아지조아님</span>
                            <span class="star">★★★★★</span>
                        </div>
                            <p>
                                이번에도 시터님을 찾게 되었네요 토비도 낯설지 않은지
                                잘 지내주어서 다행이었습니다.
                            </p>
                            <div class="reviewImage">
                                <img src="/resources/images/강아지증명사진.jpg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <a class="prev" onclick="plusSlides(-1)"><img src="/resources/images/chevron-left.svg"></a>
            <a class="next" onclick="plusSlides(1)"><img src="/resources/images/chevron-right.svg"></a>

            <br>

            <div style="text-align:center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>


        </div>
        <script src="/resources/js/index.js"></script>

</body>

</html>