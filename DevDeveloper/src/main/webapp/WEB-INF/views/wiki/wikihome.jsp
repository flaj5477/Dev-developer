<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	pageName="위키가이드";
</script>
</head>


<!-- 
	20191021 곽동우 위키목록뿌리기추가
	
 -->
<body>
위키입니다
	<form action="getwiki" method="post">
		<c:forEach items="${wikiMap }" var="wiki">
			${wiki.manualNo}	<a href=${wiki.manualOriUrl}>${wiki.manualOriUrl} </a> 
			<a href ="getWiki?manualNo=${wiki.manualNo}">${wiki.manualContents}</a> <br>
		</c:forEach>
	</form>
	
	<button onclick="location.href='insertWikiForm'">등록</button>
	
</body>
</html>