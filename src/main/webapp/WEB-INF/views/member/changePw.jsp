<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>

    <link rel="stylesheet" href="../../../resources/css/member/changePw.css">
</head>
<body>
    <div class="totalContainer">
       <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
        <form action="/member/changePw" id="changePwForm">
            <div class="bodyContainer">
                <div class="contentContainer">
                    <div></div>
                    <div>
                        <div class="loginNonepart"></div>
                        <div class="InputNewpasswordArea">
                            <div class="newPasswordPart">
                                새 비밀번호 
                            </div>
                            <div>
                                <input type="text" id="inputnewPassword" name="newPw">
                            </div>
                        </div>
                        <div class="inputCheckArea" id="inputCheckText1">
                            변경하실 비밀번호를 입력해 주시길 바랍니다.
                        </div>
                        <div class="InputPasswordArea">
                            <div class="smallImagePart">
                                새 비밀번호 확인
                            </div>
                            <div class="passwordInputPart">
                                <input type="text" id="inputPasswordcheck" name="newPwCheck">
                            </div>
                        </div>
                        <div class="inputCheckArea" id="inputCheckText2">
                            
                        </div>
                        <div class="changePwBtnArea">
                            <button id="changePwBtn"><span>비밀번호 변경</span></button>
                        </div>
                    </div>
                    <div></div>
                </div>
            </div>
        </form>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>


    <script src="/resources/js/member/changePw.js"></script>
</body>
</html>