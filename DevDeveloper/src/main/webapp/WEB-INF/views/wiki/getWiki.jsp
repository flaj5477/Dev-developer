<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
<body>
	${wiki.manualNo}<br>
	${wiki.manualTitle}<br>
	${wiki.manualContentsPath}<br>
	${wiki.manualOriUrl}<br>
	${wiki.manualTags}<br>
	<form action="updateWikiForm">
		<input type="hidden" name="manualNo" value="${wiki.manualNo}">
		<button class="btn btn-primary">수정</button>
	</form>
	<br>
	<br>
	<div class="col">
		<h2>${wiki.manualTitle}</h2>
		<hr>
		${wiki.manualContents }</div>
		
	
	
</body>
</html>