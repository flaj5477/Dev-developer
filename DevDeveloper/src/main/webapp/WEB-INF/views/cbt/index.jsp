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
<script src="${pageContext.request.contextPath}/resources/assets/js/comcbt.js"></script>
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
		$('#grade'+(grade+1)).css('background-color','hotpink');
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
		var $restTimeText = $('#restTime');
		switch(code) {
		case 1 : 
			$('#message').attr('class','alert alert-danger');
			$('#permis').html('이미 최고레벨에 도달 하셨습니다.<br><br>');
			$('#submitBtn').html('응시불가')
				 			 .attr('class','btn btn-danger')
							 .attr('value','refuse');
			break;
		case 2 :
			$restTimeText.empty();
	    	if(year != 0) {
	    		$restTimeText.append(year+'년 ');
	    	}
	    	if(month != 0) {
	    		$restTimeText.append(month+'월 ');
	    	}
	    	if(day != 0) {
	    		$restTimeText.append(day+'일 ');
	    	}
	    	if(hour != 0) {
	    		$restTimeText.append(hour+'시간 ');
	    	}
	    	if(min != 0) {
	    		$restTimeText.append(min+'분 ');
	    	}
	    	if(sec != 0) {
	    		$restTimeText.append(sec+'초 ');
	    	}
	    	$restTimeText.append('후에 잠금해제 <br><br>');
	    	$('#permis').html('<b>'+permis.substring(0,4)+'년 '+ // String 문자열 자르기(SubString) permisString.substring(0,4);
										permis.substring(5,7)+'월 '+
										permis.substring(8,10)+'일 '+
										permis.substring(11,13)+'시'+
										permis.substring(14,16)+'분 '+
										permis.substring(17,19)+'초 이후 응시가 가능합니다. </b><br>')
										.css('color','orangered');
								
	   		$('#submitBtn').html('응시불가')
	   						 .attr('class','btn btn-danger')
	   						 .attr('value','refuse');
	   		$('#message').attr('class','alert alert-danger');
	   		break;
		case 3 :
			$('#message').attr('class','alert alert-primary');
			$('#permis').html('<b> 응시가 가능합니다. </b> <br><br>')
									   .css('color','black')
	    	$('#submitBtn').html('시험시작')
	    					 .attr('class','btn btn-primary')
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
<div class="cbtIndex">
	<div id="subject">
		<p class="h1" style="color:black">Dev Developer CBT</p>
	</div>
	<div id="content">
		<div class="card-group">
			<div class="card">
				<span style="font-color:black">Unranked</span>
				<img src="${pageContext.request.contextPath}/images/grade/0.png" class="card-img-top" id="grade1">
			</div>
			<div class="card">
				<span style="font-color:black">Bronze</span>
				<img src="${pageContext.request.contextPath}/images/grade/1.png" class="card-img-top" id="grade2">
			</div>
			<div class="card">
				<span style="font-color:black">Silver</span>
			  	<img src="${pageContext.request.contextPath}/images/grade/2.png" class="card-img-top" id="grade3">
			</div>
			 <div class="card">
			 	<span style="font-color:black">Gold</span>
			  	<img src="${pageContext.request.contextPath}/images/grade/3.png" class="card-img-top" id="grade4">
			</div>
			 <div class="card">
			 	<span style="font-color:black">Diamond</span>
			  	<img src="${pageContext.request.contextPath}/images/grade/4.png" class="card-img-top" id="grade5" >
			</div>
			 <div class="card">
			 	<span style="font-color:black">Challenger</span>
			  	<img src="${pageContext.request.contextPath}/images/grade/5.png" class="card-img-top" id="grade6">
			</div>
		</div>
		<div id="level"></div>
		<div id="message" role="alert">
			<p class="h5" id="restTime" style="color:orangered"></p>
			<p class="h5" id="permis"></p>
		</div>
		<button type="button" id ="submitBtn"></button>
	</div>
</div>
</body>
</html>