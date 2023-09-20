<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        <h2>신고</h2>
        <div class="pet-sitter">
            <div class="pet-sitterimg">
                <img src="/resources/images/m.gif">
            </div>
            <div class="pet-sitter-info">
                <ul>
                    <li>이름 : 000 펫시터</li>
                    <li>이용일 : 2023.00 ~ 00.00</li>
                    <li>이용요금 : 000.000원</li>
                </ul>
            </div>
        </div>
        <form action="">
            <textarea name="singo" id="singo" cols="30" rows="10" 
            placeholder="신고하는 이유를 상세하게 적어주세요..&#10;빠른조치후 연락드리겠습니다!"></textarea>
            <button>신고하기</button>
        </form>
        </section>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  
</body>
</html>