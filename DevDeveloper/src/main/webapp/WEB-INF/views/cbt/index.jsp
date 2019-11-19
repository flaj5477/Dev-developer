<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Home</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script>	
	var grade = parseInt("${members.membersGrade}");
	var memberGrade = formatGrade(grade);
	var rest = "${tr.utcTestsDate}"; // GMT + 00:00, 이건 남은시간 계산 용도
	var permis = "${tr.testsDate}"; // GMT + 09:00, 이건 응시가능 날짜 용도
	var restDate = 0; // String -> Date format 
	var restMils = 0;
	var restTime = 0;  
	var year = 0;
   	var month = 0;
   	var day = 0;
    var hour = 0;
    var min = 0; 
    var sec = 0;
	
	$(document).ready(function() {
		indexBox();
		timeCount();
		choicePage();
	});
	
	function indexBox() {
		$('#subject').append('<h2> 레벨테스트 </h2>');	
	    $('#level').html('현재 등급 '+memberGrade+' <br><br>'); 
	}
	
	setInterval(timeCount,1000);
	function timeCount() {	// 현재시간, 시험응시가능시간의 차이를 1초마다 갱신하는 Function
	    restDate = Date.parse(rest); // String -> Date format 
	    restMils = restDate - new Date();
	    restTime = new Date(restMils);  
	    year = restTime.getFullYear() - 1970; // 세계협정시 시작 1970년 1월 1일
	    month = restTime.getMonth();
	    day = restTime.getDate() -1;
	    hour = restTime.getHours();
	    min = restTime.getMinutes(); 
	    sec = restTime.getSeconds();
	    check();
	}
	
	function check() {
		var restCheck = (year||month||day||hour||min||sec);
	    if(grade >= 5) {
			indexCase(1)
	    }
	    else if(restCheck >= 0 && grade < 5) {
	    	
	    	indexCase(2);
	    }
	    else if(restCheck < 0 && grade < 5) {
	    	indexCase(3);
	    }
	}
	
	function indexCase(code) {
		switch(code) {
		case 1 : 
			$('#message').html('이미 최고레벨에 도달 하셨습니다.<br><br>');
			$('#submitBtn').html('응시불가')
				 			 .css('background-color','red')
							 .attr('value','refuse');
			break;
		case 2 :
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
	    	$('#message').html(permis.substring(0,4)+'년 '+ // String 문자열 자르기(SubString) permisString.substring(0,4);
								permis.substring(5,7)+'월 '+
								permis.substring(8,10)+'일 '+
								permis.substring(11,13)+'시'+
								permis.substring(14,16)+'분 '+
								permis.substring(17,19)+'초 이후 응시가 가능합니다. <br><br>');
	   		$('#submitBtn').html('응시불가')
	   						 .css('background-color','red')
	   						 .attr('value','refuse');
	   		break;
		case 3 : 
			$('#message').html('응시가 가능합니다.<br><br>');
	    	$('#submitBtn').html('시험시작')
	    					 .css('background-color','#81A8D6')
	    					 .attr('value','accept');
	    	break;
		}
	}
	
	function choicePage() {
		$('#submitBtn').on('click',function() {
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
	<div id="subject"></div>
	<div id="content">
		<div id="comment"></div>
		<div class="card-group" style="width:600px">
			<div class="card text-white mb-3" style="max-width: 18rem;">
				<img src="${pageContext.request.contextPath}/images/grade/0.png" class="card-img-top" alt="..." width="70px">
			</div>
			<div class="card">
				<img src="${pageContext.request.contextPath}/images/grade/1.png" class="card-img-top" alt="..." width="70px">
			</div>
			<div class="card">
			  	<img src="${pageContext.request.contextPath}/images/grade/2.png" class="card-img-top" alt="..." width="70px">
			</div>
			 <div class="card">
			  	<img src="${pageContext.request.contextPath}/images/grade/3.png" class="card-img-top" alt="..." width="70px">
			</div>
			 <div class="card">
			  	<img src="${pageContext.request.contextPath}/images/grade/4.png" class="card-img-top" alt="..." width="70px">
			</div>
			 <div class="card">
			  	<img src="${pageContext.request.contextPath}/images/grade/5.png" class="card-img-top" alt="..." width="70px">
			</div>
		</div>
		<div id="level"></div>
		<div id="restTime"></div>
		<div id="message"></div>
		<button type="button" id ="submitBtn"></button>
	</div>
</div>
</body>
</html>