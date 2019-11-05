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
		screenControl();
		toast();
	});
	
	function screenControl() {
		
		$('body').requestFullscreen();
	}
	
	function toast() {
		$('#toast').fadeIn(500,function() {
			$('#toast').children('p').html('<br>응시용 화면으로 전환합니다.');
		}).delay(1000)
		  .fadeOut(500,function() {
			//location.href="index";
		});
	}
	
</script>
</head>
<body>
<div id="screen-lock" align="center" style="vertical-align:middle">
	<div id="toast">
			<p></p>
			<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
	 				<span class="sr-only"></span>
			</div>
	</div>	
	<button id="max">크게</button>
	<button id="min">작게</button>
</div>
</body>
</html>