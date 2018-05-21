var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(35.89669929695191, 128.62189858500668), // 지도의 중심좌표
        mapTypeControl : false,
        level: 3 // 지도의 확대 레벨
    };  



// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

var imageSrc = './resources/img/domyunicon.png', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(20, 20), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
   
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new daum.maps.LatLng(35.89704032046812, 128.6226697293517); // 마커가 표시될 위치입니다
 
//마커를 생성합니다 
var marker = new daum.maps.Marker({
position: markerPosition, 
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  





// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';            
            var content ='<div class="btn">' +  
            			'<a href="#list" id="Blistbtn" class="ahref">보기</a>'+
						'<a href="#register" id="Bregbtn" class="ahref">건물정보등록</a>' +
						'</div>' +
            			'<div class="bAddr">' + 
                            detailAddr + 
                        '</div>';
                        
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            infowindow.setContent(content);
            infowindow.open(map,marker);
            
            var latlng = mouseEvent.latLng;
            
            var a= latlng.getLat();
            var b= latlng.getLng();
            
//            $("body").on("click","#Blistbtn",function(){
//                $.ajax({
//        			url : "listAll",
//        			data :JSON.stringify ({
//        				
//        			addr_new : result[0].road_address.address_name
//        			
//        			}) ,
//        			success : function(data) {
//
//        				for (var i = 0; i < data.length; i++) {
//        					$("#J1").append("<tr><td class='bid'>"+data[i].bid+"</td><td id='Lbname'>"+data[i].bname+"</td><td>" + data[i].addr_new + "</td><td>" + data[i].addr_old + "</td><td>" + data[i].tel+ "</td></tr>");
//        			
//        				}
//        			}
//        		});
//            });
            
            $("#test").val(result[0].road_address.address_name);
            $("#test2").val(result[0].address.address_name);
            $("#xaxis").val(a);
			$("#yaxis").val(b);
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

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}