<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 모바일사이트, 반응형사이트 제작시 사용 -->
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/reset.css">
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/common.css">
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/editor.css">
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/layout.css">
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/content.css">
<link rel="stylesheet"
	href="http://www.globaltelecom.co.kr/css/bbs_responsive.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script		
	src="/back/resources/js/main.js"></script>
<script
	src="http://www.globaltelecom.co.kr/js/vendor/jquery.easing.1.3.js"></script>
<script src="http://www.globaltelecom.co.kr/js/common.js"></script>
<script src="http://www.globaltelecom.co.kr/js/layer_popup.js"></script>

<title>비상구에 방문해주셔서 감사합니다.</title>
<style>
#layer_fixed {
	height: 80px;
	width: 100%;
	position: fixed;
	z-index: 999;
	top: 0px;
	left: 0px;
	background-color: #170c14;
}

#mid_out {
	height: 100%;
	width: 100%;
}

#mid_in {
	margin-top: 200px;
	margin-left: 100px;
	color: #ffffff;
	border-left: 0.1em solid #ffffff;
	padding: 1em;
}

#mid_menu {
	max-width: 1560px;
	margin: auto;
}

#pstyle1 {
	color: #ffffff;
	font-size: 35px;
}

#pstyle2 {
	margin: 10px 0px 0px 0px;
	color: #ffffff;
	font-size: 16px;
}

#pstyle3 {
	margin: 10px 0px 0px 0px;
	color: #a7a7a7;
	font-size: 16px;
}

#img_map {
	padding: 300px 0px 0px 100px !important;
}

#img_list {
	padding: 420px 0px 0px 24px !important;
}

#img_bell {
	padding: 80px 0px 0px 45px !important;
}

#img_exit {
	padding: 0px 0px 0px 24px !important;
}

#img_mind {
	padding: 250px 0px 0px 0px !important;
}

@import url(https://fonts.googleapis.com/css?family=Muli);

.snip1555 {
	font-size: 18px;
	letter-spacing: 1.5px;
	line-height: 1em;
	margin: 15px 40px;
	text-transform: uppercase;
}

.snip1555 li {
	display: inline-block;
	list-style: outside none none;
	margin: 0.5em 0.6em;
	padding: 12px 15px;
	position: relative;
}

.snip1555 li button {
	color: #fff;
	text-decoration: none;
}

.snip1555 li a {
	color: #fff;
	text-decoration: none;
}

.snip1555 li:before, .snip1555 li:after {
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
	height: 2px;
	width: 35%;
	background-color: #ff7800;
	position: absolute;
	content: '';
	opacity: 0;
}

.snip1555 li:before {
	top: 0;
	left: 0;
}

.snip1555 li:after {
	bottom: 0;
	right: 0;
}

.snip1555 li:hover:before, .snip1555 li.hover:before, .snip1555 li:hover:after,
	.snip1555 li.hover:after {
	opacity: 1;
}

.snip1555 li:hover:before, .snip1555 li.hover:before {
	left: 65%;
}

.snip1555 li:hover:after, .snip1555 li.hover:after {
	right: 65%;
}

.common {
	display: inline;
	margin-right: 50px;
}

a.type_main {
	margin: 20px 0px 0px 60px;
	font-size: 38px;
}

a.type1 {
	padding-right: 20px;
	font-size: 25px;
}

a.type2 {
	padding-right: 20px;
	font-size: 15px;
}

body {
	background-image: url("./resources/img/background.JPG");
	background-size: cover;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 3% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close1 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close1:hover, .close1:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.close2 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close2:hover, .close2:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.close3 {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close3:hover, .close3:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.acolor {
	color: black;
}

table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
}
	
table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	background: #f3f6f7;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
}

input[type=text] {
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid #ff7800;
}

input[type=password] {
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid #ff7800;
}

input[type=submit] {
	width: 100%;
	height: 50px; background-color : #ff7800;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #ff7800;
}

input[type=submit]:hover {
	background-color: #ff5e00;
}
</style>
</head>
<body>
	<!-- 로고, 상단 메뉴(로그인,회원가입,사이트맵), 메인 메뉴(둥근 메뉴), 배경이미지 , -->
	<%Object o = session.getAttribute("member");%>
	
	<div id="layer_fixed">
		<ul class="snip1555">
			<li style="float: right"><button id="myBtn1">Site Map</button>
				<div id="myModal1" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<div style="text-align: center">
							<span class="close1">&times;</span> 
							<button class="acolor">게시판</button>
							<button class="acolor">대피요령</button>
							<button class="acolor">지도 서비스</button>
							<button class="acolor">SMS 서비스</button>
							<button class="acolor">체크 리스트</button>
							<button class="acolor">상담 리스트</button>
							<button class="acolor">대피 안내</button>
						</div>
					</div>

				</div>
			</li>
			
			<%if(o == null){ %>
			<li style="float: right"><button id="myBtn2">Sign Up</button>
				<div id="myModal2" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span class="close2">&times;</span>
						<div>
							<form action="joinform" method="POST">
								<table style="margin: auto" class="type09">
									<tr>
										<td>
											<h1>회원 가입</h1>
										</td>
									</tr>
									<tr>
										<td><h3>사용자 ID</h3>
											<input type="text" name="userid" placeholder="User ID"
											size="50" /></td>
									</tr>
									<tr>
										<td><h3>사용자 PW</h3>
											<input type="password" name="userpw" placeholder="User PW"
											size="50" /></td>
									</tr>
									<tr>
										<td><h3>별명</h3>
											<input type="text" name="nickname" placeholder="별명" size="50" /></td>
									</tr>
									<tr>
										<td><h3>지역</h3>
											<input type="text" name="address" placeholder="대구" size="50" /></td>
									</tr>
									<tr>
										<td><h3>핸드폰 번호</h3>
											<input type="text" name="pnumber" placeholder="-없이 숫자만 입력"
											size="50" /></td>
									</tr>
									<tr>
										<td><h3>이메일</h3>
											<input type="text" name="email" placeholder="이메일" size="50" /></td>
									</tr>

									<tr>
										<td><input type="submit" value="Save"></td>
									</tr>
								</table>
							</form>
						</div>
					</div>

				</div></li>
			<li style="float: right"><button id="myBtn3">Login</button>
				<div id="myModal3" class="modal">

					<!-- Modal content -->
					<div class="modal-content">
						<span class="close3">&times;</span>
						<div style="text-align: center">
							<div id="login">
								<table style="margin: auto" class="type09">
									<tr>
										<td>
											<h1>로그인</h1>
										</td>
									</tr>
									<tr>
										<td><h2>ID</h2>
											<input type="text" id="userid"
											placeholder="User ID" size="50" autocomplete = "off" autofocus = "autofocus"></td>
									</tr>
									<tr>
										<td><h2>PW</h2>
											<input type="password" id="userpw"
											placeholder="User PW" size="50"></td>
									</tr>
									<tr>
										<td><input type="submit" id="loginprocess" value="Login"></td>
									</tr>
									<tr>
										<td><input type="submit" id="userfind" value="ID/PW 찾기"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>

				</div></li>
			<%}else{ %>
				<!--  로그아웃등등 적는거 -->
				<li style="float: right"><button id="Logout">Logout</button></li>
				<li style="float: right; color: #ffffff">${sessionScope.member.userid}님 오신것을 환영합니다.</li>
			<%} %>

			<li style="float: right; padding-bottom: 18px; padding-top: 18px;">
				<a href="" class="type1">대피요령</a>
			</li>
			<li style="float: right; padding-bottom: 18px; padding-top: 18px;">
				<a href="" class="type1">게시판</a>
			</li>
		</ul>
	</div>
	<div id="mid_out">
		<div id="mid_in">
			<table>
				<tr>
					<td>
						<p id="pstyle1">비상구</p>
					</td>
				</tr>
				<tr>
					<td>
						<p id="pstyle2">- 모든 사람들이 안전해 질때 까지</p>
					</td>
				</tr>
				<tr>
					<td>
						<p id="pstyle3">EXIT 비상구는 재난과 각종 사고에 대비하고 대피하며</p>
					</td>
				</tr>
				<tr>
					<td>
						<p id="pstyle3">모든 사용자가 지금보다 더 안전하고 더 안심할 수 있도록 온 힘을 다하고 있습니다.</p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="mid_menu">
		<div style="float: left; width: 20%;">
			<a href="MapService"> <img src="./resources/img/map_icon.png" width="120"
				height="120" id="img_map">
			</a>

		</div>
		<div style="float: left; width: 20%;">
			<a href=""> <img src="./resources/img/list_icon.png" width="90"
				height="90" id="img_list">
			</a>
		</div>
		<div style="float: left; width: 20%;">
			<a href=""> <img src="./resources/img/bell_icon.png" width="160"
				height="160" id="img_bell">
			</a>
		</div>
		<div style="float: left; width: 20%;">
			<a href=""> <img src="./resources/img/exit_icon.png" width="100"
				height="100" id="img_exit">
			</a>
		</div>
		<div style="float: left; width: 20%;">
			<a href=""> <img src="./resources/img/mind_icon.png" width="180"
				height="180" id="img_mind">
			</a>
		</div>
	</div>
	<script>
		// Get the modal
		var modal1 = document.getElementById('myModal1');
		var modal2 = document.getElementById('myModal2');
		var modal3 = document.getElementById('myModal3');

		// Get the button that opens the modal
		var btn1 = document.getElementById("myBtn1");
		var btn2 = document.getElementById("myBtn2");
		var btn3 = document.getElementById("myBtn3");

		// Get the <span> element that closes the modal
		var span1 = document.getElementsByClassName("close1")[0];
		var span2 = document.getElementsByClassName("close2")[0];
		var span3 = document.getElementsByClassName("close3")[0];

		// When the user clicks the button, open the modal 
		btn1.onclick = function() {
			modal1.style.display = "block";
		}
		btn2.onclick = function() {
			modal2.style.display = "block";
		}
		btn3.onclick = function() {
			modal3.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span1.onclick = function() {
			modal1.style.display = "none";
		}
		span2.onclick = function() {
			modal2.style.display = "none";
		}
		span3.onclick = function() {
			modal3.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal1) {
				modal1.style.display = "none";
			}
			if (event.target == modal2) {
				modal2.style.display = "none";
			}
			if (event.target == modal3) {
				modal3.style.display = "none";
			}
		}
	</script>
</body>
</html>