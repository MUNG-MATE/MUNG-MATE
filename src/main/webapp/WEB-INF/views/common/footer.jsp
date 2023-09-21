<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/footer.css">

	<footer class="footer">
		<!-- <ul class="quick_menu_list">
			<li><a href="#"><img src="/resources/images/footer/footer_menu01.png" alt="우리가최고조">
					<p>일석2조</p> </a></li>
			<li><a href="#"><img src="/resources/images/footer/footer_menu02.png" alt="우리가최고조">
					<p>일석2조</p> </a></li>
			<li><a href="#"><img src="/resources/images/footer/footer_menu03.png" alt="우리가최고조">
					<p>일석2조</p> </a></li>
			<li><a href="#"><img src="/resources/images/footer/footer_menu04.png" alt="우리가최고조">
					<p>일석2조</p> </a></li>
		</ul> -->

		<div class = "gotoLive">
			<a href = "/live"><img src = "/resources/images/강아지버튼.png" id = "gotoLive"></a>
			<h4>LIVE</h4>
		</div>

		<div class="footer_wrap">
			<div class="container">
				<ul class="footer_sns_icon">
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_01.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_03.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_05.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_07.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_09.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_11.png" alt=""></a></li>
					<li><a href="#"><img src="/resources/images/footer/footer_sns_icon_13.png" alt=""></a></li>
				</ul>

				<ul class="footer_bottom_list">
					<li><a href="#">회사소개</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">애완동물 제공사실 열람</a></li>
					<li><a href="#">일석이조</a></li>
					<li><a href="#">찾아오는길</a></li>
				</ul>

				<div class="copyright">
					<h4>&#40;주&#41;일석2조</h4>
					<h5>
						대표이사 문광민. 사업자등록번호 220-81-18745<br> 저작권신고 제2023-서울강남-00481호 사업자정보확인
					</h5>
					<p>Copyright &copy; MUNG-MATE Corp. All Rights Reserved.</p>
				</div>
			</div>
		</div>

	</footer>
	<c:if test="${!empty message}">

		<script>
      
        alert("${message}");
        
   		</script>
		<c:remove var="message" scope="session"/>
	</c:if>

