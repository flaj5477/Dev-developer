<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/qna.css">
<link href="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/styles/dark.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js"></script>
<script>hljs.initHighlightingOnLoad();</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 
<body>
<div>${qna.qNo }</div>
<div>${qna.qTitle }</div>
<div>${qna.qContents }</div>
<div>${qna.membersId }</div>
<div>${qna.qDate }</div>
	
</body>
</html>