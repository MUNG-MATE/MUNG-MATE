<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/Administrator/sidebar.css">

	<nav class="nav">
                <ul class="gnb">
                <c:if test="${empty loginMember}" >
                    <li>
                    <a href='/myPage/memberInfo' class="sideimgbox">
                        <img src="/resources/images/member/user.png">
                    </a>

                    </li>
                    <li>
                    <a href="/member/login">Login</a><a href="/member/signUp">Join</a>
                    </li>

                    <li>
                </c:if>

                <c:if test="${!empty loginMember}" >
                    <li>
                    <a href='/myPage/memberInfo' class="sideimgbox">
                        <img src="${loginMember.profileImage}">
                    </a>
                    </li>

                    <li>
                        <a href='javascript:void(0);'>My-Info</a><a href="/member/logout">Logout</a>
                    </li>
                    <li>
                        <a href='javascript:void(0);'>My Page</a>
                        <ul class="sub_gnb">
                            <li><a href = "/myPage/memberInfo">내 정보</a></li>
                            <li><a href = "/myPage/petInfo">내 반려견</a></li>
                            <li><a href = "#">내 찜목록</a></li>
                            <c:if test="${loginMember.petsitterFlag == 'N'}" >
                                <li><a href = "/petsitter/toPetsitterApply">펫시터 되기</a></li>
                            </c:if>
                            <c:if test="${loginMember.petsitterFlag == 'Y'}" >
                                <li><a  href = "/petsitter/toGeneralApply">펫시터 그만두기</a></li>
                            </c:if>
                            <li><a href = "/myPage/memberSecession">계정 탈퇴</a></li>
                           <%--  <c:if test="${loginMember.petsitterFlag == 'Y'}" >
                            <li><a href="/petsitter/reservationList_p"> 펫시터 예약목록     증발띠    </a></li>
                            </c:if>  --%>
                        </ul>
                    </li>
                </c:if>
                    <li>
                        <a href='javascript:void(0);'>멍메이트</a>
                        <ul class="sub_gnb">
                            <li><a  href = "/myPage/myPost">내 게시글</a></li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </li>

                    <li>
                       <a href='javascript:void(0);'>신고하기</a>
                        <ul class="sub_gnb">
                            <li><a href="/Administrator/declaration">신고</a></li>
                            <li>모르겠는데?</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </li>
                    <c:if test="${loginMember.adminFlag == 'Y'}" >
                        <li>
                            <a href='javascript:void(0);'>관리자</a>
                            <ul class="sub_gnb">
                                <li><a href="/Administrator/management">회원정보 관리</a></li>
                                <li><a href="/Administrator/petManagement">펫시터 관리</a></li>
                                <li><a href="/Administrator/reserve">예약 관리</a></li>
                                <li><a href="/petsitter/admin/petsitterlist1">펫시터 신청 관리</a></li>
                                <li><a href="/Administrator/declarationList">신고 관리</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <div class="toggle">
                <div class="toggle_btn">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
            <script src="/resources/js/Administrator/code.jquery.com_jquery-3.7.1.min.js"></script>
    <script src="/resources/js/Administrator/sidebar.js"></script>