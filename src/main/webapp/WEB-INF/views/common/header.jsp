<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/header.css">
<header class="head">
    <!-- 로고 영역 -->
    <div>
        <a href="/">
            <img src="/resources/images/MungMateLogo.png" alt="" class="headerLogo">
        </a>
    </div>
    
    <nav class="menu">

        <!-- 회원가입 및 로그인 영역 -->
        <div class="menu-1">
            <a href="/member/login">Login</a>
            <span>|</span>
            <a href="/member/signUp">Join</a>
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