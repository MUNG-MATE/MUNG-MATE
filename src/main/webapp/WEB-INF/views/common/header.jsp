<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/header.css">
<header class="head">
    <!-- 로고 영역 -->
    <div>
        <a href="/">
            <img src="/resources/images/newlogo.png" alt="" class="headerLogo">
        </a>
    </div>
    
    <nav class="menu">

        <!-- 회원가입 및 로그인 영역 -->
        <div class="menu-1">
        <c:if test="${empty loginMember}" >
            <a href="/member/login">Login</a>
            <span>|</span>
            <a href="/member/signUp">Join</a>
        </c:if>
        <c:if test="${!empty loginMember}" >
        <a href = "/myPage/memberInfo">My Page</a>
        <span>|</span>
             <a href="/member/logout">Logout</a>
        </c:if>
        </div>


        <!-- 메뉴 리스트 영역 -->
        <div class="menu-2">
            <a href ="/info">Info</a>
            <a href="#">Matching</a>
            <a href="#">Community</a>
            <a href="#">Guide</a>

        </div>
    </nav>
</header>