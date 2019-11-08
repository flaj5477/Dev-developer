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
		getDisplayInfo();
		toast();
	});
	
	function screenControl() {
		$('#max').click(function() {
			document.documentElement.requestFullscreen();
		});
	}
	
	function getDisplayInfo() {
		var size = {
		  width: window.innerWidth || document.body.clientWidth,
		  height: window.innerHeight || document.body.clientHeight
		}
		console.log(size.width);
		console.log(size.height);
		return size;
	}
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
	function popup(){
		var url = "viewer";
        var name = "_blank"
        var option = "status = 0, toolbar = 0, menubar = 0, scrollbars = 0, resizable = 0, location = 0, fullscreen = 1"
        var viewer = window.open(url, name, option);
        viewer.moveTo(0,0);
        viewer.resizeTo(screen.width,screen.height);
   	}
	
</script>
</head>
<body>
<div id="screen-lock" align="center">
	<form action="viewer" name="frm" method="post">
		<input type="hidden" name="testsNo">
		<div id="toast">
				<p></p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
		 				<span class="sr-only"></span>
				</div>
		</div>
		<button id="max">크게</button>
		<button id="min">작게</button>
	</form>	
</div>
</body>
</html>