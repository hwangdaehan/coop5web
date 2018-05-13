<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

#domyun, #list, #register {
	margin-left: 10px;
}

.content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0);
	opacity: 0;
	-webkit-transition: opacity 400ms ease-in;
	-moz-transition: opacity 400ms ease-in;
	transition: opacity 400ms ease-in;
	pointer-events: none;
	z-index: 2;
}

.content:target {
	opacity: 1;
	pointer-events: auto;
	z-index: 2;
}

.content>div {
	position: absolute;
	top: 20%;
	left: 80%;
	width: 20%;
	height: 50%;
	padding: 16px;
	border: 1px solid gray;
	background-color: white;
	overflow: auto;
	z-index: 2;
}

td	p {
	font-size: x-small;
}

th {
	font-size: small;
}

#Blistbtn, #Bregbtn {
	margin-left: 10px;
}

#modDiv {
	width: 400px;
	height: 30px;
	position: absolute;
	top: 50%;
	left: 68%;
	margin-top: -35px;
	margin-left: -100px;
	padding: 10px;
	z-index: 1000;
}
</style>
<meta charset="utf-8">
<title>지도 생성하기</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="resources/css/MapApi.css"></script>	 -->
</head>
<script>
	
	$(document).ready(function() {
		//   		$('#modalchang').modal({backdrop: 'static'});
		// 		//모달창 유지	
		$.ajax({
			url : "listAll",
			success : function(data) {

				for (var i = 0; i < data.length; i++) {
					$("#Lbid")
							.append(
									"<p>"+data[i].bid+"</p>");
					
					$("#Lbname")
							.append(
									"<p>"+data[i].bname+"</p>");
					$("#Lnew").append(
							"<p>" + data[i].addr_new
									+ "</p>");
					$("#Lold").append(
							"<p>" + data[i].addr_old
									+ "</p>");
					$("#Ltel").append(
							"<p>" + data[i].tel
									+ "</p>");
					$("#Dbid").val(data[i].bid);
					
				}
			}
		});
		$("#Lbname").click(function(){
			$("#modDiv").show("slow");	
		});
		$("#domyuncancel").click(function(){
			$("#modDiv").hide("slow");	
		});
	});
	
	
			// 업로드 script
			
			   $(document).ready(function(){
        $(".fileDrop").on("dragenter dragover", function(event){
            event.preventDefault(); // 기본효과를 막음
        });
//         event : jQuery의 이벤트

    
    $(".fileDrop").on("drop", function(event) {
        event.preventDefault(); 
        var files = event.originalEvent.dataTransfer.files;
        var file = files[0];
        console.log(file);
        var formData = new FormData();
        formData.append("file", file);
		
        $.ajax({
            type: "post",
            url: "uploadAjax",
            data: formData,
            dataType: "text",
            processData: false,
            contentType: false,
            // 업로드 성공하면
            success: function(data) {
                var str = "";
                // 이미지 파일이면 썸네일 이미지 출력
                if(checkImageType(data)){ 
                    str = "<div><a href='MapService/displayFile?fileName="+getImageLink(data)+"' download>";
                    str += "<img src='MapService/displayFile?fileName="+data+"'></a>";
      
                    // data = db에 저장해야할 경로 이름
                    $("#data").val(data);
          			
             	
                // 일반파일이면 다운로드링크
                } else { 
                    str = "<div><a href='displayFile?fileName="+data+"'>"+getOriginalName(data)+"</a>";
                }
                // 삭제 버튼
                str += "<span data-src="+data+">[삭제]</span></div>";
                $(".uploadedList").append(str);
            }
        });
    });
    
    $(".uploadedList").on("click", "span", function(event){
        alert("이미지 삭제")
        var that = $(this); // 여기서 this는 클릭한 span태그
        $.ajax({
            url: "deleteFile",
            type: "post",
            // data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
            // 태그.attr("속성")
            data: {fileName:$(this).attr("data-src")}, // json방식
            dataType: "text",
            success: function(result){
                if( result == "deleted" ){
                    // 클릭한 span태그가 속한 div를 제거
                    that.parent("div").remove();
                }
            }
        });
    });
    
 // 원본파일이름을 목록에 출력하기 위해
    function getOriginalName(fileName) {
        // 이미지 파일이면
        if(checkImageType(fileName)) {
            return; // 함수종료
        }
        // uuid를 제외한 원래 파일 이름을 리턴
        var idx = fileName.indexOf("_")+1;
        return fileName.substr(idx);
    }
 
 // 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
    function getImageLink(fileName) {
        // 이미지파일이 아니면
        if(!checkImageType(fileName)) { 
            return; // 함수 종료 
        }
        // 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
        // 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
        var front = fileName.substr(0, 12); // 년원일 경로 추출
        var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
        console.log(front); // /2017/03/09/
        console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
        // 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
        return front+end; // 디렉토리를 포함한 원본파일명을 리턴
    }
 // 이미지파일 형식을 체크하기 위해
    function checkImageType(fileName) {
        // i : ignore case(대소문자 무관)
        var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
        return fileName.match(pattern); // 규칙이 맞으면 true
    }
 
 
  });
	
	</script>


<body>
	<div id="register" class="content">
		<div>
			<div class="modal-header">
				<h3 style="display: inline-block">건물 등록</h3>
			</div>
			<form action="Bdata" method="POST">
				<div id="menu" class="modal-body">
					<p id="addressText">도로명 주소</p>
					<input type="text" id="test" name="addr_new" class="w3-input" />
					<p id="jibunText">지번 주소</p>
					<input type="text" name="addr_old" id="test2" class="w3-input" />
					<p id="phoneText">전화번호</p>
					<input type="text" name="tel" id="test3" class="w3-input" />
					<p id="bNameText">건물명</p>
					<input type="text" name="bname" id="test4" class="w3-input" />
				</div>
				<div id="axisData" style="display: none">
					<input type="text" id="xaxis" name="xaxis" /> <input type="text"
						id="yaxis" name="yaxis" />
				</div>

				<div class="modal-footer">
					<input type="submit" value="저장"> <a href="#close"
						class="btn btn" style="margin-left: 15px">닫기</a>

				</div>
			</form>
		</div>
	</div>




	<div id="list" class="content">
		<div class="ModalList">

			<table>
				<tr>
					<th>글 번호</th>
					<th>건물이름</th>
					<th>도로명주소</th>
					<th>지번주소</th>
					<th>전화번호</th>
				</tr>
				<tr>
					<td id="Lbid"></td>
					<td id="Lbname"></td>
					<td id="Lnew"></td>
					<td id="Lold"></td>
					<td id="Ltel"></td>

				</tr>
			</table>
			<div class="modal-footer">
				<div id="buttons">
					<a href="#close" class="btn btn" style="margin-left: 15px">닫기</a>
				</div>
			</div>
		</div>
	</div>

	<div id="modDiv" style="display: none;">
		<button id="domyunselect">도면보기</button>
		<a href="#domyun" id="domyuninsert">도면등록</a>
		<button id="domyunupdate">도면수정</button>
		<button id="domyuncancel">취소</button>
	</div>


	<div id="domyun" class="content">
		<div id="modalchang">
			<div class="modal-header">
				<h1>도면 입력</h1>
			</div>
			<form action="Domyun" method="post">
				<div class="modal-body">
					<%-- <jsp:include page="upload/uploadAjax.jsp"></jsp:include> --%>
					<!-- 파일을 업로드할 영역 -->
					<div class="fileDrop">
						<h4 style="color: gray; text-align: center;">이미지를 드래그 해주세요</h4>
					</div>

					<!-- 업로드된 파일 목록 -->
					<div class="uploadedList"></div>
					<input type="hidden" id="Dbid" name="bid"> <input
						type="hidden" name="drawing" id="data" />
					<h5 style="text-align: center">층수&nbsp;&nbsp;&nbsp;
						<select name="floor">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>층
					</h5>

					<div class="modal-footer">
						<a href="#close" class="btn btn-danger" style="margin-left: 15px">닫기</a>
						<input type="submit" style="margin-left: 15px" value="완료" />
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 보기 버튼 모달창  끝-->
	<div id="map"
		style="width: 100%; height: 1000px; position: relative; overflow: hidden;"></div>
	<div class="hAddr">
		<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
	</div>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336c57b28c5a12adb24864904a2b70df&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336c57b28c5a12adb24864904a2b70df"></script>
	<script src="resources/js/MapApi.js"></script>
</body>
</html>