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
                <div class="C-adminApp">
                    <div class="C-adminApp-title1">펫시터 신청 관리</div>
                    <div class="C-adminapp-div">
                        <select name="C-adminApp-menu" id="C-adminApp-menu" onchange="location.href=this.value">
                            <option value="/petsitter/admin/petsitterlist1" >일반회원 -> 펫시터 신청 내역</option>
                            <option value="/petsitter/admin/petsitterlist2" selected>펫시터 -> 일반회원 신청 내역</option>
                        </select>
                    </div>
                    <div class="C-adminapplist" id="appListtable">
                        <div id="adminappList">
                            <div class="C-applist-container" id="Ctitle">
                               <div>신청번호</div>
                                <div></div>
                                <div>신청일</div>
                                <div></div>
                                <div>신청회원이메일</div>
                                <div></div>
                            </div>
                            
                            <c:if test="${empty appList}" >
                                 <div id="nothing">
                                    <h2>신청내역이 존재하지 않습니다.</h2>
                                </div>
                            </c:if>

                           <c:forEach var="app" items="${appList}">
                                <div class="C-applist-container">

                                 <div>${app.appNo}</div>
                                <div></div>
                                <div>${app.appDate}</div>
                                <div></div>
                                 <div>${app.memberEmail}</div>
                                    <div>
                                        
                                    </div>
                                    <div>
                                        <button id="successBtn" onclick="deleteApp('${app.memberNo}')">수락</button>
                                    </div>
                                </div>
                            </c:forEach>
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