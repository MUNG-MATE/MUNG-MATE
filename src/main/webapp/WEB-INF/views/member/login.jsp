<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>

        <link rel="stylesheet" href="../../../resources/css/member/Login.css">
    </head>

    <body>
        <div class="totalContainer">

            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <form action="/member/login" method="POST">
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
                                    <input type="text" id="inputEmail" name="memberEmail"  placeholder="이메일" autocomplete="off">
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
                                <div><input type="checkbox" id="saveId"><label for="saveId" autocomplete="off">아이디 저장</label></div>
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
                                    <a href="#">회원가입</a>
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
                <div><button class="loginPageBtn" id="searchNoBtn"><span>돌아가기</span></button></div>

            </div>
        </div>


        <div class="findprofileArea modal" id="findprofilePassword">
            <div class="profilePasswordCheck">
                <div>비밀번호 찾기</div>
                <div>인증된 이메일만 정보 찾기가 가능합니다</div>
                <div>

                </div>
                <div>이메일</div>
                <div>
                    <input type="text" id="searchInputEmail" autocomplete="off">
                    <button id="checkNumberBtn">인증번호 전송</button>
                </div>
                <div>05:00</div>
                <div>인증번호</div>
                <div>
                    <input type="text" id="inputCheckNumber" autocomplete="off">
                </div>
                <div><button class="loginPageBtn" id="searchYesBtn1"><span>확인</span></button></div>
                <div><button class="loginPageBtn" id="searchNoBtn2"><span>돌아가기</span></button></div>

            </div>
        </div>
        <script src="/resources/js/member/login.js"></script>

    </body>

    </html>