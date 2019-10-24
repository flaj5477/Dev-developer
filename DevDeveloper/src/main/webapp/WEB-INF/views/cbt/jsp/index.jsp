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
		commentBox();
		indexCheck();
		levelChoice();
	});
	
	function commentBox() {
		$('#subject').html('레벨테스트 <br>'); // html = 내용을 view
		$('#content').append('레벨테스트는 CBT방식으로 최대한 객관성을 얻고자 <br>') // append 내용을 추가
					 .append('한국산업인력공단과 이 사이트를 만든 개발자들이 협력하여 <br>')
					 .append('출제한 문제이므로 참고바랍니다. <br><br>');	
	}
	
	function indexCheck() {	// 현재시간, 시험응시가능시간의 차이를 1초마다 갱신하는 Function
		var permisUTCString = "${tr.utcTestsDate}" // GMT + 00:00, 이건 남은시간 계산 용도
		var permisString = "${tr.testsDate}"; // GMT + 09:00, 이건 응시가능 날짜 용도
		var grade = "${tr.membersGrade}"; 
		var permisDate = Date.parse(permisUTCString); // String -> Date format 
	    var restMils = permisDate - new Date();
	    var restTime = new Date(restMils);    
	   	var year = restTime.getFullYear() - 1970; // 세계협정시 시작 1970년 1월 1일
	   	var month = restTime.getMonth();
	   	var day = restTime.getDate() -1;
	    var hour = restTime.getHours();
	    var min = restTime.getMinutes(); 
	    var sec = restTime.getSeconds();
	    var restCond = (year||month||day||hour||min||sec);
	    
	    $('#level').html('현재 등급 ${tr.membersGrade} <br><br>'); 
	    if(grade >= 5) {
	    	$('#checkMsg').html('이미 최고레벨에 도달 하셨습니다.<br><br>');
			$('#entryBtn').html('응시불가')
				 			 .css('background-color','red')
							 .attr('value','refuse');
	    }
	    else if(restCond >= 0 && grade < 5) {
	    	setInterval("indexCheck()",1000);
	    	$('#restTime').html(year + '년 ' + month + '월 ' + day + '일 ' +hour + '시간 ' + min + '분 ' + sec + '초 후에 응시가능 <br><br>');
	    	$('#checkMsg').html(permisString.substring(0,4)+'년 '+ // String 문자열 자르기(SubString) permisString.substring(0,4);
								permisString.substring(5,7)+'월 '+
								permisString.substring(8,10)+'일 '+
								permisString.substring(11,13)+'시'+
								permisString.substring(14,16)+'분 '+
								permisString.substring(17,19)+'초 이후 응시가 가능합니다. <br><br>');
	   		$('#entryBtn').html('응시불가')
	   						 .css('background-color','red')
	   						 .attr('value','refuse');
	    }
	    else if(restCond < 0 && grade < 5) {
	    	$('#checkMsg').html('현재 응시가 가능합니다.<br><br>');
	    	$('#entryBtn').html('시험시작')
	    					 .css('background-color','blue')
	    					 .attr('value','accept');
	    }
	}
	
	function levelChoice() {
		$('#entryBtn').on('click',function() {
			var state = 1;
			console.log($(this).attr('value'));
			if($(this).attr('value') == 'accept') {
				location.href = "";
				history.pushState('state : '+state, 'State : '+state);
				state++;
				console.log(state);
				//location.replace('levelChoice.jsp');
			}	
		});
	}
</script>
</head>
<body>
<div align="center">
	<div id="subject"></div>
	<div id="content"></div>
	<div id="condition">
		<div id="level"></div>
		<span id="restTime"></span>
		<span id="checkMsg"></span>
		<button type="button" id ="entryBtn"></button>
	</div>
</div>
</body>
</html>