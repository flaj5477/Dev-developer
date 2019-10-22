<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT HOME</title>
</head>
<body>
<div align="center">
	레벨테스트<br>
	레벨테스트는 CBT방식으로 최대한 객관성을 얻고자<br>
	한국산업인력공단과 이 사이트를 만든 개발자들이 협력하여<br>
	출제한 문제이므로 참고바랍니다.
	<br><br><br><br>
</div>
<div align="center">
	현재 등급 ${tr.membersGrade} <br>
	다음 등급 ???<br>
	응시하기까지 남은시간 ${tr.testsDate}<br>
	<H2>IF</H2>
	1.회원님은 현재 응시가 가능합니다.<br>
	2.회원님은 ???(지정시간)후 응시가 가능합니다. <br>
	3.회원님은 이미 최고레벨에 도달하였습니다.<br>
	<br><br><br>
</div>
<div align="center">
<button>응시하기</button>
<button>응시불가</button>
</div>
</body>
</html>