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
		<input type="text" class="form-control" name="manualTitle" placeholder="등록할 제목" >
		<input type="text" class="form-control" name="manualOriUrl" placeholder="참고페이지url" >
  		<textarea class="form-control form-control-alternative" name="manualContents" rows="20" placeholder="문서입력"></textarea>
  		<input type="text" class="form-control" name="manualTags" placeholder="테그" >
  		<button class="btn btn-primary">등록</button>
	</form>
</body>
</html>