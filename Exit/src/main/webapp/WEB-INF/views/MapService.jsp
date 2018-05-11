<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:900px;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>


<!-- 건물데이터 Modal -->
	<div id="b_data" class="content">
		<div id="modalchang">
			<div class="modal-header">
				<h1>건물 데이터 등록</h1>
			</div>
			<div class="modal-body">
				<h1 style="text-align: center">해당 건물의 정보가 없습니다.</h1>
				<h3 style="text-align: center">해당 건물의 데이터를 추가해 주세요.</h3>
				<table>
					<tr>
						<th>이미지</th>
						<th>도로명 주소</th>
						<th>지번 주소</th>
						<th>홈페이지</th>
						<th>전화번호</th>
						<th>건물 층</th>
					</tr>
					<tr>
						<th id="Limage"></th>
						<th id="Laddress"></th>
						<th id="Ljibun"></th>
						<th id="Lhomepage"></th>
						<th id="Lphone"></th>
						<th id="Lchung"></th>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<div id="buttons">

					<a href="#close" class="btn btn-danger" style="margin-left: 15px">닫기</a>
				</div>
			</div>
		</div>

	</div>
		<!-- 건물데이터 Modal upload 창-->
		<div id="upload" class="content">
			<div id="modalchang">
				<div class="modal-header">
					<h1 style="display: inline-block">건물 등록</h1>
				</div>

				<div id="menu" class="modal-body">
					<p id="addressText">도로명 주소</p>
					<input type="text" id="test" name="address" class="w3-input" />
					<p id="jibunText">지번 주소</p>
					<input type="text" name="jibun" id="test2" class="w3-input" />
					<p id="phoneText">전화번호</p>
					<input type="text" name="phone" id="test3" class="w3-input" />
					<p id="homepageText">홈페이지</p>
					<input type="text" name="homepage" id="test4" class="w3-input" />
					<div id="axisData" style="">
						<input type="text" id="xaxis" name="xaxis" />
						<input type="text" id="yaxis" name="yaxis" />
					</div>
					<div class="modal-footer">
						<a href="#domyun" id="regist" class="btn btn-danger" style="margin-left: 15px">다음</a>
						<a href="#close" class="btn btn-danger" style="margin-left: 15px">닫기</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 건물데이터 Modal  END-->
		<div id="domyun" class="content">
			<div id="modalchang">
				<div class="modal-header">
					<h1>도면 입력</h1>
				</div>

				<div class="modal-body">
					<a href="http://39.127.7.64:8080/project/upload/uploadAjax" onClick="window.open(this.href, '', 'width=400, height=430')" target="_blank">
					<p id="uploadImage">사진을 등록해 주세요</p></a>
					<input type="text" class="w3-input" name="fileName" value="${data}" />
					<h5 style="text-align: center">
						층수&nbsp;&nbsp;&nbsp;<select name="chung"><option
								value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>층
					</h5>
					
						<div class="modal-footer">
					<a href="#close" class="btn btn-danger" style="margin-left: 15px">닫기</a>
					<input type="submit" id="end" class="btn btn-primary" style="margin-left: 15px" value="완료" />
					<a href="#upload" class="btn btn-danger" style="margin-left: 15px">이전</a>
				</div>
				</div>
			</div>
	</div>



<!-- 보기 버튼 모달창  끝-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336c57b28c5a12adb24864904a2b70df&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=336c57b28c5a12adb24864904a2b70df"></script> 
<script src="resources/js/MapApi.js"></script>
</body>
</html>