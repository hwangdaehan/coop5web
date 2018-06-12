
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
	center : new daum.maps.LatLng(35.89669929695191, 128.62189858500668), // 지도의
																			// 중심좌표
	mapTypeControl : false,
	level : 3
// 지도의 확대 레벨
};

// 지도를 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var marker2 = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
infowindow = new daum.maps.InfoWindow({
	zindex : 1
}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event
		.addListener(
				map,
				'click',
				function(mouseEvent) {
					searchDetailAddrFromCoords(
							mouseEvent.latLng,
							function(result, status) {
								if (status === daum.maps.services.Status.OK) {
									var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
											+ result[0].road_address.address_name
											+ '</div>'
											: '';
									var content = '<div class="btn">'
											+ '<a href="#list" id="Blistbtn" class="ahref">보기</a>'
											+ '<a href="#register" id="Bregbtn" class="ahref">건물정보등록</a>'
											+ '</div>' + '<div class="bAddr">'
											+ detailAddr + '</div>';

									marker2.setPosition(mouseEvent.latLng);
									marker2.setMap(map);
		
									infowindow.setContent(content);
									infowindow.open(map, marker2);

									var latlng = mouseEvent.latLng;

									var a = latlng.getLat();
									var b = latlng.getLng();

									$("#test")
											.val(
													result[0].road_address.address_name);
									$("#test2").val(
											result[0].address.address_name);
									$("#xaxis").val(a);
									$("#yaxis").val(b);

								}

							});
				});

$(document).ready(function() {
	
	
	$(document.body).on("click","#edescription",function(){
		$.ajax({
			url :"AxisFind", 
			data :{
					bid : $(this).parent().children("#enjoybid").val()
			},
			success :function(data){
				function panTo() {
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new daum.maps.LatLng(data.xaxis, data.yaxis);
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);            
				}        
				
				panTo();
			}
		});
		
	});
	
		
	
	
	
		//화면상에 와드 박고 도면 누르면 이미지 뜨는
			$.ajax({
				url : "listAll",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						
						// -----마커생성하기
						var markerPosition = new daum.maps.LatLng(
								data[i].xaxis, data[i].yaxis);
						var imageSize = new daum.maps.Size(20, 20);
						var imageSrc = "./resources/img/bluesky.png";
//						var imageSrc = "./resources/img/redicon.png";
						var markerImage = new daum.maps.MarkerImage(imageSrc,imageSize);
						
						// 마커를 생성합니다
						var wardmaker = new daum.maps.Marker({
							position : markerPosition,
							title : data[i].bname,
							image : markerImage,
							clickable : true
						});
						
						var content =
						'<input type="hidden" value="'+data[i].bid+'" id="mbid" >' +
						'<input type="hidden" value="'+1+'" id="mfloor" name="mfloor">' +
			            '<a href="#imgDiv" id="testb">도면</a>';
						
					
						
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new daum.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: wardmaker.getPosition()       
			});
			// 마커가 지도 위에 표시되도록 설정합니다
			wardmaker.setMap(map);
			// -----마커생성하기
			

					}
													
					$(document.body).on("click", "#testb", function(){
						$("#nextbid").val($(this).parent().children("#mbid").val());
									$.ajax({
						url :"ImgSelect",
						data:{
							
							bid:$(this).parent().children("#mbid").val(),
							floor:$("#mfloor").val()
						},
						success:function(data) {
							if(data.drawing ==undefined || data.drawing ==null){
								alert("도면 데이터가 없습니다.");
							}else{
								var str="";
								  str += "<img src='MapService/displayFile?fileName="+data.drawing+"' width='994.9px;' height='650px' id='mainimg'>";
//								 str += "<img src='./resources/img/Exdomyun.png' width='994.9px;' height='640px' id='mainimg'>";
								  $("#displayImg").append(str);
							}
						}
					});
				});
					
					
					
				}
			});
			
			
			
			
			
		}); 

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', function() {
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
	// 좌표로 행정동 주소 정보를 요청합니다
	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
}

function searchDetailAddrFromCoords(coords, callback) {
	// 좌표로 법정동 상세 주소 정보를 요청합니다
	geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
	if (status === daum.maps.services.Status.OK) {
		var infoDiv = document.getElementById('centerAddr');

		for (var i = 0; i < result.length; i++) {
			// 행정동의 region_type 값은 'H' 이므로
			if (result[i].region_type === 'H') {
				infoDiv.innerHTML = result[i].address_name;
				break;
			}
		}
	}
}