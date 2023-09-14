<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터관리</title>
<link rel="stylesheet" href="/resources/css/Administrator/petManagement.css">
</head>
<body>		
     <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    <main>
    <div class="petsitterBox">
        <div class="petsitterImg">
            <img src="/resources/images/Administrator/user.png">
        </div>
        <div class="petsitterInfo">
            <h3>000펫시터</h3><button>자격박탈</button>
            <table>
                <tr>
                    <th>선호지역</th>
                    <td>선호지역</td>
                    <td>(2023.00.00 기준)</td>
                </tr>
                <tr>
                    <th>처리된 예약</th>
                    <td>000건</td>
                    <td>(2023.00.00 기준)</td>
                </tr>
                <tr>
                    <th>추후 예약</th>
                    <td>000건</td>
                    <td>(2023.00.00 기준)</td>
                </tr>
                <tr>
                    <th>신고</th>
                    <td>000건</td>
                    <td>(2023.00.00 기준)</td>
                </tr>
                <tr>
                    <th><span>♥</span> 좋아요</th>
                    <td><span>♥</span> 10</td>
                    <td>(2023.00.00 기준)</td>
                </tr>
            </table>
        </div>
    </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/Administrator/petManagement.js"></script>
    
    
</body>
</html>