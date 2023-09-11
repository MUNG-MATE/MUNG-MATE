<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/Administrator/sidebar.css">

	<nav class="nav">
                <div class="sidebar-img">
                    <div class="s-img">
                        이미지
                    </div>

                </div>
                <ul class="gnb">
                <c:if test="${!empty loginMember}" >
                    <li>
                        <a href='javascript:void(0);'>My Page</a>
                        <ul class="sub_gnb">
                            <li><a href = "/myPage/memberInfo">내 정보</a></li>
                            <li><a href = "/myPage/memberInfoUpdate">내 정보 수정</a></li>
                            <li><a href = "/myPage/memberSecession">계정 탈퇴</a></li>
                            <c:if test="${loginMember.petsitterFlag == 'N'}" >
                            <li><a href = "/petsitter/toPetsitterApply">펫시터 되기</a></li>
                            </c:if>
                             <c:if test="${loginMember.petsitterFlag == 'Y'}" >
                            <li><a  href = "/petsitter/toGeneralApply">펫시터 그만두기</a></li>
                            </c:if>
                        </ul>
                    </li>
                </c:if>

                    <li>
                        <a href='javascript:void(0);'>멍메이트</a>
                        <ul class="sub_gnb">
                            <li></li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </li>

                    <li>
                        <a href='javascript:void(0);'>멍메이트</a>
                        <ul class="sub_gnb">
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </li>

                    <li>
                       <a href='javascript:void(0);'>멍메이트</a>
                        <ul class="sub_gnb">
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </li>

                    <li>
                        <a href='javascript:void(0);'>관리자</a>
                        <ul class="sub_gnb">
                            <li>회원정보 관리</li>
                            <li>펫시터 관리</li>
                            <li>예약 관리</li>
                            <li><a href = "/petsitter/admin/petsitterlist1">펫시터 신청 관리</a></li>
                        </ul>
                    </li>
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