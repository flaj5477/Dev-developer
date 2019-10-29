<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	var curLevel = Number('${param.grade}'); // String -> Number 변환
	
	$(document).ready(function() {
		getTestList();
		chooseEvent();
	});
	
	function getTestList() {
		var levelStr;
		$('#subject').html('<h2> 난이도 선택 </h2>');
		$.ajax('getTestList', { type:'GET', dataType:'json'})
		.done(function(data) {
			$('tbody').empty();
			$.each(data,function(idx,test) {
				var level = data[idx].testsLevel;
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				if(curLevel < level) {
					switch(level) {
					case '1' : levelStr='Easy'; break;
					case '2' : levelStr='Normal'; break;
					case '3' : levelStr='Hard'; break;
					case '4' : levelStr='Professional'; break;
					case '5' : levelStr='Management'; break;
					}
					$('<tr>').append($('<th>').html('<input type="radio" name="test" onclick="chooseEvent('+level+')">'))
							 .append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(levelStr))
							 .appendTo('tbody');
				}
			});
		});
	}
	function chooseEvent(level) {
		var state = 0;
		var chooseGrade;
		var memberGrade;
		$('#accBtn').html('선택완료');
		if(level != null) {
			chooseGrade = gradeFormat(level);
			memberGrade = gradeFormat(curLevel);
			$('#comment').html('<p/> <p> 현재등급 : '+memberGrade+'</p> <p> 합격 시 등급 : '+chooseGrade+'</p> <p> 진행 하시려면 선택완료 버튼을 눌러주세요. </p>');
			$('#accBtn').css('background-color','blue')
						.on('click',function() {
							state ++;
							if((state%2)==0) {
								console.log('failed');
							}
							else {
								accessEvent();
							}
						});
		}
		else {
			$('#accBtn').css('background-color','gray');
		}
	}
	function gradeFormat(grade) {
		var gradeStr;
		switch(grade) {
		case 1 : gradeStr='Bronze'; break;
		case 2 : gradeStr='Silver'; break;
		case 3 : gradeStr='Gold'; break;
		case 4 : gradeStr='Diamond'; break;
		case 5 : gradeStr='Challenger'; break;
		}
		return gradeStr;
	}
	
	function accessEvent() {
		console.log('success');
	}
	
</script>
</head>
<body>
<div class ="levelChoice" align="center">
	<div id="subject"></div>	
	<div id="content">
		<table id="chooseTab" border="1" width="500">
			<thead>
				<tr align="center">
					<th>선택</th>
					<th>시험명</th>
					<th>상세설명</th>
					<th>난이도</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<div id="comment"></div>
	<button id='accBtn' type="button"></button>
</div>
</body>
</html>