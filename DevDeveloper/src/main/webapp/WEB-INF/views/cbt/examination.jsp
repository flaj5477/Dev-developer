<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Examination</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		toast();
	});
	
	function toast() {
		var level = parseInt("${param.testsNo}"); //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
		frm.testsNo.value = level; // frm 태그에 레벨 값 저장
		$('#toast').fadeIn(500,function() {
			$('#toast').children('p').html('<br>응시용 화면으로 전환합니다.');
		}).delay(1000)
		  .fadeOut(500,function() {
			 document.frm.submit();
		});
	}
</script>
</head>
<body>
<div class="cbtExamination" id="screen-lock" align="center">
	<form action="viewer" name="frm" method="post">
		<input type="hidden" name="testsNo">
		<div id="toast">
				<p></p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
		 				<span class="sr-only"></span>
				</div>
		</div>
	</form>	
</div>
</body>
</html>