<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT HOME</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
var today = new Date();
var permission = "${tr.testsDate}";

$(function() {
	getRestTime();
	getPermisTime();
});
setInterval("getRestTime()",1000);
function getRestTime(){

   var year = permission.substring(0,4) - today.getFullYear() ;
   var month = permission.substring(5,7) - (today.getMonth()+1) ; // January is 0 !
   var day = permission.substring(8,10) - today.getDate();
   var hour = permission.substring(11,13) - today.getHours();
   var min = permission.substring(14,16) - today.getMinutes();
   var sec = permission.substring(17,19) - today.getSeconds();
   document.getElementById("restTime").innerHTML = '<br>' + year +'년 <br>'+ month +'월 <br>'+ day +'일 <br>'+ hour + '시간 <br>' + min + '분 <br>' + sec + '초 <br>';
   
   
   //					+permission.substring(5,7)+'월 '+permission.substring(8,10)+'일 '
   	//					 +permission.substring(11,13)+'시 '+permission.substring(14,16)+'분 '+permission.substring(17,19)+'초 ';
}
function getPermisTime() {
	$('#permisTime').append(permission.substring(0,4)+'년 ');
}
</script>
</head>
<body>
<div align="center">
	레벨테스트<br>
	레벨테스트는 CBT방식으로 최대한 객관성을 얻고자<br>
	한국산업인력공단과 이 사이트를 만든 개발자들이 협력하여<br>
	출제한 문제이므로 참고바랍니다.
	<br><br><br><br>
</div>
<div align="center">
	현재 등급 ${tr.membersGrade} <br>
	응시하기까지 남은시간 <span id="restTime"></span><br>
	<H2>IF</H2>
	1.회원님은 현재 응시가 가능합니다.<br>
	2.회원님은 <span id="permisTime"></span>이후 응시가 가능합니다. <br>
	3.회원님은 이미 최고레벨에 도달하였습니다.<br>
	<br><br><br>
</div>
<div align="center">
<button>응시하기</button>
<button>응시불가</button>
</div>
</body>
</html>