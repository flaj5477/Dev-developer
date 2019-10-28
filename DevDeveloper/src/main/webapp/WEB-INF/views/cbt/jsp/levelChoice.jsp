<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
	});
	function accessEvent() {
		
	}
</script>
</head>
<body>
<div align="center">
	<div id="subject"></div>	
	<div id="content">
		<table id="chooseTab" border="1" width="500">
		<tr align="center">
			<th>선택</th>
			<th>난이도</th>
			<th>시험명</th>
		</tr>
		<c:forEach items="${list}" var="tests">
			<c:if test="${param.grade < tests.testsLevel}"> <!--  el에서 param =  request.getparameter에서 받아온 변수를 저장함 -->
			<tr align="center">
			<th><input type="radio" name="test" value="${tests.testsNo}"></th> <!--  이름을 기입해야 한개만 선택하게 됨 -->
			<th>${tests.testsLevel}</th>
			<th>${tests.testsTitle}</th>
			</tr>
			</c:if>
		</c:forEach>
		</table>
	<div id="access"align="right">
		<button type="button" onclick="accessEvent()">시작하기</button>
	</div>
	</div>
</div>
</body>
</html>