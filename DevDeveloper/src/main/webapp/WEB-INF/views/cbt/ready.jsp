<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> CBT Ready </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#tabs").tabs();
		testInfo();
	});
	function testInfo() {
		var level = parseInt("${param.testsLevel}");
		console.log(level); //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
		$.ajax('getTestInfo/'+level, { type:'GET', dataType:'JSON'}) // 호출 Mapping URI
		.done(function(data) {
				var title = data.testsTitle;
				var contents = data.testsContents;
				var volume = data.testsQVolume;
				var passValue = data.testsPassCriterion;
				var time = data.testsTimeLimit;
					$('<tr>').append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(volume))
							 .append($('<th>').html(passValue))
							 .append($('<th>').html(time))
							 .appendTo('tbody');
		});
	}
  </script>
</head>
<body>
<div id="tabs" style="width:435px">
	<ul>
		<li><a href="#tabs-1">시험 안내사항</a></li>
		<li><a href="#tabs-2">시험 메뉴설명</a></li>
		<li><a href="#tabs-3">시험 준비완료</a></li>
	</ul>
	<div id="tabs-1">
		<table id="chooseTab" border="1">
			<thead>
				<tr align="center">
					<th>시험명</th>
					<th>상세</th>
					<th>문항수</th>
					<th>통과점수</th>
					<th>응시시간</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div id="comment"></div>
	</div>
	<div id="tabs-2">
		<p> How are you? </p>
	</div>
	<div id="tabs-3">
		<p> Nice to meet you! </p>
	</div>
</div>
</body>
</html>