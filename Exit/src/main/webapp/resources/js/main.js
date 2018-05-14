
$(document).ready(function(){
	
	$("#loginprocess").click(function(){
		var json = {
			userpw : $("#userpw").val(),
			userid : $("#userid").val()
		};
		
		for(var i in json){
			if(json[i].length == 0){
				alert(i + " 정보를 입력하세요.");
				return;
			}
		}
		
		
		$.ajax({
            dataType: "jsonp",
            url: "login",
            type: "GET",
            data: json,
            success: function (data) {
            	switch (data) {
				case 0:
					alert('많은 이용 감사합니다.');
					window.location.reload();
					break;
				
				case 1:
					alert('아이디 또는 비밀번호를 확인해주세요.')
					break;
					
				default:
					alert('알수없는 오류가 발생 했습니다.');
					break;
				}
            },
            error: function (error) {
                alert('오류가 발생 이유' + error);
            }
        });
		
	});
	
	$("#Logout").click(function(){
		window.location.href = "logout";
	});
	
});