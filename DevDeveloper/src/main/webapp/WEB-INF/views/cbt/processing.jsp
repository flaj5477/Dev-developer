<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var rid = parseInt("${param.testsApplyNo}");
	function process() {
		frm.testsApplyNo.value = rid;
		document.frm.submit();
	}
</script>
</head>
<body onload="process()">
<form action="examination" name="frm" method="POST">
	<input type="hidden" name="testsApplyNo">
</form>
</body>
</html>