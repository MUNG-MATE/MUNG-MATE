<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${contextPath}/resources/css/header2.css">
<header class="head">

    <!-- 로고 영역 -->
    <div>
        <a href="#">
            <img src="../image/miniLogo.png" alt="" class="headerLogo">
        </a>
    </div>
    
    <div class="menu">

        <!-- 메뉴 리스트 영역 -->
        <div class="menu-2">
            <a href="#">Info</a>
            <a href="#">Matching</a>
            <a href="#">Community</a>
            <a href="#">Guide</a>
            <img src="../image/menuIcon.png" alt="메뉴 아이콘">
        </div>
    </div>

</header>