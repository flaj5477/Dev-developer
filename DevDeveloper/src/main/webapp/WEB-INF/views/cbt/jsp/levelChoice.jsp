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
		levelBox();
		testList();
	});
	
	function levelBox() {
		$('#subject').html('<h2> 난이도 선택 </h2>');
		$('#comment').html('<br>');
		$('#accBtn').html('선택완료')
					.css('background-color','gray');
	}
	
	function testList() {
		$.ajax('getTestList', { type:'GET', dataType:'json'})
		.done(function(data) {
			$.each(data,function(idx,test) {
				var level = data[idx].testsLevel;
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				if(curLevel < level) {
					var force = formatString(level);
					$('<tr>').append($('<th>').html('<input type="radio" name="test" onclick="chooseEvent('+level+')">'))
							 .append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(force))
							 .appendTo('tbody');
				}
			});
		});
	}
	
	function chooseEvent(level) {
		var i = 3;
		var interLock = false;
		var chooseGrade = formatString(level);
		var memberGrade = formatString(curLevel);
		$('#accBtn').css('background-color','blue');
		$('#comment').html('<p> 진행 하시려면 선택완료 버튼을 눌러주세요. </p>')
					 .prepend('<br> <p> 현재등급 : '+memberGrade+'</p> <p> 합격 시 등급 : '+chooseGrade+'</p>');
		$('#accBtn').on('click',function() {
			interLock = !interLock;
			console.log(interLock);
			console.log(level);
			if(level !== null && interLock == true) {
				var readyTime = setInterval(function() {
					$('#comment').html('<br> <p>'+i+'초 후 시험이 시작됩니다. </p>');
					if(i == 0 || interLock == false) {
						clearInterval(readyTime);
						console.log('success');
					}
					i--;
				},1000);
			}
		});
	}
	
	function formatString(value) {
		var str;
		//난이도
		switch(value) {
		case '1' : str='Easy'; break;
		case '2' : str='Normal'; break;
		case '3' : str='Hard'; break;
		case '4' : str='Professional'; break;
		case '5' : str='Management'; break;
		}
		//등급
		switch(value) {
		case 1 : str='Bronze'; break;
		case 2 : str='Silver'; break;
		case 3 : str='Gold'; break;
		case 4 : str='Diamond'; break;
		case 5 : str='Challenger'; break;
		}
		return str;
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