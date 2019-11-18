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
	var rid = "${recvo.testsApplyNo}"; //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
	var level = parseInt("${recvo.testsNo}");
	var record = Boolean(localStorage.getItem('result'));
	
	function execution() {
		var resultView = $('.cbtResult');
		if(record == true) {
			resultOutput();
			exit();
		}
		else {
			localStorage.setItem('oldGrade','${members.membersGrade}');
			resultView.empty();
			viewerPage();
		}
	}
	
	function viewerPage() {
		$('.cbtExamination #toast').fadeIn(500).delay(1000).fadeOut(500,function() {
			  document.frm.submit();
		});
	}

	function resultOutput() {
		$.ajax('getResult/'+rid, {
			type : 'GET',
			dataType : 'JSON',
			async : false
		})
		.done(function(data) {
			var title = data.testsTitle;
			var score = data.testsScore;
			var time = data.testsTime;
			var min = parseInt(time/60);
			var sec = time%60;
			var result = data.testsResults;
			var newGrade = data.membersGrade;
			$('<tr>').append($('<th>').html(title))
					 .append($('<th>').html(score))
					 .append($('<th>').html(result))
					 .append($('<th>').html(min+'분 '+sec+'초'))
					 .appendTo('#resultTabBody');
			
			gradeEvent(newGrade);
		});
	}
	
	function gradeEvent(newGrade) {
		var oldGrade = localStorage.getItem('oldGrade');
		var chooseGrade = formatGrade(level);
		if(newGrade == oldGrade) {
			$('#grade').html('아쉽게도 '+chooseGrade+' 승급에 실패하였습니다.');
		}
		else if(newGrade > oldGrade) {
			$('#grade').html(chooseGrade+'등급 승급을 축하합니다.');
		}
	}
	
	function exit() {
		$('#exit').on('click',function() {
			record = localStorage.clear();
			$('.cbtResult #toast').fadeIn(5000).delay(500).fadeOut(500,function() {
				location.replace('../getDashboard');
			});
		});
	}
</script>
</head>
<body onload="execution()">
<div class="cbtExamination" id="screen-lock" align="center">
	<div id="examination">
		<form action="viewer" name="frm" method="post">
			<div id="toast">
				<p> <br>응시용 화면으로 전환합니다. </p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
		 				<span class="sr-only"></span>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="cbtResult">
	<div id="result">
		<table id="resultTab" border="1" style="width:650px">
			<thead>
				<tr align="center">
					<th>시험명</th>
					<th>점수</th>
					<th>결과</th>
					<th>응시시간</th>
				</tr>
			</thead>
			<tbody id="resultTabBody"></tbody>
		</table>
		<div id="grade"></div>
		<div id="comment"></div>
		<div id="toast">
			<p> <br> Dashboard로 이동합니다. </p>
		</div>
		<button type="button" id="exit">CBT종료</button>
	</div>
</div>
</body>
</html>