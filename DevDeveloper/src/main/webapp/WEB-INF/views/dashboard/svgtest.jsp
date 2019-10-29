<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SVG.js페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.7.1/svg.js"></script>
<script>
	pageName="Dashboard";
</script>

<script> <!--도트 색 표시-->
	$(document).ready(function() {
		var draw = SVG('drawing')

		var rect1 = $('.A').attr({
			//fill : '#196127'
			fill : '#2B0799'
		})
		var rect2 = $('.B').attr({
			//fill : '#239a3b'
			fill : '#4F0CE4'
		})
		var rect3 = $('.C').attr({
			//fill : '#7bc96f'
			fill : '#7A43F9'
		})
		var rect4 = $('.D').attr({
			//fill : '#c6e48b'
			fill : '#AC80ED'
		})
		var rect5 = $('.F').attr({
			//fill : '#ebedf0'
			fill : '#EBE3F6'
		})
	})
</script>
</head>


<body>
	<!-- 출석률 도트 -->
	<div id="drawing">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="620" height="500">
		<c:forEach var="activityLog" items="${activityLogList}" varStatus="status">
			<c:if test="${status.index % 7 == 0 }">		<!-- 일요일이면 g태그 열기 -->
				<g transform="translate(<fmt:formatNumber value="${status.index/7*12}" pattern="#" />, 0)">
			</c:if>
			<rect width="10" height="10" class="${activityLog.activityScore }" x="0" y="${status.index%7*12 }" ></rect>
			<c:if test="${status.index % 7 == 6 }">		<!-- 토요일이면 g태그 닫기 -->
				</g>
			</c:if>
		</c:forEach>
	</svg>
	</div>

	
	
</body>
</html>