<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 문자열 관련 함수(메소드) 제공 JSTL (EL 형식으로 작성) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="/resources/css/myPage/memberSecession.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <div class="content">
        <div class="secessionTitle">
            <h1>회원 탈퇴</h1>
        </div>
        <form action="memberSecession" method="POST" name="secessionFrm" id="secessionFrm">

            <!-- 회원 탈퇴 약관 -->
            <div class="terms">
                <label>회원 탈퇴 약관</label>
            </div>

            <!-- 약관 내용 -->
            <pre class="termsContent">
                    제1조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4


                    제2조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4

                    제1조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4


                    제2조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4

                    제1조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4


                    제2조
                    이 약관은 샘플 약관입니다.

                    ① 약관 내용 1

                    ② 약관 내용 2

                    ③ 약관 내용 3

                    ④ 약관 내용 4

            </pre>
            <div class="agree">
                <!-- 회원 탈퇴 약관 동의 체크박스 -->
                <input type="checkbox" name="agree" id="agree">
                <label for="agree">위 약관에 동의합니다.</label>
            </div>

            
            <!-- 탈퇴 시 비밀번호 입력란 -->
            <div class="password">
                <label>비밀번호를 입력해주세요.</label>
                <input type="password" name="memberPw" id="memberPw" maxlength="30">
            </div>


            <!-- 탈퇴 버튼 -->
            <div class="secessionBtn">
                <button id="secessionCancelBtn">탈퇴 취소</button>
                <button id="secessionBtn">탈퇴</button>
            </div>
        </form>

    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      <script src="/resources/js/myPage/memberSecession.js"></script>
</body>




</html>