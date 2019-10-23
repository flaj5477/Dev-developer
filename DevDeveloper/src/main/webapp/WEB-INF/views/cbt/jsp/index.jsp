<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT HOME</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {
		Permission() ;
	});
	
	var permisString = "${tr.testsDate}"; // String 문자열 자르기(SubString) permisString.substring(0,4);
	setInterval("getRestTime()",1000);
	function getRestTime(){		
		var permisDate = Date.parse(permisString); // format
	    var restMils = permisDate - new Date();
	    var restTime = new Date(restMils);    
	   	var year = restTime.getFullYear() - 1970; 
	   	var month = restTime.getMonth();
	   	var day = restTime.getDate() -1;
	    var hour = restTime.getHours();
	    var min = restTime.getMinutes(); 
	    var sec = restTime.getSeconds();
	    var condition = false;
	    
	    if((year||month||day||hour||min||sec) < 0) {
	    	$('#restTime').html('응시가능');
	    	$('#cbtEnterBtn').html('응시가능')
	    					 .css('background-color','blue');
	    	condition = true;
	    	
	    	return condition;
	    }
	    else {
	   		$('#restTime').html( year + '년 ' + month + '월 ' + day + '일 ' +hour + '시 ' + min + '분 ' + sec + '초');
	   		$('#cbtEnterBtn').html('응시불가')
	   						 .css('background-color','red');
	   		
	   		return condition;
	    }
	}
	function Permission() {
		var grade = "${tr.membersGrade}";
		if(grade >= 5 )
			document.getElementById("permisTime").innerHTML =defTime.getFullYear()+'년 '+(defTime.getMonth()+1)+'월 '+defTime.getDate()+'일 '+
	   defTime.getHours()+'시 '+defTime.getMinutes()+'분 '+defTime.getSeconds()+'초';
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
	2.회원님은 <span id="permisTime"></span> 이후 응시가 가능합니다. <br>
	3.회원님은 이미 최고레벨에 도달하였습니다.<br>
	<br><br><br>
</div>
<div align="center">
<button type="button" id ="cbtEnterBtn"></button>
</div>
</body>
</html>