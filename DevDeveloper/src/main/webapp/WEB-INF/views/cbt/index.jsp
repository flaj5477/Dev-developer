<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CBT Home </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script>	
	$(document).ready(function() {
		indexBox();
		indexCheck();
		levelChoice();
	});
	
	function indexBox() {
		$('#content').append('레벨테스트는 CBT방식으로 최대한 객관성을 얻고자 <br>') // append 내용을 추가
					 .append('한국산업인력공단과 이 사이트를 만든 개발자들이 협력하여 <br>')
					 .append('출제한 문제이므로 참고바랍니다. <br><br>');	
	}
	
	function indexCheck() {	// 현재시간, 시험응시가능시간의 차이를 1초마다 갱신하는 Function
		var grade = Number("${members.membersGrade}");
		var restStr = "${tr.utcTestsDate}" // GMT + 00:00, 이건 남은시간 계산 용도
		var permisStr = "${tr.testsDate}"; // GMT + 09:00, 이건 응시가능 날짜 용도
		var permisDate = Date.parse(restStr); // String -> Date format 
	    var restMils = permisDate - new Date();
	    var restTime = new Date(restMils);    
	   	var year = restTime.getFullYear() - 1970; // 세계협정시 시작 1970년 1월 1일
	   	var month = restTime.getMonth();
	   	var day = restTime.getDate() -1;
	    var hour = restTime.getHours();
	    var min = restTime.getMinutes(); 
	    var sec = restTime.getSeconds();
	    var restCond = (year||month||day||hour||min||sec);
	    var memberGrade = formatGrade(grade);
	    $('#level').html('현재 등급 '+memberGrade+' <br><br>'); 
	    
	    if(grade >= 5) {
	    	$('#checkMsg').html('이미 최고레벨에 도달 하셨습니다.<br><br>');
			$('#entryBtn').html('응시불가')
				 			 .css('background-color','red')
							 .attr('value','refuse');
	    }
	    else if(restCond >= 0 && grade < 5) {
	    	setInterval("indexCheck()",1000);
	    	$('#restTime').empty();
	    	if(year != 0) {
	    		$('#restTime').append(year+'년 ');
	    	}
	    	if(month != 0) {
	    		$('#restTime').append(month+'월 ');
	    	}
	    	if(day != 0) {
	    		$('#restTime').append(day+'일 ');
	    	}
	    	if(hour != 0) {
	    		$('#restTime').append(hour+'시간 ');
	    	}
	    	if(min != 0) {
	    		$('#restTime').append(min+'분 ');
	    	}
	    	if(sec != 0) {
	    		$('#restTime').append(sec+'초 ');
	    	}
	    	$('#restTime').append('후에 잠금해제 <br><br>');
	    	$('#checkMsg').html(permisStr.substring(0,4)+'년 '+ // String 문자열 자르기(SubString) permisString.substring(0,4);
								permisStr.substring(5,7)+'월 '+
								permisStr.substring(8,10)+'일 '+
								permisStr.substring(11,13)+'시'+
								permisStr.substring(14,16)+'분 '+
								permisStr.substring(17,19)+'초 이후 응시가 가능합니다. <br><br>');
	   		$('#entryBtn').html('응시불가')
	   						 .css('background-color','red')
	   						 .attr('value','refuse');
	    }
	    else if(restCond < 0 && grade < 5) {
	    	$('#checkMsg').html('응시가 가능합니다.<br><br>');
	    	$('#entryBtn').html('시험시작')
	    					 .css('background-color','#81A8D6')
	    					 .attr('value','accept');
	    }
	}
	
	function levelChoice() {
		$('#entryBtn').on('click',function() {
			var interLock = $(this).val();
			if(interLock == 'accept') {
				location.href='choice'; // 페이지 이동, 뒤로가기 허용
			}
		});
	}
</script>
</head>
<body>
<div class="cbtIndex" align="center">
	<div id="subject">
		<h2>레벨테스트</h2>
	</div>
	<div id="content"></div>
	<div id="condition">
		<span id="level"></span>
		<span id="restTime"></span>
		<span id="checkMsg"></span>
		<button type="button" id ="entryBtn"></button>
	</div>
</div>
</body>
</html>