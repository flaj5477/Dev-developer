<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Record</title>
<script>
	function recordList() {
		var user = Number("${members.membersNo}");
		$.ajax('getRecordList/'+user, {
			type : 'GET',
			dataType : 'JSON'
		})
		.done(function(data) {
			$.each(data, function(idx) {
				var title = data[idx].TESTS_TITLE;
				var contents = data[idx].TESTS_CONTENTS;
				var dates = data[idx].TESTS_DATE;
				var score = data[idx].TESTS_SCORE;
				var result = data[idx].TESTS_RESULTS;
				let times = data[idx].TESTS_TIME;
				$('<tr>').append($('<th>').html(title))
						 .append($('<th>').html(contents))
						 .append($('<th>').html(dates))
						 .append($('<th>').html(score))
						 .append($('<th>').html(result))
						 .append($('<th>').html(function() {
							if(times === 0) {
								$(this).text('--');
							}
							else {
								var min = parseInt(times/60);
								var sec = times%60;
								$(this).text(min+'분'+sec+'초');	
							}
						}))
						.appendTo('tbody');
			});
			if(data == '') {
				$('#recordCap').html('응시기록이 없네요!');
			}
		});
	}
</script>
</head>
<body onload="recordList()">
<div class="cbtRecord">
	<table id="recordTab" border="1">
		<caption id="recordCap"></caption>
		<thead>
			<tr align="center">
				<th>시험명</th>
				<th>상세</th>
				<th>응시날짜</th>
				<th>점수</th>
				<th>시험결과</th>
				<th>응시시간</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>
</body>
</html>