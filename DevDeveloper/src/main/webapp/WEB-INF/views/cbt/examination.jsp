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
	var result = null;
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
		$toast.children('div').hide();
		$toast.fadeIn(500).delay(1000).fadeOut(500,function() {
			$toast.children('p').html('<br> 응시용 화면으로 전환합니다.');
			$toast.children('div').show();
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
			result = data.testsResults;
			var newGrade = data.membersGrade;
			var str = 
				'<table id="resultTab" class="table" border="1" style="width:700px">'
					+"<caption>Examination RESULT</caption>"
					+'<tr class="thead-dark">'
						+'<th>시험제목</th>'
						+'<th>시험점수</th>'
						+'<th>시험결과</th>'
						+'<th>응시시간</th>'
					+'</tr>'
					+'<tr>'
						+'<th>'+title+'</th>'
						+'<th>'+score+'점</th>'
						+'<th id="rsToggle">'+result+'</th>'
						+'<th>'+min+'분'+sec+'초</th>'
					+'</tr>'
				'</table>';
			$('#resultView').append(str);
			gradeEvent(newGrade);
		});
	}
	
	setInterval(resultEvent,2000);
	function resultEvent() {
		if(result == '불합격') {
			$('#rsToggle').css('color','red');
			setTimeout(function() {
				$('#rsToggle').css('color','black');
			},1000);
		}
		if(result == '합격') {
			$('#rsToggle').css('color','blue');
			setTimeout(function() {
				$('#rsToggle').css('color','black');
			},1000);
		}
	}
	
	function gradeEvent(newGrade) {
		var oldGrade = localStorage.getItem('oldGrade');
		var chooseGrade = formatGrade(level);
		if(newGrade == oldGrade) {
			$('#grade').html('<p>'+chooseGrade+' 승급에 실패하였습니다. </p>')
			$('#grade').children('p').css('color','red');
		}
		else if(newGrade > oldGrade) {
			$('#grade').html('<p>'+chooseGrade+' 승급을 축하합니다. </p>')
			$('#grade').children('p').css('color','royalblue');
		}
	}
	
	function exit() {
		// 결과 도출 후, 스토리지 삭제
		//localStorage.clear(); 
		$('#exitBtn').on('click',function() {
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
	<div id="result">
		<div id="resultView"></div>
		<div id="grade" class="alert alert-dark"></div>
		<div id="exit">
			<button type="button" id="exitBtn" class="btn btn-info">CBT종료</button>
		</div>
		<div id="toast">
			<p> <br> Dashboard로 이동합니다. </p>
		</div>
	</div>
</div>
</body>
</html>