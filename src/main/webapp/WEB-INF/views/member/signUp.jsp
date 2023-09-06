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
                            <div><input type="text" id="signUpInputName" name="memberName" autocomplete="off"></div>
                        </div>

                        <div class="signUpNickname">
                            <div>닉네임</div>
                            <div><input type="text" id="signUpInputNickname" name="memberNickname" autocomplete="off"></div>
                        </div>
                        <div id="nickMessage">한글,영어,숫자로만 2~10글자</div>

                        <div class="signUpEmail">
                            <div>아이디(이메일)</div>
                            <div><input type="text" id="signUpInputEmail" name="memberEmail" autocomplete="off"> <button id="emailCheck"
                                    type="button">인증번호 전송</button></div>
                        </div>
                        <div id="emailMessage">메일을 입력해 주시길 바랍니다.</div>

                        <div class="signUpEmailcheck">
                            <div>인증번호 입력</div>
                            <div><input type="text" id="signUpInputEmailCheck" maxlength="6" autocomplete="off" autocomplete="off"><button
                                    id="checkclear" type="button">인증</button></div>
                            <div id="authKeyTime">05:00</div>
                        </div>
                        <div id="authKeyMessage"></div>


                        <div class="signUpPassword">
                            <div>비밀번호</div>
                            <div><input type="text" id="signUpInputPassword" name="memberPw" autocomplete="off"></div>
                        </div>
                        <div id="pwMessage1">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.</div>


                        <div class="signUpPasswordCheck">
                            <div>비밀번호 확인</div>
                            <div><input type="text" id="signUpInputPasswordCheck" autocomplete="off"></div>
                        </div>
                        <div id="pwMessage2">비밀번호가 일치하지 않습니다.</div>

                        <div class="signUpPhone">
                            <div>휴대전화 번호</div>
                            <div><input type="text" id="signUpInputPhone" name="memberTel" autocomplete="off"></div>
                        </div>
                        <div id="telMessage">전화번호를 입력해주세요.(- 제외)</div>

                        <div class="signUpAddress">
                            <div>주소</div>
                            <div><input type="text" id="signUpInputAddress" class="postcode" name="memberAddress" autocomplete="off">
                                <button id="AddressAPI" type="button" onclick="DaumPostcode()">우편번호 찾기</button></div>
                            <div><input type="text" class="signUpInputAddress" id="address" name="memberAddress" autocomplete="off"></div>
                            <div><input type="text" class="signUpInputAddress" id="detailAddress" name="memberAddress" autocomplete="off">
                            </div>
                        </div>

                        <div class="agreeArea">
                            <div>
                                <div class="checkboxTitle">개인정보 마케팅 활용 동의</div>
                                <div class="checkboxSlogan">MUNGMATE에서의 개인정보 마케팅 활용에 동의하시겠습니까?</div>
                                <div class="checkboxArea">
                                    <div><input type="radio" id="agree1" name="agree" class="radiopart" autocomplete="off"><label
                                            for="agree1">동의함</label></div>
                                    <div><input type="radio" id="notAgree1" name="agree" class="radiopart" autocomplete="off"><label
                                            for="notAgree1">동의하지않음</label></div>
                                </div>
                            </div>
                            <div class="checkBoxBtnArea" id="rollcheckbtn1"><button type="button">약관 확인</button></div>
                        </div>

                        <div class="agreeArea">
                            <div>
                                <div class="checkboxTitle">개인정보 제3자 제공 동의</div>
                                <div class="checkboxSlogan">서비스 제공을 위한 개인정보 제 3자 제공에 동의하시겠습니까?</div>
                                <div class="checkboxArea">
                                    <div><input type="radio" id="agree2" name="agree2" class="radiopart" autocomplete="off"><label
                                            for="agree2"><span>동의함</span></label></div>
                                    <div><input type="radio" id="notAgree2" name="agree2" class="radiopart" autocomplete="off"><label
                                            for="notAgree2"><span>동의하지않음</span></label></div>
                                </div>
                            </div>
                            <div class="checkBoxBtnArea" id="rollcheckbtn2"><button type="button">약관 확인</button></div>
                        </div>

                        <div class="signUpBtnArea"><button id="signUpBtn">회원가입</button></div>
                    </div>
                </div>
            </form>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <div class="modal" id="agreepart1">
                <div class="modal_body1">
                    <h1>개인정보 마케팅 활용 동의</h1>
                    <textarea cols="60" rows="10" style="resize: none;">
제 1조 목적
멍메이트는 고객님들에게 보다 다양한 정보를 제공하고, 서비스의 질을 향상시키기 위하여「개인정보보호법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률 」및 「신용정보의 이용 및 보호에 관한 법률」의 규정을 준수하여 회원님의 개인(신용)정보를 제3자에게 상품소개 및 홍보 등 영업목적으로 제공할 수 있습니다.

제 2조 (수집 및 활용 관련 정보)
개인정보가 제공되는 멍메이트 제공된 정보의 이용목적은 아래와 같습니다. 회원님들 중 이 개인정보의 제 3자 마케팅 활용동의서 등에 동의하신 회원님들의 정보만이 제공되며, 제공된 정보는 명시된 이용목적을 벗어나 이용되지 않고, 개인정보 유출 등 사고가 일어나지 않도록 더욱 철저한 보안이 이루어지도록 노력하고 있습니다. 
제공받는 자: 멍메이트
제공 항목 : 성명, 이메일, 전화번호, 주소 등 
제공 목적 : 멍메이트의 서비스 이용 및 홍보
제공 기간 : 제공받는자의 개인정보취급방침에 따름

제 3조(제3자 정보제공의 동의 철회)
신규회원 중 제3자 정보제공을 철회하고 싶은 회원은 이미 제3자에게 제공된 개인정보라 하더라도, 언제든지 열람, 정정,삭제를 요구할 수 있습니다. 열람,정정,삭제 및 정보제공 등의 철회는 전화와 이메일등을 통하여 본인 확인 후 요청할 수 있습니다. 
이미 제공된 회원정보를 철회하는 데는 일정 시간이 소요됩니다.                 
                    
                    </textarea>
                    <button id="rollCloseBtn1" type="buttn">닫기</button>
                </div>                
            </div>

            <div class="agreepart2 modal" id="agreepart2">
                <div class="modal_body2">
                    <h1>개인정보 제3자 제공 동의</h1>
                    <textarea cols="60" rows="10" style="resize: none;">
다음과 같이 개인정보를 제 3자에게 제공하고 있습니다.

멍메이트는 개인정보 보호법 제22조 제4항과 
제 39조의 3에 따라사용자의 광고성 정보 수신과 
이에 따른 개인정보 처리에 대한 동의를
받고 있습니다.

① 개인정보 수집 항목

-> 이름, 휴대폰 번호, 이메일, 생년월일, 주소

② 개인정보 수집 이용 목적

-> 이벤트 운영 및 광고성 정보 전송 및
서비스 관련 정보 전송

③ 보유 및 이용 기간

-> 회원 탈퇴 시까지

④ 전송 내용

-> 혜택 정보, 이벤트 정보, 상품 정보, 신규 서비스 안내
의 광고성 정보 제공                  
                    
                    </textarea>
                    <button id="rollCloseBtn2" type="buttn">닫기</button>
                </div>                
            </div>
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