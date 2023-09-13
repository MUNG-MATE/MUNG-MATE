<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>Z
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_4.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">예약 서비스[4/4]</h1>
    <h4 id="resSubTitle">펫시터를 선택해주세요.</h4>
    ${rs}
    <h2>펫시터 프로필</h2>
    <form action="4" method="post">

        <section id="container">
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
    
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
    
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
    
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
    
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
    
            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>

            <div class="profileArea">
                <div class="imageArea">
                    <img src="/resources/images/reservation/petsitter.png" class="profileImage">
                </div>
                <div class="info">
                    <div class="petsitterName">OOO 펫시터</div>
                    <div class="point">★ 5.0</div>
                    <a href="#" class="review">30개의 리뷰</a>
                </div>
                <div>
                    <p class="history">- 서울대학교 애완동물학과 졸업
    - 반려동물관리사 1급
    - 반려동물행동교정사 1급</p>
                </div>
                <div class="introduce">"우리 아이들의 마음을 이해하는 소통의 창이 되어드릴께요."</div>
            </div>
            
        </section>

        <div id="btnArea">
            <button class="btnStyle prev">&lt 이전</button>
            <button class="btnStyle next">결제 &gt</button>
        </div>

        <input type="hidden" name="servicePrice" id="selectMoney" value="${rs.servicePrice}" >
        <input type="hidden" name="serviceTime" id="selectTime" value="${rs.serviceTime}">
        <input type="hidden" name="serviceType" id="selectedService" value="${rs.serviceType}">
        <input type="hidden" name="rsDate" value="${rs.rsDate}">
        <input type="hidden" name="rsStartDate" value="${rs.rsStartDate}">


    </form>
    

    <script src="/resources/js/reservation/reservation_4.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>