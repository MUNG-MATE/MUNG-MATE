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
       <jsp:include page="/WEB-INF/views/common/header.jsp" />
        
        <div class="navContainer">
          nav
        </div>
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
                            <input type="text" id="inputnewPassword" placeholder="비밀번호 입력">
                        </div>
                    </div>
                    <div class="inputCheckArea">
                        비밀번호 정규식이 틀립니다.
                    </div>
                    <div class="InputPasswordArea">
                        <div class="smallImagePart">
                            새 비밀번호 확인
                        </div>
                        <div class="passwordInputPart">
                            <input type="text" id="inputPasswordcheck" placeholder="비밀번호 확인">
                        </div>
                    </div>
                    <div class="inputCheckArea">
                        비밀번호가 일치하지 않습니다.
                    </div>
                    <div class="changePwBtnArea">
                        <button id="changePwBtn"><span>비밀번호 변경</span></button>
                    </div>
                </div>
                <div></div>
            </div>
        </div>
        <div class="footerContainer"></div>
    </div>
</body>
</html>