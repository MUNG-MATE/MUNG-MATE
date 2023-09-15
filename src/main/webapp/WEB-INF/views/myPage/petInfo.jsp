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
    <h4 id="resSubTitle">* 반려견은 총 3마리만 등록 가능 합니다. *</h4>
    
	<section id="container">

		
		<div class="joinPetArea"><button id="joinPet" onclick="location.href='/myPage/petInfo/insert'">등록하기</button></div>
		
		
			<div class=petInfolist>

				<c:forEach items="${loginMemberPet}" var="petList">

					<form action="/myPage/petInfo/update" method = "POST">
						<div class="petListdiv" id="petListdiv" name="memberNo" value="${petList.memberNo}">

								<h2>펫 프로필</h2>

								<label>
									<!-- <input type="file" name="inputImage" id="inputImage"> -->
									<c:if test="${petList.petProfile == null}" >
										<img id="petImage" src="/resources/images/reservation/inputpetimage.png">
									</c:if>

									<c:if test="${petList.petProfile != null}" >
										<img id="petImage" src="${petList.petProfile}" >
										<input type="hidden" name="petProfile" value="${petList.petProfile}"/>
									</c:if>

								</label>
							
								<h2>기본 사항</h2>

								<table class="petListTable" id="petListTable">
									<tr>
										<c:if test="${petList.petGender == '남'}" >
											<th>이름</th>
											<td><input type="text" id="petName" name="petName" value="${petList.petName} 왕자" readonly></td>
										</c:if>
										<c:if test="${petList.petGender == '여'}" >
											<th>이름</th>
											<td><input type="text" id="petName" name="petName" value="${petList.petName} 공주" readonly></td>
										</c:if>
									</tr>
									<tr>
										<th>품종</th>
										<td><input type="text" id="petType" name="petType" value="${petList.petType}" readonly></td>
									</tr>
									<tr>
										<th>생년월</th>
										<td id="birthTd"><input type="text" id="petBirth" name="petBirth" value="${petList.petBirth}" readonly></td>
									</tr>
									<%-- <tr>
										<th>성별</th>
										<c:if test="${petList.petGender == '남'}" >
											<td id="genderTd"><input type="radio" name="gender1" id="Petgender1" value="f"checked readonly>여자아이 <input type="radio" name="gender2" id="Petgender2" value="m" readonly >남자아이</td>
										</c:if>
										<c:if test="${petList.petGender == '여'}" >
											<td id="genderTd"><input type="radio" name="gender3" id="Petgender1" value="f"  readonly>여자아이 <input type="radio" name="gender4" id="Petgender2" value="m" readonly checked>남자아이</td>
										</c:if>
									</tr> --%>
								</table>

								<h2>참고 사항</h2>

								<textarea id="note" name="petOption" readonly>${petList.petOption}</textarea>
								<input type="hidden" name="petGender" value="${petList.petGender}"/>
								<input type="hidden" name="petNo" value="${petList.petNo}"/>

								<div id="btnArea">
									<button type="summit" class="btnStyle" id="petUpdateBtn">수정</button>
								
									<button type="button" class="btnStyle" onclick="deletePet('${petList.petNo}','${petList.petName}','${petList.petType}','${petList.petOption}','${petList.petGender}','${petList.petProfile}')">삭제</button>
								</div>
						</div>
						<input type="hidden" name="memberNo" value="${petList.memberNo}">
					</form>
				</c:forEach>
			</div>	

	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="../../../resources/js/myPage/petInfo.js"></script>
</body>
</html>