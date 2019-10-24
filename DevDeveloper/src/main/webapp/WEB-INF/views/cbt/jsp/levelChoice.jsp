<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div id="subject"></div>
	<div id="choose">
		<c:forEach items="${tslist}" var="tests">
			${tests.testsNo} | 
			${tests.testsTitle} |  
			${tests.testsLevel} | 
			${tests.testsQVolume} |
			${tests.testsPassCriterion} |
			${tests.testsTimeLimit} |
			${tests.testsContents}
			<br>
		</c:forEach>
		<span id="comment"></span>
	</div>
</div>
</body>
</html>