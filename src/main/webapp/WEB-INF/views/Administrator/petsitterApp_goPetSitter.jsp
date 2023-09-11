<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 펫시터 관리</title>
    <link rel="stylesheet" href="/resources/css/Administrator/adminApp.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

    <div class="C-adminApp-container">
        <div class="C-adminapp-body">

            <div class="C-adminapp-main">
                <!-- <form action=""> -->
                <div class="C-adminreservation">
                    <div class="C-adminreservation-title1">펫시터 신청 관리</div>
                    <div class="C-adminapp-div">
                        <select name="C-adminreservation-menu" id="C-adminreservation-menu" onchange="location.href=this.value">
                            <option value="/petsitter/admin/petsitterlist1" selected>펫시터 -> 일반회원 신청 내역</option>
                            <option value="/petsitter/admin/petsitterlist2">일반회원 -> 펫시터 신청 내역</option>
                        </select>
                    </div>
                    <div class="C-adminapplist" id="appListtable">
                        <div id="adminappList">
                            <div class="C-applist-container" id="Ctitle">
                                <div>신청번호</div>
                                <div>신청지역</div>
                                <div>반려동물 경험</div>
                                <div>신청내용</div>
                                <div>신청일</div>
                                <div>신청회원이메일</div>
                            </div>
                            <div class="C-applist-container" id="Ctitle">
                                <div>예약번호</div>
                                <div>호텔지점</div>
                                <div>방이름</div>
                                <div>예약자</div>
                                <div>체크인날짜</div>
                                <div>체크아웃날짜</div>
                            </div>
                            <div class="C-applist-container" id="Ctitle">
                                <div>예약번호</div>
                                <div>호텔지점</div>
                                <div>방이름</div>
                                <div>예약자</div>
                                <div>체크인날짜</div>
                                <div>체크아웃날짜</div>
                            </div>
                            <div class="C-applist-container" id="Ctitle">
                                <div>예약번호</div>
                                <div>호텔지점</div>
                                <div>방이름</div>
                                <div>예약자</div>
                                <div>체크인날짜</div>
                                <div>체크아웃날짜</div>
                            </div>
                            <div class="C-applist-container" id="Ctitle">
                                <div>예약번호</div>
                                <div>호텔지점</div>
                                <div>방이름</div>
                                <div>예약자</div>
                                <div>체크인날짜</div>
                                <div>체크아웃날짜</div>
                            </div>
                           <!--  <c:forEach var="app" items="${appList}">
                                <div class="C-rsvlist-container">
                                    <div>${app.appNo}</div>
                                    <div>${app.appLocation}</div>
                                    <div>${app.appEx}</div>
                                    <div>${app.appContent}</div>
                                    <div>${app.appDate}</div>
                                    <div>${app.memberEmail}</div>
                                    <div><button onclick="deleteApp(${app.memberNo})">취소</button></div>
                                </div>
                            </c:forEach> -->
                        </div>
                    </div>
                </div>
                <!-- </form> -->
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="/resources/js/Administrator/adminApp.js"></script>
</body>

</html>