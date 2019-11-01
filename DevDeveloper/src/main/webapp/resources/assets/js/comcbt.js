$(document).ready(function(){
	// 순서대로 오른쪽마웃, 드래그, 선택 방지기능
	$(window).on("contextmenu dragstart selectstart",function(){ 
        return false;    
	});
});
