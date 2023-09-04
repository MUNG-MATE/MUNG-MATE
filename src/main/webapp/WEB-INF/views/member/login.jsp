<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        <div class="navContainer">
          nav
        </div>
        <div class="bodyContainer">
            <div class="contentContainer">
                <div></div>
                <div>
                    <div class="loginNonepart"></div>
                    <div class="InputEmailArea">
                        <div class="smallImagePart">
                            <img src="../../../resources/images/person-circle.svg" class="emailImg">
                        </div>
                        <div class="emailInputPart">
                            <input type="text" id="inputEmail" placeholder="이메일">
                        </div>
                    </div>
                    <div class="InputPasswordArea">
                        <div class="smallImagePart">
                            <img src="../../../resources/images/shield-lock.svg" class="passwordImg">
                        </div>
                        <div class="passwordInputPart">
                            <input type="text" id="inputPassword" placeholder="패스워드">
                        </div>
                    </div>
                    <div class="checkboxArea">
                        <div><input type="checkbox" id="saveId"><label for="saveId">아이디 저장</label></div>
                        <div></div>
                        <div><a href="#">이메일 / 비밀번호 찾기</a></div>
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
        <div class="footerContainer"></div>

        <div class="findprofileArea">
            <div class="profileCheck">
              
                <div>아이디/비밀번호 찾기</div>
                <div>인증된 이메일만 정보 찾기가 가능합니다 :)</div>
                <div>
                    <input type="radio" id="searchEmail" name="findRadio"> <label for="searchEmail" class="searchEmail">아이디 찾기</label> 
                    <input type="radio" id="searchPassword" name="findRadio"> <label for="searchPassword" class="searchPassword">비밀번호 찾기</label>
                </div>
                <div>이름</div>
                <div>
                    <input type="text" id="searchInputName">
                </div>
                <div>휴대전화번호</div>
                <div>
                <input type="text" id="searchInputPhone"> 
                </div>
                <div><button class="loginPageBtn" id="searchYesBtn"><span>확인</span></button></div>
                <div><button class="loginPageBtn" id="searchNoBtn"><span>취소</span></button></div>
            
            </div>            
        </div>

        <div class="findprofileArea">
            <div class="profilePasswordCheck">
                <div>아이디/비밀번호 찾기</div>
                <div>인증된 이메일만 정보 찾기가 가능합니다 :)</div>
                <div>
                    <input type="radio" id="searchEmail" name="findRadio"> <label for="searchEmail" class="searchEmail">아이디 찾기</label> 
                    <input type="radio" id="searchPassword" name="findRadio"> <label for="searchPassword" class="searchPassword">비밀번호 찾기</label>
                </div>
                <div>이메일</div>
                <div>
                    <input type="text" id="searchInputEmail">
                    <button id="checkNumberBtn">인증번호 전송</button>
                </div>
                <div>05:00</div>
                <div>인증번호</div>
                <div>
                    <input type="text" id="inputCheckNumber">
                </div>
                <div><button class="loginPageBtn" id="searchYesBtn"><span>확인</span></button></div>
                <div><button class="loginPageBtn" id="searchNoBtn"><span>취소</span></button></div>

                
            </div>

        </div>
    </div>
</body>
</html>