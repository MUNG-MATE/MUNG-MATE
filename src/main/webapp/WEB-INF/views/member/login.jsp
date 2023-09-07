<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>

        <link rel="stylesheet" href="../../../resources/css/member/Login.css">
    </head>

    <body>
        <!-- <button id="kakaoPay">결제하기</button> -->

        <c:if test="${ !empty cookie.saveId.value}">
            <c:set var="chk" value="checked"/>
        </c:if>

        <div class="totalContainer">

            <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />

            <form action="/member/login" method="POST" id="loginForm">
                <div class="bodyContainer" id="bodyAllContainer">
                    <div class="contentContainer">
                        <div></div>
                        <div>
                            <div class="loginNonepart"></div>
                            <div class="InputEmailArea">
                                <div class="smallImagePart">
                                    <img src="../../../resources/images/person-circle.svg" class="emailImg">
                                </div>
                                <div class="emailInputPart">
                                    <input type="text" id="inputEmail" name="memberEmail"  placeholder="이메일" value="${cookie.saveId.value}" autocomplete="off">
                                </div>
                            </div>
                            <div class="InputPasswordArea">
                                <div class="smallImagePart">
                                    <img src="../../../resources/images/shield-lock.svg" class="passwordImg">
                                </div>
                                <div class="passwordInputPart">
                                    <input type="text" id="inputPassword" name="memberPw" placeholder="패스워드" autocomplete="off">
                                </div>
                            </div>
                            <div class="checkboxArea">
                                <div><input type="checkbox" id="saveId" name="saveId" ${chk}><label for="saveId" autocomplete="off" >아이디 저장</label></div>
                                <div></div>
                                <div>
                                    <button type="button" id="findInfoBtn1">이메일 찾기</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" id="findInfoBtn2">비밀번호 찾기</button>
                                </div>
                            </div>
                            <div class="loginBtnArea">
                                <button class="loginPageBtn" id="loginBtn"><span>로그인</span></button>
                            </div>
                            <div class="siguUpArea">
                                <div>혹시 회원이 아니신가요?</div>
                                <div></div>
                                <div>
                                    <a href="signUp">회원가입</a>
                                </div>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </form>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        </div>
    
        <div class="findprofileArea modal" id=findprofile>
            <div class="profileCheck">
                <div>아이디 찾기</div>
                <div>인증된 이메일만 정보 찾기가 가능합니다</div>
                <div id="findInfoContent">

                </div>
                <div id="findInfoTitle1">이름</div>
                <div>
                    <input type="text" id="searchInputName" name="findInfovalue1" autocomplete="off">
                </div>
                <div id="findInfoTitle2">전화번호</div>
                <div>
                    <input type="text" id="searchInputPhone" name="findInfovalue2" autocomplete="off">
                </div>
                <div><button class="loginPageBtn" id="searchYesBtn"><span>확인</span></button></div>
                <div><button class="loginPageBtn" id="searchNoBtn" ><span>돌아가기</span></button></div>

            </div>
        </div>


        <div class="findprofileArea modal" id="findprofilePassword">
            <form action="/member/findPw" method="POST" id="findPwForm">
                <div class="profilePasswordCheck">
                    <div>비밀번호 찾기</div>
                    <div>인증된 이메일만 정보 찾기가 가능합니다</div>
                    <div>
                    </div>
                    <div>이메일</div>
                    <div>
                        <input type="text" id="searchInputEmail" name="memberEmail" autocomplete="off" key=${memberEmail}>
                        <button type="button" id="emailCheck">인증번호 전송</button>
                    </div>
                    
                    <div>인증번호</div>
                    <div>
                        <input type="text" id="inputCheckNumber" maxlength="6" autocomplete="off">
                        <button type="button" id="checkclear">인증</button>
                    </div>
                    <div id="authKeyTime">05:00</div>
                    <div><button class="loginPageBtn" id="searchYesBtn1"><span>확인</span></button></div>
                    <div><button type="button" class="loginPageBtn" id="searchNoBtn2"><span>돌아가기</span></button></div>
                    
                </div>
            </form>
        </div>
        <script src="/resources/js/member/login.js"></script>

    </body>

    </html>