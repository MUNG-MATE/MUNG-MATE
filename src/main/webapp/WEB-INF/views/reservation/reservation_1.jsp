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
        <h1 id="resTitle">예약 서비스[1/3]</h1>
        <h4 id="resSubTitle">이용할 서비스를 선택해주세요.</h4>
        
        <form action="1" method="POST">

            <section id="serviceSection">
                <div class="serviceDiv-one" onclick="serviceType('산책')">
                    <div class="iconDiv">
                        <img src="/resources/images/reservation/stroll.png" class="serviceIcon">
                    </div>
                    <div class="iconText">산책</div>
                </div>
        
                <div class="serviceDiv-two" onclick="serviceType('돌봄')">
                    <div class="iconDiv">
                        <img src="/resources/images/reservation/care.png" class="serviceIcon">
                    </div>
                    <div class="iconText">돌봄</div>
                </div>
            </section>
        
            <section id="serviceSubSection2">
                <div class="serviceDiv2 circle2" onclick="servicePrice('20000'),serviceTime('30분'),serviceNo('1')">
                    <div>30분<br>20,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="servicePrice('30000'),serviceTime('60분'),serviceNo('2')">
                    <div>60분<br>30,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="servicePrice('45000'),serviceTime('120분'),serviceNo('3')">
                    <div>120분<br>45,000원</div>
                </div>
            </section>
            
            <section id="serviceSubSection3">
                <div class="serviceDiv2 circle2" onclick="servicePrice('15000'),serviceTime('30분'),serviceNo('4')">
                    <div>30분<br>15,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="servicePrice('25000'),serviceTime('60분'),serviceNo('5')">
                    <div>60분<br>25,000원</div>
                </div>
            
                <div class="serviceDiv2 circle2" onclick="servicePrice('40000'),serviceTime('120분'),serviceNo('6')">
                    <div>120분<br>40,000원</div>
                </div>
            </section>
            
            <div id="btnArea">
                <button id="nextBtn">다음 &gt</button>
            </div>
            
            <input type="hidden" name="servicePrice" id="selectMoney" readonly>
            <input type="hidden" name="serviceTime" id="selectTime" readonly>
            <input type="hidden" name="serviceType" id="selectedService" readonly>
            <input type="hidden" name="serviceNo" id="selectServiceNo" readonly>
            <input name="petSitterNo" type="hidden" id="petSitterNo">
        </form>
        
    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="../../../resources/js/reservation/reservation_1.js"></script>
</body>
</html>