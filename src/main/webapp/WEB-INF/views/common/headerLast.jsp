<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/header2.css">

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
        <div class="menu-3">
            <a href ="/info">Info</a>
            <a href ="/Administrator/notice/1">Notice</a>
            <a href="/reservation/1">Matching</a>
            <a href="/reviewBoard/reviewBoardList">Community</a>
            <a href="/Administrator/faq/3">FAQ</a>

        </div>
    </nav>
</header>

<header class="headArea">
    <!-- 로고 영역 -->
    <div class="logoArea">
        <a href="/">
            <img src="/resources/images/miniLogo.png" alt="" class="headerLogo">
        </a>
    </div>
    
    <div class="menuArea">

        <!-- 메뉴 리스트 영역 -->
        <div class="menu-2">
            <a href ="/info">Info</a>
            <a href ="/Administrator/notice/1">Notice</a>
            <a href="/reservation/1">Matching</a>
            <a href="/reviewBoard/reviewBoardList">Community</a>
            <a href="/Administrator/faq/3">FAQ</a>
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
        </div>
    </div>
</header>

<script>

    window.addEventListener('scroll', function(){
        const header = document.querySelector(".head"); // 헤더 엘리먼트를 선택
        const headerSticky = document.querySelector(".headArea"); // 스티키 헤더 엘리먼트를 선택
        let scrollY = window.scrollY; // 스크롤 위치 가져오기
        
        
        if (scrollY > 167.000) {
            headerSticky.style.display = 'flex';
            headerSticky.style.opacity = '1';
            headerSticky.style.pointerEvents = 'auto';
        
        } else {
            // headerSticky.style.display = 'none';
            header.style.opacity = '1';
            headerSticky.style.opacity = '0';
            // headerSticky.style.pointerEvents = 'none';
            $(".nav").hide();
            $(".toggle > div").removeClass('active');
        }


        if(scrollY < 210){
            headerSticky.style.display = 'none';
        }
    });

</script>