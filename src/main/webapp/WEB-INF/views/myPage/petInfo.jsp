<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MUNG MATE</title>
    <link rel="stylesheet" href="../../../resources/css/myPage/petInfo.css">
</head>
    <jsp:include page="/WEB-INF/views/common/headerLast.jsp" />
    
<body>
	<h1 id="resTitle">${loginMember.memberNickname}님의 반려견 정보 </h1>
    <h4 id="resSubTitle">사랑하는 반려견 정보를 확인해주세요.</h4>
    
	<section id="container">
		<div class="joinPetArea"><button id="joinPet">등록하기</button></div>
		<div class=petInfolist>
			<c:forEach items="${loginMemberPet}" var="petList">
			<div class="petListdiv">
	
		

				<h2>펫 프로필</h2>
				<label>
					<!-- <input type="file" name="inputImage" id="inputImage"> -->
						<img id="petImage" src="${petList.petProfile}">
				</label>
			
				<h2>기본 사항</h2>
				<table class="petListTable">
					<tr>
						<th>이름</th>
						<td><input type="text" id="petName" name="petName" value="${petList.petName}" readonly></td>
					</tr>
					<tr>
						<th>품종</th>
						<td><input type="text" id="petType" name="petType" value="${petList.petType}" readonly></td>
					</tr>
					<tr>
						<th>생년월</th>
						<td id="birthTd"><input type="text" id="petBirth" name="petBirth" value="${petList.petBirth}" readonly></td>
					</tr>
					<tr>
						<th>성별</th>
						<c:if test="${petList.petGender != '남'}" >
							<td id="genderTd"><input type="radio" name="gender1" id="Petgender1" value="f"checked readonly>여자아이 <input type="radio" name="gender2" id="Petgender2" value="m" readonly >남자아이</td>
						</c:if>
						<c:if test="${petList.petGender != '여'}" >
							<td id="genderTd"><input type="radio" name="gender3" value="f"  readonly>여자아이 <input type="radio" name="gender4" value="m" readonly checked>남자아이</td>
						</c:if>
					</tr>
				</table>
			
				<h2>참고 사항</h2>
				
				<textarea id="note" placeholder="위 사항 외에도 펫시터가 주의해야할 점이나 참고해야할 특이사항이 있다면 이곳에 자세히 적어주세요." readonly>${petList.petOption}</textarea>
			<div id="btnArea">
				<button class="btnStyle">수정</button>
				<button class="btnStyle">삭제</button>
			</div>
			</div>
			</c:forEach>
		</div>	
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="../../../resources/js/myPage/petInfo.js"></script>
</body>
</html>