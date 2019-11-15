<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Examination</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	var user = "${members.membersNo}";
	var level = "${param.testsNo}"; //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
	var rid = "${param.testsApplyNo}";
	$(document).ready(function() {
		comparator();
	});
	function comparator() {
		if(rid != '') {
			result();
		}
		else {
			toast();
		}
	}
	
	function toast() {
		frm.testsNo.value = level; // frm 태그에 레벨 값 저장
		$('#toast').fadeIn(500,function() {
			$('#toast').children('p').html('<br>응시용 화면으로 전환합니다.');
		}).delay(1000)
		  .fadeOut(500,function() {
			 frm.membersNo.value = user;
			 frm.testsNo.value = level;
			 document.frm.submit();
		});
	}
	function result() {
		$.ajax('getResult/'+rid, {
			type : 'GET',
			dataType : 'JSON'
		})
		.done(function(data) {
			var title = data.testsTitle;
			var score = data.testsScore;
			var time = data.testsTime;
			var min = parseInt(time/60);
			var sec = time%60;
			var grade = formatGrade(data.membersGrade);
			var result = data.testsResults;
			$('<tr>').append($('<th>').html(title))
					 .append($('<th>').html(score))
					 .append($('<th>').html(result))
					 .append($('<th>').html(min+'분 '+sec+'초'))
					 .append($('<th>').html(grade))
					 .appendTo('#resultTabBody');
		});
	}
</script>
</head>
<body>
<div class="cbtExamination" id="screen-lock" align="center">
	<form action="viewer" name="frm" method="post">
		<input type="hidden" name="testsNo">
		<input type="hidden" name="membersNo">
		<div id="toast">
				<p></p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
		 				<span class="sr-only"></span>
				</div>
		</div>
		<div id="result">
			<table id="resultTab" border="1" style="width:650px">
				<thead>
					<tr align="center">
						<th>시험명</th>
						<th>점수</th>
						<th>결과</th>
						<th>응시시간</th>
						<th>등급</th>
					</tr>
				</thead>
				<tbody id="resultTabBody"></tbody>
			</table>
		</div>
	</form>	
</div>
</body>
</html>