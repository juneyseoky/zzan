<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 같이 ZZan할까~?</title>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div id="wrap">

		<main id="main">
			<jsp:include page="/ind/header.jsp" />
			<div id="mainImgSlideArea">
				<div id="slideshow">
					<img src="/images/slide/slide01.jpg" alt="slideImg"> 
					<img src="/images/slide/slide02.jpg" alt="slideImg">
				</div>
			</div>
			<h2>Best List</h2>
			<div id="itemListArea" class="dFlex">
				<div id="item">
					<div class="itemImgArea">
						<img src="/images/wisky/Imperial17.jpg" alt="itemImg">
					</div>
					<div class="itemTxtarea">
						<span>임페리얼 17년</span> <span>120000원</span>
					</div>
				</div>
				<div id="item">
					<div class="itemImgArea">
						<img src="/images/wisky/Imperial17.jpg" alt="itemImg">
					</div>
					<div class="itemTxtarea">
						<span>임페리얼 17년</span> <span>120000원</span>
					</div>
				</div>
				<div id="item">
					<div class="itemImgArea">
						<img src="/images/wisky/Imperial19.png" alt="itemImg">
					</div>
					<div class="itemTxtarea">
						<span>임페리얼 19년</span> <span>180000원</span>
					</div>
				</div>
				<div id="item">
					<div class="itemImgArea">
						<img src="/images/wisky/Imperial21.jpg" alt="itemImg">
					</div>
					<div class="itemTxtarea">
						<span>임페리얼 21년</span> <span>240000원</span>
					</div>
				</div>
			</div>
		</main>
		<footer id="footer" class="dFlex">
			<div id="LogoArea">
				<img src="/images/Logo.jpg" alt="Logo">
			</div>
			<div id="footerTxtArea">
				<span>lasdfasdfasdfasdfasdfasdfasdfasdfasdf</span>
			</div>
			<div id="adminArea">
				<a href="#"><img alt="" src="/images/goAdmin_200.jpg"></a>
			</div>
		</footer>
	</div>
</body>
</html>