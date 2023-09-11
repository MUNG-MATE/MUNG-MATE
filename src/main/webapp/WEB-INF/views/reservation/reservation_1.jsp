<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_1.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
    <div class="body">

        <h1 id="resTitle">예약 서비스[1/4]</h1>
        <h4 id="resSubTitle">이용할 서비스를 선택해주세요.</h4>
        
        <form action="" method="post">

            <section id="serviceSection">
                <div class="serviceDiv-one" onclick="service('산책')">
                    <div class="iconDiv">
                        <img src="/resources/images/reservation/stroll.png" class="serviceIcon">
                    </div>
                    <div class="iconText">산책</div>
                </div>
        
                <div class="serviceDiv-two" onclick="service('돌봄')">
                    <div class="iconDiv">
                        <img src="/resources/images/reservation/care.png" class="serviceIcon">
                    </div>
                    <div class="iconText">돌봄</div>
                </div>
            </section>
        
            <section id="serviceSubSection2">
                <div class="serviceDiv2 circle2" onclick="money('20,000원')">
                    <div>30분<br>20,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="money('30,000원')">
                    <div>60분<br>30,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="money('45,000원')">
                    <div>120분<br>45,000원</div>
                </div>
            </section>
            
            <section id="serviceSubSection3">
                <div class="serviceDiv2 circle2" onclick="money('15,000원')">
                    <div>30분<br>15,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="money('25,000원')">
                    <div>60분<br>25,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="money('40,000원')">
                    <div>120분<br>40,000원</div>
                </div>
            </section>
            
            <div id="btnArea">
                <button id="nextBtn">다음 &gt</button>
            </div>
            
            <input type="hidden" name="money" id="selectMoney" readonly>
            <input type="hidden" name="service" id="selectedService" readonly>
        </form>
        
    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="../../../resources/js/reservation/reservation_1.js"></script>
</body>
</html>