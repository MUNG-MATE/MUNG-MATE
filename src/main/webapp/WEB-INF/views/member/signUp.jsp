<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
                            <div><input type="text" id="signUpInputName" name="memberName"></div>
                        </div>

                        <div class="signUpNickname">
                            <div>닉네임</div>
                            <div><input type="text" id="signUpInputNickname" name="memberNickname"></div>
                        </div>
                        <div id="nickMessage">한글,영어,숫자로만 2~10글자</div>

                        <div class="signUpEmail">
                            <div>아이디(이메일)</div>
                            <div><input type="text" id="signUpInputEmail" name="memberEmail"> <button id="emailCheck"
                                    type="button">인증번호 전송</button></div>
                        </div>
                        <div id="emailMessage">메일을 입력해 주시길 바랍니다.</div>

                        <div class="signUpEmailcheck">
                            <div>인증번호 입력</div>
                            <div><input type="text" id="signUpInputEmailCheck" maxlength="6" autocomplete="off"><button
                                    id="checkclear" type="button">인증</button></div>
                            <div id="authKeyTime">05:00</div>
                        </div>
                        <div id="authKeyMessage"></div>


                        <div class="signUpPassword">
                            <div>비밀번호</div>
                            <div><input type="text" id="signUpInputPassword" name="memberPw"></div>
                        </div>
                        <div id="pwMessage1">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</div>


                        <div class="signUpPasswordCheck">
                            <div>비밀번호 확인</div>
                            <div><input type="text" id="signUpInputPasswordCheck"></div>
                        </div>
                        <div id="pwMessage2">비밀번호가 일치하지 않습니다.</div>

                        <div class="signUpPhone">
                            <div>휴대전화 번호</div>
                            <div><input type="text" id="signUpInputPhone" name="memberTel"></div>
                        </div>
                        <div id="telMessage">전화번호를 입력해주세요.(- 제외)</div>

                        <div class="signUpAddress">
                            <div>주소</div>
                            <div><input type="text" id="signUpInputAddress" class="postcode" name="memberAddress">
                                <button id="AddressAPI" type="button" onclick="DaumPostcode()">우편번호 찾기</button></div>
                            <div><input type="text" class="signUpInputAddress" id="address" name="memberAddress"></div>
                            <div><input type="text" class="signUpInputAddress" id="detailAddress" name="memberAddress">
                            </div>
                        </div>

                        <div class="agreeArea">
                            <div>
                                <div class="checkboxTitle">개인정보 마케팅 활용 동의</div>
                                <div class="checkboxSlogan">MUNGMATE에서의 개인정보 마케팅 활용에 동의하시겠습니까?</div>
                                <div class="checkboxArea">
                                    <div><input type="radio" id="agree1" name="agree" class="radiopart"><label
                                            for="agree1">동의함</label></div>
                                    <div><input type="radio" id="notAgree1" name="agree" class="radiopart"><label
                                            for="notAgree1">동의하지않음</label></div>
                                </div>
                            </div>
                            <div class="checkBoxBtnArea"><button type="button">약관 확인</button></div>
                        </div>

                        <div class="agreeArea">
                            <div>
                                <div class="checkboxTitle">개인정보 제3자 제공 동의</div>
                                <div class="checkboxSlogan">서비스 제공을 위한 개인정보 제 3자 제공에 동의하시겠습니까?</div>
                                <div class="checkboxArea">
                                    <div><input type="radio" id="agree2" name="agree2" class="radiopart"><label
                                            for="agree2"><span>동의함</span></label></div>
                                    <div><input type="radio" id="notAgree2" name="agree2" class="radiopart"><label
                                            for="notAgree2"><span>동의하지않음</span></label></div>
                                </div>
                            </div>
                            <div class="checkBoxBtnArea"><button type="button">약관 확인</button></div>
                        </div>

                        <div class="signUpBtnArea"><button id="signUpBtn">회원가입</button></div>
                    </div>
                </div>
            </form>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />

        </div>

        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function DaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) {
                        var addr = ''; 

                        if (data.userSelectedType === 'R') { 
                            addr = data.roadAddress;
                        } else {
                            addr = data.jibunAddress;
                        }
                        document.getElementsByClassName("postcode")[0].value = data.zonecode;
                        document.getElementById("address").value = addr;
                        document.getElementById("detailAddress").focus();
                    }
                }).open();
            }
        </script>

        <script src="/resources/js/member/signUp.js"></script>
    </body>

    </html>