<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위키등록</title>
</head>
<body>
위키등록페이지
	<form action="insertWiki">
		<input type="text" class="form-control" id="manualTitle" placeholder="등록할 제목">
  		<textarea class="form-control form-control-alternative" id="manualContents" rows="20" placeholder="문서입력"></textarea>
	</form>
</body>
</html>