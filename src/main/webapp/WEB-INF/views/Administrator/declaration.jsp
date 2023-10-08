<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="declarationList" value="${map.declarationList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
<link rel="stylesheet" href="/resources/css/Administrator/declaration.css">
</head>
<body>		
     <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
	<main>
        <form action="/Administrator/declaration" method="Post" onsubmit="return textValidate()">
        <div class="titleBox">
            <h2>펫시터 신고!</h2>
            <div class=selectBox>
            <select name="pet" id="declarationNo" class="select">
                <option value="0">펫시터를 고르세요</option>
                <c:forEach items="${declarationList}" var="declarationList">
                    <option value="${declarationList.petsitterNo}">${declarationList.memberName}</option>
                </c:forEach>
            </select>
            <span class="icoArrow"></span>
            </div>
        </div>
        <div id="petsitterInfo" class="pet-sitter">
            <%-- <div id="pet-sitter-info" class="pet-sitter-info">
                <img src="/resources/images/member/m.gif">
                <ul>
                    <li>이름 : 000 펫시터</li>
                    <li>이용날짜 : 2023.00.00</li>
                    <li>이용시간 : 00시간</li>
                    <li>이용요금 : 000.000원</li>
                </ul>
            </div>
            <textarea name="singo" id="singo" placeholder="신고하는 이유를 상세하게 적어주세요..&#10;빠른조치후 연락드리겠습니다!"></textarea> --%>
            <div id="pet-sitter-info" class="pet-sitter-info h1" >
            <h1>신고할 펫시터를 선택하세요</h1>
            </div>
        </div>
            <button id="button">신고하기</button>
        </form>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        const loginMemberNo = "${loginMember.memberNo}";
    </script>
    <script src="/resources/js/Administrator/declaration.js"></script>
  
</body>
</html>
