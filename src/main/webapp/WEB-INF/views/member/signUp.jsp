<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <link rel="stylesheet" href="../../../resources/css/member/signUp.css">
</head>
<body>
    <div class="totalContainer">
       
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <form action="/member/signUp" method="POST" name="signUpFrm" id="signUpFrm">
        <div class="bodyContainer">
            
            <div class="contentContainer">

                <div class="signUpTitle">회원가입</div>

                    <div class="signUpName">
                        <div>이름</div>
                        <div><input type="text" id="signUpInputName"></div>
                    </div>
    
                    <div class="signUpNickname">
                        <div>닉네임</div>
                        <div><input type="text" id="signUpInputNickname"></div>
                    </div>
                    
                    <div class="signUpEmail">
                        <div>아이디(이메일)</div>
                        <div><input type="text" id="signUpInputEmail"> <button id="emailCheck">인증번호 전송</button></div>
                    </div>
                    <div id="emailMessage">메일을 입력해 주시길 바랍니다.</div>
                    
                    <div class="signUpEmailcheck">
                        <div>인증번호 입력</div>
                        <div><input type="text" id="signUpInputEmailCheck"><button id="checkclear">인증</button></div>
                        <div>05:00</div>
                    </div>
    
    
                    <div class="signUpPassword">
                        <div>비밀번호</div>
                        <div><input type="text" id="signUpInputPassword"></div>
                    </div>
                    <div>문자 + 숫자 12글자 이상 작성해주시길 바랍니다.</div>
    
    
                    <div class="signUpPasswordCheck">
                        <div>비밀번호 확인</div>
                        <div><input type="text" id="signUpInputPasswordCheck"></div>
                    </div>
                    <div>비밀번호가 일치하지 않습니다.</div>
    
                    <div class="signUpPhone">
                        <div>휴대전화 번호</div>
                        <div><input type="text" id="signUpInputPhone"></div>
                    </div>
    
                    <div class="signUpAddress">
                        <div>주소</div>
                        <div><input type="text" id="signUpInputAddress"> <button id="AddressAPI">우편번호 찾기</button></div>
                        <div><input type="text" class="signUpInputAddress"></div>
                        <div><input type="text" class="signUpInputAddress"></div>
                    </div>
    
                    <div class="agreeArea">
                        <div>
                            <div class="checkboxTitle">개인정보 마케팅 활용 동의</div>
                            <div class="checkboxSlogan">MUNGMATE에서의 개인정보 마케팅 활용에 동의하시겠습니까?</div>
                            <div class="checkboxArea">
                                <div><input type="radio" id="agree1" name="agree" class="radiopart"><label for="agree1">동의함</label></div>
                                <div><input type="radio" id="notAgree1" name="agree" class="radiopart"><label for="notAgree1">동의하지않음</label></div>
                            </div>
                        </div>
                        <div class="checkBoxBtnArea"><button>약관 확인</button></div>
                    </div>
    
                    <div class="agreeArea">
                        <div>
                            <div class="checkboxTitle">개인정보 제3자 제공 동의</div>
                            <div class="checkboxSlogan">서비스 제공을 위한 개인정보 제 3자 제공에 동의하시겠습니까?</div>
                            <div class="checkboxArea">
                                <div><input type="radio" id="agree2" name="agree2" class="radiopart"><label for="agree2"><span>동의함</span></label></div>
                                <div><input type="radio" id="notAgree2" name="agree2" class="radiopart"><label for="notAgree2"><span>동의하지않음</span></label></div>
                            </div>
                        </div>
                        <div class="checkBoxBtnArea"><button>약관 확인</button></div>
                    </div>
    
                    <div class="signUpBtnArea"><button id="signUpBtn">회원가입</button></div>
                </div>
            </div>
        </form>
       <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </div>

    <script src="/resources/js/signUp.js"></script>
</body>
</html>