<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 예약 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/myPage/reservationList.css">
</head>
<jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
<body>
    <script src="https://unpkg.com/@popperjs/core@2"></script>
    <script src="https://unpkg.com/tippy.js@6"></script>
   	<div class="page-title">내 예약 목록</div>
    <section id="container">
        <div class="flip">
            <div class="card">
                <div id="div_calendar" class="front-side">
                    <div id="date_controller">
                        <button type="button" class="month-btn" onclick="changeMonth(-1);"><i class="fa fa-chevron-left"></i></button>
                        <input type="number" id="year" class="form-control" onchange="changeYear();"/>
                        <select dir="rtl" id="month" class="form-control" onchange="changeMonth();">
                            <option value="1">1월</option>
                            <option value="2">2월</option>
                            <option value="3">3월</option>
                            <option value="4">4월</option>
                            <option value="5">5월</option>
                            <option value="6">6월</option>
                            <option value="7">7월</option>
                            <option value="8">8월</option>
                            <option value="9">9월</option>
                            <option value="10">10월</option>
                            <option value="11">11월</option>
                            <option value="12">12월</option>
                        </select>
                        <button type="button" class="month-btn" onclick="changeMonth(1);"><i class="fa fa-chevron-right"></i></button>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr style="height: 41px;">
                                <th class="day-of-week">일</th>
                                <th class="day-of-week">월</th>
                                <th class="day-of-week">화</th>
                                <th class="day-of-week">수</th>
                                <th class="day-of-week">목</th>
                                <th class="day-of-week">금</th>
                                <th class="day-of-week">토</th>
                            </tr>
                        </thead>
                        <tbody id="tb_tbody">
                            <div id="test"></div>
                        </tbody>
                    </table>
                </div>
                <div class="back-side">
                    <div class="back-header">
                        <div>
                            <button onclick="flip()" class="prev-btn"><i class="fa fa-chevron-left"></i></button>
                        </div>
                        <div class="back-title">서비스 정보</div>
                    </div>
                    <div class="back-content">
                        <section class="content-left">
                            <div class="content-box">
                                <span>요청 서비스</span><div id="serviceType" class="content-area"></div>
                            </div>
                            <div class="content-box">
                                <span>방문 일정</span><div id="serviceDate" class="content-area"></div>
                            </div>
                            <div class="content-box">
                                <span>방문 장소</span><div id="address" class="content-area"></div>
                            </div>
                            <div class="content-box">
                                <span>결제 금액</span><div id="servicePrice" class="content-area"></div>
                            </div>
                        </section>

                        <section class="content-right">
                            <div id="petsitterArea">
                                <div class="imageArea">
                                    <img src="/resources/images/myPage/petsitter.png" id="profileImage">
                                </div>
                                <div class="info">
                                    <div id="petsitterName"></div>
                                    <div id="point"></div>
                                    <div id="liveCardDiv"></div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <div class="content-footer">
                        <div class="content-box">
                            <span>펫 프로필</span>
                            <div id="pet-area">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script>
        const memberNo = "${loginMember.memberNo}";
        const petsitterFlag = "${loginMember.petsitterFlag}";
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/myPage/reservationList.js"></script>
</body>
</html>