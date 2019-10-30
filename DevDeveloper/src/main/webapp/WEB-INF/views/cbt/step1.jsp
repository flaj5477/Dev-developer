<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Step1</title>
</head>
<body>
	${ts.testsNo} <br>
	${ts.testsTitle} <br>
	${ts.testsLevel} <br>
	${ts.testsQVolume} <br>
	${ts.testsPassCriterion} <br>
	${ts.testsTimeLimit} <br>
	${ts.testsContents}
</body>
</html>