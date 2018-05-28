<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script		
	src="/back/resources/js/main.js"></script>
<script
	src="http://www.globaltelecom.co.kr/js/vendor/jquery.easing.1.3.js"></script>
<script src="http://www.globaltelecom.co.kr/js/common.js"></script>
<script src="http://www.globaltelecom.co.kr/js/layer_popup.js"></script>
<title>Insert title here</title>
</head>
<style>
#layer_fixed {
	height: 80px;
	width: 100%;
	position: fixed;
	z-index: 999;
	top: 0px;
	left: 0px;
	background-color: gray;  
	opacity :0.5;
}

#layer_fixed:hover {
	opacity :100;
}
  
input[type=submit] {
	width: 60px;   
	height: 30px; background-color : #ff7800;
	color: white;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #ff7800;
	display :inline-block; 
}


</style>
<body>




<%Object o = session.getAttribute("member");%>
	
	<div id="layer_fixed">
					<!-- Modal content -->
						<div style="text-align: center">
		
		<div style="float: left; width: 5%;">
			<a href="MapService"> <img src="./resources/img/map_icon.png" width="70"
				height="70" id="img_map">
			</a>

		</div>
		
		<div style="float: left; width: 5%;">
			<a href=""> <img src="./resources/img/list_icon.png" width="70"
				height="70" id="img_list">
			</a>
		</div> 
		
		<div style="float: left; width: 5%;">
			<a href=""> <img src="./resources/img/bell_icon.png" width="70"
				height="70" id="img_bell">
			</a>
		</div>
		
		<div style="float: left; width: 5%;">
			<a href=""> <img src="./resources/img/exit_icon.png" width="70"
				height="70" id="img_exit">
			</a>
		</div>
		
		<div style="float: left; width: 5%;">
			<a href=""> <img src="./resources/img/mind_icon.png" width="70"
				height="70" id="img_mind">
			</a>
				</div>
			</div>
			
			 
			  
			<%if(o ==null){ %>        
			<div style="margin-left:1500px;">    
			<input type="text" placeholder="ID 입력" id="userid">
			<input type="submit" id="loginprocess" value="LOGIN" style="margin-left:10px;"><br>
			<input type="text" placeholder="PW 입력" id="userpw" style="margin-top:10px;"> 
			</div>
			
			
			
			<%}else{ %>
			 
				<!--  로그아웃등등 적는거 -->
				<a style="float: right"><button id="Logout">Logout</button></a>
				<a style="float: right; color: #ffffff">${sessionScope.member.userid}님 오신것을 환영합니다.</a> 
			<%} %>
		</div> 


</body>
</html>