<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/reservation/reservation_3.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">예약 서비스[3/4]</h1>
    <h4 id="resSubTitle">반려동물을 등록해주세요.</h4>
    
	<section id="container">
	    <h2>펫 프로필</h2>
	    <label>
	        <input type="file" name="inputImage" id="inputImage">
	        <img id="petImage" src="/resources/images/reservation/inputpetimage.png">
	    </label>
	
	    <h2>기본 사항<b>*</b></h2>
	    <table>
	        <tr>
	            <th>이름</th>
	            <td><input type="text" id="petName" name="petName"></td>
	        </tr>
	        <tr>
	            <th>품종</th>
	            <td><input type="text" id="petType" name="petType"></td>
	        </tr>
	        <tr>
	            <th>생년월</th>
	            <td id="birthTd"><select id="birth" name="petYear"></select><select id="month" name="petMonth"></select></td>
	        </tr>
	        <tr>
	            <th>성별</th>
	            <td id="genderTd"><input type="radio" name="gender" value="f">여자아이 <input type="radio" name="gender" value="m">남자아이</td>
	        </tr>
	    </table>
	
	    <h2>참고 사항</h2>
	    <textarea id="note" placeholder="위 사항 외에도 펫시터가 주의해야할 점이나 참고해야할 특이사항이 있다면 이곳에 자세히 적어주세요."></textarea>
	
	    <div id="checkboxDiv">
	        <input type="checkbox" name="check" id="checkbox"> 아래 내용을 확인하였습니다.
	    </div>
	
	    <p>위 내용을 사실과 다르게 기재한 경우, 약관에 따라 서비스 이용이 거부될 수 있습니다.</p>
	
	    <div id="btnArea">
	        <button class="btnStyle prev">&lt 이전</button>
	        <button class="btnStyle next">다음 &gt</button>
	    </div>
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/reservation/reservation_3.js"></script>
</body>
</html>