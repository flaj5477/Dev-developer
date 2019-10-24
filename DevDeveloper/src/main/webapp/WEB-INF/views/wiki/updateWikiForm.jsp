<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위키수정</title>
</head>
<body>
위키수정페이지
	<form action="updateWiki">
		<input type="hidden" name="manualNo" value="${wiki.manualNo}"/>
		<input type="text" class="form-control" name="manualTitle" placeholder="등록할 제목"  value="${wiki.manualTitle}">
		<input type="text" class="form-control" name="manualOriUrl" placeholder="참고페이지url" value="${wiki.manualOriUrl}">
  		<textarea class="form-control form-control-alternative" name="manualContents" rows="20" placeholder="문서입력">
  			${wiki.manualContents }
  		</textarea>
  		<input type="text" class="form-control" name="manualTags" placeholder="태그" value="${wiki.manualTags}">
  		<button class="btn btn-primary">수정</button>
	</form>
</body>
</html>