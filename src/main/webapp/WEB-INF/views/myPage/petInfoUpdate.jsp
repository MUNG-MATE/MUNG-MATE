<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="/resources/css/myPage/petInfoinsert.css"><!-- /resources/css/reservation/reservation_3.css -->
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">${loginMember.memberNickname}님의 반려견 정보 수정</h1>
    <h4 id="resSubTitle">반려견의 정보를 수정해주세요.</h4>
    <form action="/myPage/petInfo/updatePet" method = "POST" id="petInfoUpdate" name="petInfoUpdate" enctype ="multipart/form-data">

		<section id="container">
			<h2>펫 프로필</h2>
			<span id="deleteImage">x</span>
			<label>
				<input type="file" name="inputImage" id="inputImage">
				<img id="petImage" src="${pet.petProfile}">
				<input type="hidden" name="petImage" value="${pet.petProfile}">
			</label>
			<h2>기본 사항<b>*</b></h2>
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" id="petName" name="petName" value="${fn:substring(pet.petName,0,3) }"></td>
				</tr>
				<tr>
					<th>품종</th>
					<td><input type="text" id="petType" name="petType" value="${pet.petType}"></td>
				</tr>
				<tr>
					<th>생년월</th>
					<td id="birthTd"><input type="text" id="petBirth" name="petBirth" value="${pet.petBirth}" placeholder="년월까지만 작성해주세요."></td>
				</tr>
				<tr>
					<th>성별</th>
					<c:if test="${pet.petGender != '남'}" >
						<td id="genderTd"><input type="radio" name="gender" id="Petgender1" value="f"checked readonly>여자아이 <input type="radio" name="gender" id="Petgender2" value="m" readonly >남자아이</td>
					</c:if>
					<c:if test="${pet.petGender != '여'}" >
						<td id="genderTd"><input type="radio" name="gender" id="Petgender1" value="f"  readonly>여자아이 <input type="radio" name="gender" id="Petgender2" value="m" readonly checked>남자아이</td>
					</c:if>
				</tr>
			</table>
			
		
			<h2>특이 사항</h2>
			<textarea id="note" name="petOption" placeholder="펫시터가 주의해야할 점이나 참고해야할 특이사항이 있다면 이곳에 자세히 적어주세요.">${pet.petOption}</textarea>

			<div id="btnArea">
				<button type="button" class="btnStyle prev" onclick="location.href='/myPage/petInfo'">&lt 이전</button>
				<button class="btnStyle next">수정 &gt</button>
			</div>
		</section>
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/myPage/petInfoupdate.js"></script>
</body>
</html>