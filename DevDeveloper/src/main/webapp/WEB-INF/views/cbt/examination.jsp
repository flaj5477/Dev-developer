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
	var param = "${param.level}";
	
	var level = parseInt("${recvo.testsNo}");
	var rid = parseInt("${recvo.testsApplyNo}"); //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
	
	var response = Boolean("${param.response}");
	
	function execution() {
		var resultView = $('#result');
		if(response == true) {
			resultOutput();
			exit();
			resultView.show();
		}
		else {
			resultView.hide();
			viewerPage();
		}
	}
	
	function viewerPage() {
		var $toast = $('.cbtExamination #toast');
		$toast.fadeIn(500).delay(1000).fadeOut(500,function() {
			$toast.children('p').html('<br> 응시용 화면으로 전환합니다.');
			$toast.fadeIn(750).delay(1500).fadeOut(750,function() {
				localStorage.setItem('oldGrade','${members.membersGrade}');
				frm.membersNo.value = user;
				frm.testsNo.value = param;
				document.frm.submit();
			});
		});
	}

	function resultOutput() {
		$.ajax('getResult', {
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
			var str = 
				'<table id="resultTab" border="1" style="width:700px">'
					+"<caption style='caption-side: top'>Dev Developer's CBT</caption>"
					+'<tr>'
						+'<th>시험제목</th>'
						+'<th>시험점수</th>'
						+'<th>시험결과</th>'
						+'<th>응시시간</th>'
					+'</tr>'
					+'<tr>'
						+'<th>'+title+'</th>'
						+'<th>'+score+'</th>'
						+'<th>'+result+'</th>'
						+'<th>'+min+'분'+sec+'초</th>'
					+'</tr>'
				'</table>';
			$('#resultView').append(str);
			gradeEvent(newGrade);
		});
	}
	
	function gradeEvent(newGrade) {
		var oldGrade = localStorage.getItem('oldGrade');
		var chooseGrade = formatGrade(level);
		if(newGrade == oldGrade) {
			$('#grade').html('<br>'+chooseGrade+' 승급에 실패하였습니다.');
		}
		else if(newGrade > oldGrade) {
			$('#grade').html('<br>'+chooseGrade+' 승급을 축하합니다.');
		}
	}
	
	function exit() {
		// 결과 도출 후, 스토리지 삭제
		localStorage.clear(); 
		$('#result').append('<button type="button" id="exit">CBT종료</button>');
		$('#exit').on('click',function() {
			$('.cbtResult #toast').fadeIn(500).delay(500).fadeOut(500,function() {
				location.replace('../getDashboard');
			});
		});
	}
</script>
</head>
<body onload="execution()">
<div class="cbtExamination" id="screen-lock" align="center">
	<div id="examination">
		<form action="insertRecord" name="frm" method="post">
			<input type="hidden" name="membersNo"/>
			<input type="hidden" name="testsNo"/>
			<div id="toast">
				<p> <br> 잠시 후 시험이 시작됩니다. </p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
		 				<span class="sr-only"></span>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="cbtResult" align="center">
	<div id="result" >
		<div id="resultView"></div>
		<div id="grade"></div>
		<div id="comment"></div>
		<div id="toast">
			<p> <br> Dashboard로 이동합니다. </p>
		</div>
	</div>
</div>
</body>
</html>