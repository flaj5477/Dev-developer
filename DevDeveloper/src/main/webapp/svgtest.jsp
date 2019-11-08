<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SVG.js페이지</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.7.1/svg.js"></script>

<script src="https://code.jscharting.com/latest/jscharting.js"></script>
<script type="text/javascript" src="https://code.jscharting.com/latest/modules/types.js"></script>
<link rel="stylesheet" type="text/css" href="css/default.css">
<style type="text/css">/*CSS*/</style>

<script>
	pageName = "Dashboard";
</script>
<script>
<!--도트 색 표시-->
	$(document).ready(function() {
		//var draw = SVG('drawing')

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
		<svg svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="620" height="500">
		<c:forEach var="activityLog" items="${activityLogList}" varStatus="status">
			<c:if test="${status.index % 7 == 0 }">		<!-- 일요일이면 g태그 열기 -->
				<g transform="translate(<fmt:formatNumber value="${status.index/7*12}" pattern="#" />, 0)">
			
				
				
				
				</c:if>
			<rect width="10" height="10" class="${activityLog.activityScore }" x="0" y="${status.index%7*12 }"></rect>
			<c:if test="${status.index % 7 == 6 }">		<!-- 토요일이면 g태그 닫기 -->
				</g>
			</c:if>
		</c:forEach>
	</svg>
	</div>
	<div class="border border-gray-dark py-2 graph-before-activity-overview">
		<div class="js-calendar-graph mx-3 d-flex flex-column flex-items-end flex-xl-items-center overflow-hidden pt-1 is-graph-loading graph-canvas calendar-graph height-full text-center" data-graph-url="/users/flaj5477/contributions?to=2019-11-08" data-url="/flaj5477" data-from="2018-11-04 00:00:00 +0900" data-to="2019-11-08 23:59:59 +0900" data-org="">
			<svg width="828" height="128" class="js-calendar-graph-svg">
  <g transform="translate(10, 20)" data-hydro-click="{&quot;event_type&quot;:&quot;user_profile.click&quot;,&quot;payload&quot;:{&quot;profile_user_id&quot;:51468088,&quot;target&quot;:&quot;CONTRIBUTION_CALENDAR_SQUARE&quot;,&quot;user_id&quot;:51468088,&quot;client_id&quot;:&quot;1423375251.1573174149&quot;,&quot;originating_request_id&quot;:&quot;C38B:36F9:66D983:A118B6:5DC4BB9D&quot;,&quot;originating_url&quot;:&quot;https://github.com/flaj5477&quot;,&quot;referrer&quot;:&quot;https://github.com/flaj5477/Dev-developer&quot;}}" data-hydro-click-hmac="3198d5a26fe1f37a1cacc80a3cd820cf4f67f1af3b38c16acdcd84a936f67eba">
      <g transform="translate(0, 0)">
          <rect class="day" width="12" height="12" x="16" y="0" fill="#ebedf0" data-count="0" data-date="2018-11-04"></rect>
          <rect class="day" width="12" height="12" x="16" y="15" fill="#ebedf0" data-count="0" data-date="2018-11-05"></rect>
          <rect class="day" width="12" height="12" x="16" y="30" fill="#ebedf0" data-count="0" data-date="2018-11-06"></rect>
          <rect class="day" width="12" height="12" x="16" y="45" fill="#ebedf0" data-count="0" data-date="2018-11-07"></rect>
          <rect class="day" width="12" height="12" x="16" y="60" fill="#ebedf0" data-count="0" data-date="2018-11-08"></rect>
          <rect class="day" width="12" height="12" x="16" y="75" fill="#ebedf0" data-count="0" data-date="2018-11-09"></rect>
          <rect class="day" width="12" height="12" x="16" y="90" fill="#ebedf0" data-count="0" data-date="2018-11-10"></rect>
      </g>
      <g transform="translate(16, 0)">
          <rect class="day" width="12" height="12" x="15" y="0" fill="#ebedf0" data-count="0" data-date="2018-11-11"></rect>
          <rect class="day" width="12" height="12" x="15" y="15" fill="#ebedf0" data-count="0" data-date="2018-11-12"></rect>
          <rect class="day" width="12" height="12" x="15" y="30" fill="#ebedf0" data-count="0" data-date="2018-11-13"></rect>
          <rect class="day" width="12" height="12" x="15" y="45" fill="#ebedf0" data-count="0" data-date="2018-11-14"></rect>
          <rect class="day" width="12" height="12" x="15" y="60" fill="#ebedf0" data-count="0" data-date="2018-11-15"></rect>
          <rect class="day" width="12" height="12" x="15" y="75" fill="#ebedf0" data-count="0" data-date="2018-11-16"></rect>
          <rect class="day" width="12" height="12" x="15" y="90" fill="#ebedf0" data-count="0" data-date="2018-11-17"></rect>
      </g>
      <g transform="translate(32, 0)">
          <rect class="day" width="12" height="12" x="14" y="0" fill="#ebedf0" data-count="0" data-date="2018-11-18"></rect>
          <rect class="day" width="12" height="12" x="14" y="15" fill="#ebedf0" data-count="0" data-date="2018-11-19"></rect>
          <rect class="day" width="12" height="12" x="14" y="30" fill="#ebedf0" data-count="0" data-date="2018-11-20"></rect>
          <rect class="day" width="12" height="12" x="14" y="45" fill="#ebedf0" data-count="0" data-date="2018-11-21"></rect>
          <rect class="day" width="12" height="12" x="14" y="60" fill="#ebedf0" data-count="0" data-date="2018-11-22"></rect>
          <rect class="day" width="12" height="12" x="14" y="75" fill="#ebedf0" data-count="0" data-date="2018-11-23"></rect>
          <rect class="day" width="12" height="12" x="14" y="90" fill="#ebedf0" data-count="0" data-date="2018-11-24"></rect>
      </g>
      <g transform="translate(48, 0)">
          <rect class="day" width="12" height="12" x="13" y="0" fill="#ebedf0" data-count="0" data-date="2018-11-25"></rect>
          <rect class="day" width="12" height="12" x="13" y="15" fill="#ebedf0" data-count="0" data-date="2018-11-26"></rect>
          <rect class="day" width="12" height="12" x="13" y="30" fill="#ebedf0" data-count="0" data-date="2018-11-27"></rect>
          <rect class="day" width="12" height="12" x="13" y="45" fill="#ebedf0" data-count="0" data-date="2018-11-28"></rect>
          <rect class="day" width="12" height="12" x="13" y="60" fill="#ebedf0" data-count="0" data-date="2018-11-29"></rect>
          <rect class="day" width="12" height="12" x="13" y="75" fill="#ebedf0" data-count="0" data-date="2018-11-30"></rect>
          <rect class="day" width="12" height="12" x="13" y="90" fill="#ebedf0" data-count="0" data-date="2018-12-01"></rect>
      </g>
      <g transform="translate(64, 0)">
          <rect class="day" width="12" height="12" x="12" y="0" fill="#ebedf0" data-count="0" data-date="2018-12-02"></rect>
          <rect class="day" width="12" height="12" x="12" y="15" fill="#ebedf0" data-count="0" data-date="2018-12-03"></rect>
          <rect class="day" width="12" height="12" x="12" y="30" fill="#ebedf0" data-count="0" data-date="2018-12-04"></rect>
          <rect class="day" width="12" height="12" x="12" y="45" fill="#ebedf0" data-count="0" data-date="2018-12-05"></rect>
          <rect class="day" width="12" height="12" x="12" y="60" fill="#ebedf0" data-count="0" data-date="2018-12-06"></rect>
          <rect class="day" width="12" height="12" x="12" y="75" fill="#ebedf0" data-count="0" data-date="2018-12-07"></rect>
          <rect class="day" width="12" height="12" x="12" y="90" fill="#ebedf0" data-count="0" data-date="2018-12-08"></rect>
      </g>
      <g transform="translate(80, 0)">
          <rect class="day" width="12" height="12" x="11" y="0" fill="#ebedf0" data-count="0" data-date="2018-12-09"></rect>
          <rect class="day" width="12" height="12" x="11" y="15" fill="#ebedf0" data-count="0" data-date="2018-12-10"></rect>
          <rect class="day" width="12" height="12" x="11" y="30" fill="#ebedf0" data-count="0" data-date="2018-12-11"></rect>
          <rect class="day" width="12" height="12" x="11" y="45" fill="#ebedf0" data-count="0" data-date="2018-12-12"></rect>
          <rect class="day" width="12" height="12" x="11" y="60" fill="#ebedf0" data-count="0" data-date="2018-12-13"></rect>
          <rect class="day" width="12" height="12" x="11" y="75" fill="#ebedf0" data-count="0" data-date="2018-12-14"></rect>
          <rect class="day" width="12" height="12" x="11" y="90" fill="#ebedf0" data-count="0" data-date="2018-12-15"></rect>
      </g>
      <g transform="translate(96, 0)">
          <rect class="day" width="12" height="12" x="10" y="0" fill="#ebedf0" data-count="0" data-date="2018-12-16"></rect>
          <rect class="day" width="12" height="12" x="10" y="15" fill="#ebedf0" data-count="0" data-date="2018-12-17"></rect>
          <rect class="day" width="12" height="12" x="10" y="30" fill="#ebedf0" data-count="0" data-date="2018-12-18"></rect>
          <rect class="day" width="12" height="12" x="10" y="45" fill="#ebedf0" data-count="0" data-date="2018-12-19"></rect>
          <rect class="day" width="12" height="12" x="10" y="60" fill="#ebedf0" data-count="0" data-date="2018-12-20"></rect>
          <rect class="day" width="12" height="12" x="10" y="75" fill="#ebedf0" data-count="0" data-date="2018-12-21"></rect>
          <rect class="day" width="12" height="12" x="10" y="90" fill="#ebedf0" data-count="0" data-date="2018-12-22"></rect>
      </g>
      <g transform="translate(112, 0)">
          <rect class="day" width="12" height="12" x="9" y="0" fill="#ebedf0" data-count="0" data-date="2018-12-23"></rect>
          <rect class="day" width="12" height="12" x="9" y="15" fill="#ebedf0" data-count="0" data-date="2018-12-24"></rect>
          <rect class="day" width="12" height="12" x="9" y="30" fill="#ebedf0" data-count="0" data-date="2018-12-25"></rect>
          <rect class="day" width="12" height="12" x="9" y="45" fill="#ebedf0" data-count="0" data-date="2018-12-26"></rect>
          <rect class="day" width="12" height="12" x="9" y="60" fill="#ebedf0" data-count="0" data-date="2018-12-27"></rect>
          <rect class="day" width="12" height="12" x="9" y="75" fill="#ebedf0" data-count="0" data-date="2018-12-28"></rect>
          <rect class="day" width="12" height="12" x="9" y="90" fill="#ebedf0" data-count="0" data-date="2018-12-29"></rect>
      </g>
      <g transform="translate(128, 0)">
          <rect class="day" width="12" height="12" x="8" y="0" fill="#ebedf0" data-count="0" data-date="2018-12-30"></rect>
          <rect class="day" width="12" height="12" x="8" y="15" fill="#ebedf0" data-count="0" data-date="2018-12-31"></rect>
          <rect class="day" width="12" height="12" x="8" y="30" fill="#ebedf0" data-count="0" data-date="2019-01-01"></rect>
          <rect class="day" width="12" height="12" x="8" y="45" fill="#ebedf0" data-count="0" data-date="2019-01-02"></rect>
          <rect class="day" width="12" height="12" x="8" y="60" fill="#ebedf0" data-count="0" data-date="2019-01-03"></rect>
          <rect class="day" width="12" height="12" x="8" y="75" fill="#ebedf0" data-count="0" data-date="2019-01-04"></rect>
          <rect class="day" width="12" height="12" x="8" y="90" fill="#ebedf0" data-count="0" data-date="2019-01-05"></rect>
      </g>
      <g transform="translate(144, 0)">
          <rect class="day" width="12" height="12" x="7" y="0" fill="#ebedf0" data-count="0" data-date="2019-01-06"></rect>
          <rect class="day" width="12" height="12" x="7" y="15" fill="#ebedf0" data-count="0" data-date="2019-01-07"></rect>
          <rect class="day" width="12" height="12" x="7" y="30" fill="#ebedf0" data-count="0" data-date="2019-01-08"></rect>
          <rect class="day" width="12" height="12" x="7" y="45" fill="#ebedf0" data-count="0" data-date="2019-01-09"></rect>
          <rect class="day" width="12" height="12" x="7" y="60" fill="#ebedf0" data-count="0" data-date="2019-01-10"></rect>
          <rect class="day" width="12" height="12" x="7" y="75" fill="#ebedf0" data-count="0" data-date="2019-01-11"></rect>
          <rect class="day" width="12" height="12" x="7" y="90" fill="#ebedf0" data-count="0" data-date="2019-01-12"></rect>
      </g>
      <g transform="translate(160, 0)">
          <rect class="day" width="12" height="12" x="6" y="0" fill="#ebedf0" data-count="0" data-date="2019-01-13"></rect>
          <rect class="day" width="12" height="12" x="6" y="15" fill="#ebedf0" data-count="0" data-date="2019-01-14"></rect>
          <rect class="day" width="12" height="12" x="6" y="30" fill="#ebedf0" data-count="0" data-date="2019-01-15"></rect>
          <rect class="day" width="12" height="12" x="6" y="45" fill="#ebedf0" data-count="0" data-date="2019-01-16"></rect>
          <rect class="day" width="12" height="12" x="6" y="60" fill="#ebedf0" data-count="0" data-date="2019-01-17"></rect>
          <rect class="day" width="12" height="12" x="6" y="75" fill="#ebedf0" data-count="0" data-date="2019-01-18"></rect>
          <rect class="day" width="12" height="12" x="6" y="90" fill="#ebedf0" data-count="0" data-date="2019-01-19"></rect>
      </g>
      <g transform="translate(176, 0)">
          <rect class="day" width="12" height="12" x="5" y="0" fill="#ebedf0" data-count="0" data-date="2019-01-20"></rect>
          <rect class="day" width="12" height="12" x="5" y="15" fill="#ebedf0" data-count="0" data-date="2019-01-21"></rect>
          <rect class="day" width="12" height="12" x="5" y="30" fill="#ebedf0" data-count="0" data-date="2019-01-22"></rect>
          <rect class="day" width="12" height="12" x="5" y="45" fill="#ebedf0" data-count="0" data-date="2019-01-23"></rect>
          <rect class="day" width="12" height="12" x="5" y="60" fill="#ebedf0" data-count="0" data-date="2019-01-24"></rect>
          <rect class="day" width="12" height="12" x="5" y="75" fill="#ebedf0" data-count="0" data-date="2019-01-25"></rect>
          <rect class="day" width="12" height="12" x="5" y="90" fill="#ebedf0" data-count="0" data-date="2019-01-26"></rect>
      </g>
      <g transform="translate(192, 0)">
          <rect class="day" width="12" height="12" x="4" y="0" fill="#ebedf0" data-count="0" data-date="2019-01-27"></rect>
          <rect class="day" width="12" height="12" x="4" y="15" fill="#ebedf0" data-count="0" data-date="2019-01-28"></rect>
          <rect class="day" width="12" height="12" x="4" y="30" fill="#ebedf0" data-count="0" data-date="2019-01-29"></rect>
          <rect class="day" width="12" height="12" x="4" y="45" fill="#ebedf0" data-count="0" data-date="2019-01-30"></rect>
          <rect class="day" width="12" height="12" x="4" y="60" fill="#ebedf0" data-count="0" data-date="2019-01-31"></rect>
          <rect class="day" width="12" height="12" x="4" y="75" fill="#ebedf0" data-count="0" data-date="2019-02-01"></rect>
          <rect class="day" width="12" height="12" x="4" y="90" fill="#ebedf0" data-count="0" data-date="2019-02-02"></rect>
      </g>
      <g transform="translate(208, 0)">
          <rect class="day" width="12" height="12" x="3" y="0" fill="#ebedf0" data-count="0" data-date="2019-02-03"></rect>
          <rect class="day" width="12" height="12" x="3" y="15" fill="#ebedf0" data-count="0" data-date="2019-02-04"></rect>
          <rect class="day" width="12" height="12" x="3" y="30" fill="#ebedf0" data-count="0" data-date="2019-02-05"></rect>
          <rect class="day" width="12" height="12" x="3" y="45" fill="#ebedf0" data-count="0" data-date="2019-02-06"></rect>
          <rect class="day" width="12" height="12" x="3" y="60" fill="#ebedf0" data-count="0" data-date="2019-02-07"></rect>
          <rect class="day" width="12" height="12" x="3" y="75" fill="#ebedf0" data-count="0" data-date="2019-02-08"></rect>
          <rect class="day" width="12" height="12" x="3" y="90" fill="#ebedf0" data-count="0" data-date="2019-02-09"></rect>
      </g>
      <g transform="translate(224, 0)">
          <rect class="day" width="12" height="12" x="2" y="0" fill="#ebedf0" data-count="0" data-date="2019-02-10"></rect>
          <rect class="day" width="12" height="12" x="2" y="15" fill="#ebedf0" data-count="0" data-date="2019-02-11"></rect>
          <rect class="day" width="12" height="12" x="2" y="30" fill="#ebedf0" data-count="0" data-date="2019-02-12"></rect>
          <rect class="day" width="12" height="12" x="2" y="45" fill="#ebedf0" data-count="0" data-date="2019-02-13"></rect>
          <rect class="day" width="12" height="12" x="2" y="60" fill="#ebedf0" data-count="0" data-date="2019-02-14"></rect>
          <rect class="day" width="12" height="12" x="2" y="75" fill="#ebedf0" data-count="0" data-date="2019-02-15"></rect>
          <rect class="day" width="12" height="12" x="2" y="90" fill="#ebedf0" data-count="0" data-date="2019-02-16"></rect>
      </g>
      <g transform="translate(240, 0)">
          <rect class="day" width="12" height="12" x="1" y="0" fill="#ebedf0" data-count="0" data-date="2019-02-17"></rect>
          <rect class="day" width="12" height="12" x="1" y="15" fill="#ebedf0" data-count="0" data-date="2019-02-18"></rect>
          <rect class="day" width="12" height="12" x="1" y="30" fill="#ebedf0" data-count="0" data-date="2019-02-19"></rect>
          <rect class="day" width="12" height="12" x="1" y="45" fill="#ebedf0" data-count="0" data-date="2019-02-20"></rect>
          <rect class="day" width="12" height="12" x="1" y="60" fill="#ebedf0" data-count="0" data-date="2019-02-21"></rect>
          <rect class="day" width="12" height="12" x="1" y="75" fill="#ebedf0" data-count="0" data-date="2019-02-22"></rect>
          <rect class="day" width="12" height="12" x="1" y="90" fill="#ebedf0" data-count="0" data-date="2019-02-23"></rect>
      </g>
      <g transform="translate(256, 0)">
          <rect class="day" width="12" height="12" x="0" y="0" fill="#ebedf0" data-count="0" data-date="2019-02-24"></rect>
          <rect class="day" width="12" height="12" x="0" y="15" fill="#ebedf0" data-count="0" data-date="2019-02-25"></rect>
          <rect class="day" width="12" height="12" x="0" y="30" fill="#ebedf0" data-count="0" data-date="2019-02-26"></rect>
          <rect class="day" width="12" height="12" x="0" y="45" fill="#ebedf0" data-count="0" data-date="2019-02-27"></rect>
          <rect class="day" width="12" height="12" x="0" y="60" fill="#ebedf0" data-count="0" data-date="2019-02-28"></rect>
          <rect class="day" width="12" height="12" x="0" y="75" fill="#ebedf0" data-count="0" data-date="2019-03-01"></rect>
          <rect class="day" width="12" height="12" x="0" y="90" fill="#ebedf0" data-count="0" data-date="2019-03-02"></rect>
      </g>
      <g transform="translate(272, 0)">
          <rect class="day" width="12" height="12" x="-1" y="0" fill="#ebedf0" data-count="0" data-date="2019-03-03"></rect>
          <rect class="day" width="12" height="12" x="-1" y="15" fill="#ebedf0" data-count="0" data-date="2019-03-04"></rect>
          <rect class="day" width="12" height="12" x="-1" y="30" fill="#ebedf0" data-count="0" data-date="2019-03-05"></rect>
          <rect class="day" width="12" height="12" x="-1" y="45" fill="#ebedf0" data-count="0" data-date="2019-03-06"></rect>
          <rect class="day" width="12" height="12" x="-1" y="60" fill="#ebedf0" data-count="0" data-date="2019-03-07"></rect>
          <rect class="day" width="12" height="12" x="-1" y="75" fill="#ebedf0" data-count="0" data-date="2019-03-08"></rect>
          <rect class="day" width="12" height="12" x="-1" y="90" fill="#ebedf0" data-count="0" data-date="2019-03-09"></rect>
      </g>
      <g transform="translate(288, 0)">
          <rect class="day" width="12" height="12" x="-2" y="0" fill="#ebedf0" data-count="0" data-date="2019-03-10"></rect>
          <rect class="day" width="12" height="12" x="-2" y="15" fill="#ebedf0" data-count="0" data-date="2019-03-11"></rect>
          <rect class="day" width="12" height="12" x="-2" y="30" fill="#ebedf0" data-count="0" data-date="2019-03-12"></rect>
          <rect class="day" width="12" height="12" x="-2" y="45" fill="#ebedf0" data-count="0" data-date="2019-03-13"></rect>
          <rect class="day" width="12" height="12" x="-2" y="60" fill="#ebedf0" data-count="0" data-date="2019-03-14"></rect>
          <rect class="day" width="12" height="12" x="-2" y="75" fill="#ebedf0" data-count="0" data-date="2019-03-15"></rect>
          <rect class="day" width="12" height="12" x="-2" y="90" fill="#ebedf0" data-count="0" data-date="2019-03-16"></rect>
      </g>
      <g transform="translate(304, 0)">
          <rect class="day" width="12" height="12" x="-3" y="0" fill="#ebedf0" data-count="0" data-date="2019-03-17"></rect>
          <rect class="day" width="12" height="12" x="-3" y="15" fill="#ebedf0" data-count="0" data-date="2019-03-18"></rect>
          <rect class="day" width="12" height="12" x="-3" y="30" fill="#ebedf0" data-count="0" data-date="2019-03-19"></rect>
          <rect class="day" width="12" height="12" x="-3" y="45" fill="#ebedf0" data-count="0" data-date="2019-03-20"></rect>
          <rect class="day" width="12" height="12" x="-3" y="60" fill="#ebedf0" data-count="0" data-date="2019-03-21"></rect>
          <rect class="day" width="12" height="12" x="-3" y="75" fill="#ebedf0" data-count="0" data-date="2019-03-22"></rect>
          <rect class="day" width="12" height="12" x="-3" y="90" fill="#ebedf0" data-count="0" data-date="2019-03-23"></rect>
      </g>
      <g transform="translate(320, 0)">
          <rect class="day" width="12" height="12" x="-4" y="0" fill="#ebedf0" data-count="0" data-date="2019-03-24"></rect>
          <rect class="day" width="12" height="12" x="-4" y="15" fill="#ebedf0" data-count="0" data-date="2019-03-25"></rect>
          <rect class="day" width="12" height="12" x="-4" y="30" fill="#ebedf0" data-count="0" data-date="2019-03-26"></rect>
          <rect class="day" width="12" height="12" x="-4" y="45" fill="#ebedf0" data-count="0" data-date="2019-03-27"></rect>
          <rect class="day" width="12" height="12" x="-4" y="60" fill="#ebedf0" data-count="0" data-date="2019-03-28"></rect>
          <rect class="day" width="12" height="12" x="-4" y="75" fill="#ebedf0" data-count="0" data-date="2019-03-29"></rect>
          <rect class="day" width="12" height="12" x="-4" y="90" fill="#ebedf0" data-count="0" data-date="2019-03-30"></rect>
      </g>
      <g transform="translate(336, 0)">
          <rect class="day" width="12" height="12" x="-5" y="0" fill="#ebedf0" data-count="0" data-date="2019-03-31"></rect>
          <rect class="day" width="12" height="12" x="-5" y="15" fill="#ebedf0" data-count="0" data-date="2019-04-01"></rect>
          <rect class="day" width="12" height="12" x="-5" y="30" fill="#ebedf0" data-count="0" data-date="2019-04-02"></rect>
          <rect class="day" width="12" height="12" x="-5" y="45" fill="#ebedf0" data-count="0" data-date="2019-04-03"></rect>
          <rect class="day" width="12" height="12" x="-5" y="60" fill="#ebedf0" data-count="0" data-date="2019-04-04"></rect>
          <rect class="day" width="12" height="12" x="-5" y="75" fill="#ebedf0" data-count="0" data-date="2019-04-05"></rect>
          <rect class="day" width="12" height="12" x="-5" y="90" fill="#ebedf0" data-count="0" data-date="2019-04-06"></rect>
      </g>
      <g transform="translate(352, 0)">
          <rect class="day" width="12" height="12" x="-6" y="0" fill="#ebedf0" data-count="0" data-date="2019-04-07"></rect>
          <rect class="day" width="12" height="12" x="-6" y="15" fill="#ebedf0" data-count="0" data-date="2019-04-08"></rect>
          <rect class="day" width="12" height="12" x="-6" y="30" fill="#ebedf0" data-count="0" data-date="2019-04-09"></rect>
          <rect class="day" width="12" height="12" x="-6" y="45" fill="#ebedf0" data-count="0" data-date="2019-04-10"></rect>
          <rect class="day" width="12" height="12" x="-6" y="60" fill="#ebedf0" data-count="0" data-date="2019-04-11"></rect>
          <rect class="day" width="12" height="12" x="-6" y="75" fill="#ebedf0" data-count="0" data-date="2019-04-12"></rect>
          <rect class="day" width="12" height="12" x="-6" y="90" fill="#ebedf0" data-count="0" data-date="2019-04-13"></rect>
      </g>
      <g transform="translate(368, 0)">
          <rect class="day" width="12" height="12" x="-7" y="0" fill="#ebedf0" data-count="0" data-date="2019-04-14"></rect>
          <rect class="day" width="12" height="12" x="-7" y="15" fill="#ebedf0" data-count="0" data-date="2019-04-15"></rect>
          <rect class="day" width="12" height="12" x="-7" y="30" fill="#ebedf0" data-count="0" data-date="2019-04-16"></rect>
          <rect class="day" width="12" height="12" x="-7" y="45" fill="#ebedf0" data-count="0" data-date="2019-04-17"></rect>
          <rect class="day" width="12" height="12" x="-7" y="60" fill="#ebedf0" data-count="0" data-date="2019-04-18"></rect>
          <rect class="day" width="12" height="12" x="-7" y="75" fill="#ebedf0" data-count="0" data-date="2019-04-19"></rect>
          <rect class="day" width="12" height="12" x="-7" y="90" fill="#ebedf0" data-count="0" data-date="2019-04-20"></rect>
      </g>
      <g transform="translate(384, 0)">
          <rect class="day" width="12" height="12" x="-8" y="0" fill="#ebedf0" data-count="0" data-date="2019-04-21"></rect>
          <rect class="day" width="12" height="12" x="-8" y="15" fill="#ebedf0" data-count="0" data-date="2019-04-22"></rect>
          <rect class="day" width="12" height="12" x="-8" y="30" fill="#ebedf0" data-count="0" data-date="2019-04-23"></rect>
          <rect class="day" width="12" height="12" x="-8" y="45" fill="#ebedf0" data-count="0" data-date="2019-04-24"></rect>
          <rect class="day" width="12" height="12" x="-8" y="60" fill="#ebedf0" data-count="0" data-date="2019-04-25"></rect>
          <rect class="day" width="12" height="12" x="-8" y="75" fill="#ebedf0" data-count="0" data-date="2019-04-26"></rect>
          <rect class="day" width="12" height="12" x="-8" y="90" fill="#ebedf0" data-count="0" data-date="2019-04-27"></rect>
      </g>
      <g transform="translate(400, 0)">
          <rect class="day" width="12" height="12" x="-9" y="0" fill="#ebedf0" data-count="0" data-date="2019-04-28"></rect>
          <rect class="day" width="12" height="12" x="-9" y="15" fill="#ebedf0" data-count="0" data-date="2019-04-29"></rect>
          <rect class="day" width="12" height="12" x="-9" y="30" fill="#ebedf0" data-count="0" data-date="2019-04-30"></rect>
          <rect class="day" width="12" height="12" x="-9" y="45" fill="#ebedf0" data-count="0" data-date="2019-05-01"></rect>
          <rect class="day" width="12" height="12" x="-9" y="60" fill="#ebedf0" data-count="0" data-date="2019-05-02"></rect>
          <rect class="day" width="12" height="12" x="-9" y="75" fill="#ebedf0" data-count="0" data-date="2019-05-03"></rect>
          <rect class="day" width="12" height="12" x="-9" y="90" fill="#ebedf0" data-count="0" data-date="2019-05-04"></rect>
      </g>
      <g transform="translate(416, 0)">
          <rect class="day" width="12" height="12" x="-10" y="0" fill="#ebedf0" data-count="0" data-date="2019-05-05"></rect>
          <rect class="day" width="12" height="12" x="-10" y="15" fill="#ebedf0" data-count="0" data-date="2019-05-06"></rect>
          <rect class="day" width="12" height="12" x="-10" y="30" fill="#ebedf0" data-count="0" data-date="2019-05-07"></rect>
          <rect class="day" width="12" height="12" x="-10" y="45" fill="#ebedf0" data-count="0" data-date="2019-05-08"></rect>
          <rect class="day" width="12" height="12" x="-10" y="60" fill="#ebedf0" data-count="0" data-date="2019-05-09"></rect>
          <rect class="day" width="12" height="12" x="-10" y="75" fill="#ebedf0" data-count="0" data-date="2019-05-10"></rect>
          <rect class="day" width="12" height="12" x="-10" y="90" fill="#ebedf0" data-count="0" data-date="2019-05-11"></rect>
      </g>
      <g transform="translate(432, 0)">
          <rect class="day" width="12" height="12" x="-11" y="0" fill="#ebedf0" data-count="0" data-date="2019-05-12"></rect>
          <rect class="day" width="12" height="12" x="-11" y="15" fill="#ebedf0" data-count="0" data-date="2019-05-13"></rect>
          <rect class="day" width="12" height="12" x="-11" y="30" fill="#ebedf0" data-count="0" data-date="2019-05-14"></rect>
          <rect class="day" width="12" height="12" x="-11" y="45" fill="#ebedf0" data-count="0" data-date="2019-05-15"></rect>
          <rect class="day" width="12" height="12" x="-11" y="60" fill="#ebedf0" data-count="0" data-date="2019-05-16"></rect>
          <rect class="day" width="12" height="12" x="-11" y="75" fill="#ebedf0" data-count="0" data-date="2019-05-17"></rect>
          <rect class="day" width="12" height="12" x="-11" y="90" fill="#ebedf0" data-count="0" data-date="2019-05-18"></rect>
      </g>
      <g transform="translate(448, 0)">
          <rect class="day" width="12" height="12" x="-12" y="0" fill="#ebedf0" data-count="0" data-date="2019-05-19"></rect>
          <rect class="day" width="12" height="12" x="-12" y="15" fill="#ebedf0" data-count="0" data-date="2019-05-20"></rect>
          <rect class="day" width="12" height="12" x="-12" y="30" fill="#ebedf0" data-count="0" data-date="2019-05-21"></rect>
          <rect class="day" width="12" height="12" x="-12" y="45" fill="#ebedf0" data-count="0" data-date="2019-05-22"></rect>
          <rect class="day" width="12" height="12" x="-12" y="60" fill="#ebedf0" data-count="0" data-date="2019-05-23"></rect>
          <rect class="day" width="12" height="12" x="-12" y="75" fill="#ebedf0" data-count="0" data-date="2019-05-24"></rect>
          <rect class="day" width="12" height="12" x="-12" y="90" fill="#ebedf0" data-count="0" data-date="2019-05-25"></rect>
      </g>
      <g transform="translate(464, 0)">
          <rect class="day" width="12" height="12" x="-13" y="0" fill="#ebedf0" data-count="0" data-date="2019-05-26"></rect>
          <rect class="day" width="12" height="12" x="-13" y="15" fill="#ebedf0" data-count="0" data-date="2019-05-27"></rect>
          <rect class="day" width="12" height="12" x="-13" y="30" fill="#ebedf0" data-count="0" data-date="2019-05-28"></rect>
          <rect class="day" width="12" height="12" x="-13" y="45" fill="#ebedf0" data-count="0" data-date="2019-05-29"></rect>
          <rect class="day" width="12" height="12" x="-13" y="60" fill="#ebedf0" data-count="0" data-date="2019-05-30"></rect>
          <rect class="day" width="12" height="12" x="-13" y="75" fill="#ebedf0" data-count="0" data-date="2019-05-31"></rect>
          <rect class="day" width="12" height="12" x="-13" y="90" fill="#ebedf0" data-count="0" data-date="2019-06-01"></rect>
      </g>
      <g transform="translate(480, 0)">
          <rect class="day" width="12" height="12" x="-14" y="0" fill="#ebedf0" data-count="0" data-date="2019-06-02"></rect>
          <rect class="day" width="12" height="12" x="-14" y="15" fill="#ebedf0" data-count="0" data-date="2019-06-03"></rect>
          <rect class="day" width="12" height="12" x="-14" y="30" fill="#ebedf0" data-count="0" data-date="2019-06-04"></rect>
          <rect class="day" width="12" height="12" x="-14" y="45" fill="#ebedf0" data-count="0" data-date="2019-06-05"></rect>
          <rect class="day" width="12" height="12" x="-14" y="60" fill="#ebedf0" data-count="0" data-date="2019-06-06"></rect>
          <rect class="day" width="12" height="12" x="-14" y="75" fill="#c6e48b" data-count="1" data-date="2019-06-07"></rect>
          <rect class="day" width="12" height="12" x="-14" y="90" fill="#ebedf0" data-count="0" data-date="2019-06-08"></rect>
      </g>
      <g transform="translate(496, 0)">
          <rect class="day" width="12" height="12" x="-15" y="0" fill="#ebedf0" data-count="0" data-date="2019-06-09"></rect>
          <rect class="day" width="12" height="12" x="-15" y="15" fill="#ebedf0" data-count="0" data-date="2019-06-10"></rect>
          <rect class="day" width="12" height="12" x="-15" y="30" fill="#ebedf0" data-count="0" data-date="2019-06-11"></rect>
          <rect class="day" width="12" height="12" x="-15" y="45" fill="#ebedf0" data-count="0" data-date="2019-06-12"></rect>
          <rect class="day" width="12" height="12" x="-15" y="60" fill="#ebedf0" data-count="0" data-date="2019-06-13"></rect>
          <rect class="day" width="12" height="12" x="-15" y="75" fill="#ebedf0" data-count="0" data-date="2019-06-14"></rect>
          <rect class="day" width="12" height="12" x="-15" y="90" fill="#ebedf0" data-count="0" data-date="2019-06-15"></rect>
      </g>
      <g transform="translate(512, 0)">
          <rect class="day" width="12" height="12" x="-16" y="0" fill="#ebedf0" data-count="0" data-date="2019-06-16"></rect>
          <rect class="day" width="12" height="12" x="-16" y="15" fill="#ebedf0" data-count="0" data-date="2019-06-17"></rect>
          <rect class="day" width="12" height="12" x="-16" y="30" fill="#ebedf0" data-count="0" data-date="2019-06-18"></rect>
          <rect class="day" width="12" height="12" x="-16" y="45" fill="#ebedf0" data-count="0" data-date="2019-06-19"></rect>
          <rect class="day" width="12" height="12" x="-16" y="60" fill="#ebedf0" data-count="0" data-date="2019-06-20"></rect>
          <rect class="day" width="12" height="12" x="-16" y="75" fill="#ebedf0" data-count="0" data-date="2019-06-21"></rect>
          <rect class="day" width="12" height="12" x="-16" y="90" fill="#ebedf0" data-count="0" data-date="2019-06-22"></rect>
      </g>
      <g transform="translate(528, 0)">
          <rect class="day" width="12" height="12" x="-17" y="0" fill="#ebedf0" data-count="0" data-date="2019-06-23"></rect>
          <rect class="day" width="12" height="12" x="-17" y="15" fill="#ebedf0" data-count="0" data-date="2019-06-24"></rect>
          <rect class="day" width="12" height="12" x="-17" y="30" fill="#ebedf0" data-count="0" data-date="2019-06-25"></rect>
          <rect class="day" width="12" height="12" x="-17" y="45" fill="#ebedf0" data-count="0" data-date="2019-06-26"></rect>
          <rect class="day" width="12" height="12" x="-17" y="60" fill="#ebedf0" data-count="0" data-date="2019-06-27"></rect>
          <rect class="day" width="12" height="12" x="-17" y="75" fill="#ebedf0" data-count="0" data-date="2019-06-28"></rect>
          <rect class="day" width="12" height="12" x="-17" y="90" fill="#ebedf0" data-count="0" data-date="2019-06-29"></rect>
      </g>
      <g transform="translate(544, 0)">
          <rect class="day" width="12" height="12" x="-18" y="0" fill="#ebedf0" data-count="0" data-date="2019-06-30"></rect>
          <rect class="day" width="12" height="12" x="-18" y="15" fill="#ebedf0" data-count="0" data-date="2019-07-01"></rect>
          <rect class="day" width="12" height="12" x="-18" y="30" fill="#ebedf0" data-count="0" data-date="2019-07-02"></rect>
          <rect class="day" width="12" height="12" x="-18" y="45" fill="#ebedf0" data-count="0" data-date="2019-07-03"></rect>
          <rect class="day" width="12" height="12" x="-18" y="60" fill="#ebedf0" data-count="0" data-date="2019-07-04"></rect>
          <rect class="day" width="12" height="12" x="-18" y="75" fill="#ebedf0" data-count="0" data-date="2019-07-05"></rect>
          <rect class="day" width="12" height="12" x="-18" y="90" fill="#ebedf0" data-count="0" data-date="2019-07-06"></rect>
      </g>
      <g transform="translate(560, 0)">
          <rect class="day" width="12" height="12" x="-19" y="0" fill="#ebedf0" data-count="0" data-date="2019-07-07"></rect>
          <rect class="day" width="12" height="12" x="-19" y="15" fill="#ebedf0" data-count="0" data-date="2019-07-08"></rect>
          <rect class="day" width="12" height="12" x="-19" y="30" fill="#ebedf0" data-count="0" data-date="2019-07-09"></rect>
          <rect class="day" width="12" height="12" x="-19" y="45" fill="#ebedf0" data-count="0" data-date="2019-07-10"></rect>
          <rect class="day" width="12" height="12" x="-19" y="60" fill="#ebedf0" data-count="0" data-date="2019-07-11"></rect>
          <rect class="day" width="12" height="12" x="-19" y="75" fill="#ebedf0" data-count="0" data-date="2019-07-12"></rect>
          <rect class="day" width="12" height="12" x="-19" y="90" fill="#ebedf0" data-count="0" data-date="2019-07-13"></rect>
      </g>
      <g transform="translate(576, 0)">
          <rect class="day" width="12" height="12" x="-20" y="0" fill="#ebedf0" data-count="0" data-date="2019-07-14"></rect>
          <rect class="day" width="12" height="12" x="-20" y="15" fill="#ebedf0" data-count="0" data-date="2019-07-15"></rect>
          <rect class="day" width="12" height="12" x="-20" y="30" fill="#ebedf0" data-count="0" data-date="2019-07-16"></rect>
          <rect class="day" width="12" height="12" x="-20" y="45" fill="#ebedf0" data-count="0" data-date="2019-07-17"></rect>
          <rect class="day" width="12" height="12" x="-20" y="60" fill="#ebedf0" data-count="0" data-date="2019-07-18"></rect>
          <rect class="day" width="12" height="12" x="-20" y="75" fill="#ebedf0" data-count="0" data-date="2019-07-19"></rect>
          <rect class="day" width="12" height="12" x="-20" y="90" fill="#ebedf0" data-count="0" data-date="2019-07-20"></rect>
      </g>
      <g transform="translate(592, 0)">
          <rect class="day" width="12" height="12" x="-21" y="0" fill="#ebedf0" data-count="0" data-date="2019-07-21"></rect>
          <rect class="day" width="12" height="12" x="-21" y="15" fill="#ebedf0" data-count="0" data-date="2019-07-22"></rect>
          <rect class="day" width="12" height="12" x="-21" y="30" fill="#ebedf0" data-count="0" data-date="2019-07-23"></rect>
          <rect class="day" width="12" height="12" x="-21" y="45" fill="#ebedf0" data-count="0" data-date="2019-07-24"></rect>
          <rect class="day" width="12" height="12" x="-21" y="60" fill="#ebedf0" data-count="0" data-date="2019-07-25"></rect>
          <rect class="day" width="12" height="12" x="-21" y="75" fill="#ebedf0" data-count="0" data-date="2019-07-26"></rect>
          <rect class="day" width="12" height="12" x="-21" y="90" fill="#ebedf0" data-count="0" data-date="2019-07-27"></rect>
      </g>
      <g transform="translate(608, 0)">
          <rect class="day" width="12" height="12" x="-22" y="0" fill="#ebedf0" data-count="0" data-date="2019-07-28"></rect>
          <rect class="day" width="12" height="12" x="-22" y="15" fill="#ebedf0" data-count="0" data-date="2019-07-29"></rect>
          <rect class="day" width="12" height="12" x="-22" y="30" fill="#ebedf0" data-count="0" data-date="2019-07-30"></rect>
          <rect class="day" width="12" height="12" x="-22" y="45" fill="#ebedf0" data-count="0" data-date="2019-07-31"></rect>
          <rect class="day" width="12" height="12" x="-22" y="60" fill="#ebedf0" data-count="0" data-date="2019-08-01"></rect>
          <rect class="day" width="12" height="12" x="-22" y="75" fill="#ebedf0" data-count="0" data-date="2019-08-02"></rect>
          <rect class="day" width="12" height="12" x="-22" y="90" fill="#ebedf0" data-count="0" data-date="2019-08-03"></rect>
      </g>
      <g transform="translate(624, 0)">
          <rect class="day" width="12" height="12" x="-23" y="0" fill="#ebedf0" data-count="0" data-date="2019-08-04"></rect>
          <rect class="day" width="12" height="12" x="-23" y="15" fill="#ebedf0" data-count="0" data-date="2019-08-05"></rect>
          <rect class="day" width="12" height="12" x="-23" y="30" fill="#ebedf0" data-count="0" data-date="2019-08-06"></rect>
          <rect class="day" width="12" height="12" x="-23" y="45" fill="#ebedf0" data-count="0" data-date="2019-08-07"></rect>
          <rect class="day" width="12" height="12" x="-23" y="60" fill="#ebedf0" data-count="0" data-date="2019-08-08"></rect>
          <rect class="day" width="12" height="12" x="-23" y="75" fill="#ebedf0" data-count="0" data-date="2019-08-09"></rect>
          <rect class="day" width="12" height="12" x="-23" y="90" fill="#ebedf0" data-count="0" data-date="2019-08-10"></rect>
      </g>
      <g transform="translate(640, 0)">
          <rect class="day" width="12" height="12" x="-24" y="0" fill="#ebedf0" data-count="0" data-date="2019-08-11"></rect>
          <rect class="day" width="12" height="12" x="-24" y="15" fill="#ebedf0" data-count="0" data-date="2019-08-12"></rect>
          <rect class="day" width="12" height="12" x="-24" y="30" fill="#ebedf0" data-count="0" data-date="2019-08-13"></rect>
          <rect class="day" width="12" height="12" x="-24" y="45" fill="#ebedf0" data-count="0" data-date="2019-08-14"></rect>
          <rect class="day" width="12" height="12" x="-24" y="60" fill="#ebedf0" data-count="0" data-date="2019-08-15"></rect>
          <rect class="day" width="12" height="12" x="-24" y="75" fill="#ebedf0" data-count="0" data-date="2019-08-16"></rect>
          <rect class="day" width="12" height="12" x="-24" y="90" fill="#ebedf0" data-count="0" data-date="2019-08-17"></rect>
      </g>
      <g transform="translate(656, 0)">
          <rect class="day" width="12" height="12" x="-25" y="0" fill="#ebedf0" data-count="0" data-date="2019-08-18"></rect>
          <rect class="day" width="12" height="12" x="-25" y="15" fill="#c6e48b" data-count="1" data-date="2019-08-19"></rect>
          <rect class="day" width="12" height="12" x="-25" y="30" fill="#c6e48b" data-count="1" data-date="2019-08-20"></rect>
          <rect class="day" width="12" height="12" x="-25" y="45" fill="#ebedf0" data-count="0" data-date="2019-08-21"></rect>
          <rect class="day" width="12" height="12" x="-25" y="60" fill="#7bc96f" data-count="3" data-date="2019-08-22"></rect>
          <rect class="day" width="12" height="12" x="-25" y="75" fill="#c6e48b" data-count="2" data-date="2019-08-23"></rect>
          <rect class="day" width="12" height="12" x="-25" y="90" fill="#ebedf0" data-count="0" data-date="2019-08-24"></rect>
      </g>
      <g transform="translate(672, 0)">
          <rect class="day" width="12" height="12" x="-26" y="0" fill="#ebedf0" data-count="0" data-date="2019-08-25"></rect>
          <rect class="day" width="12" height="12" x="-26" y="15" fill="#196127" data-count="13" data-date="2019-08-26"></rect>
          <rect class="day" width="12" height="12" x="-26" y="30" fill="#ebedf0" data-count="0" data-date="2019-08-27"></rect>
          <rect class="day" width="12" height="12" x="-26" y="45" fill="#ebedf0" data-count="0" data-date="2019-08-28"></rect>
          <rect class="day" width="12" height="12" x="-26" y="60" fill="#239a3b" data-count="6" data-date="2019-08-29"></rect>
          <rect class="day" width="12" height="12" x="-26" y="75" fill="#c6e48b" data-count="1" data-date="2019-08-30"></rect>
          <rect class="day" width="12" height="12" x="-26" y="90" fill="#ebedf0" data-count="0" data-date="2019-08-31"></rect>
      </g>
      <g transform="translate(688, 0)">
          <rect class="day" width="12" height="12" x="-27" y="0" fill="#ebedf0" data-count="0" data-date="2019-09-01"></rect>
          <rect class="day" width="12" height="12" x="-27" y="15" fill="#ebedf0" data-count="0" data-date="2019-09-02"></rect>
          <rect class="day" width="12" height="12" x="-27" y="30" fill="#ebedf0" data-count="0" data-date="2019-09-03"></rect>
          <rect class="day" width="12" height="12" x="-27" y="45" fill="#ebedf0" data-count="0" data-date="2019-09-04"></rect>
          <rect class="day" width="12" height="12" x="-27" y="60" fill="#c6e48b" data-count="2" data-date="2019-09-05"></rect>
          <rect class="day" width="12" height="12" x="-27" y="75" fill="#7bc96f" data-count="4" data-date="2019-09-06"></rect>
          <rect class="day" width="12" height="12" x="-27" y="90" fill="#ebedf0" data-count="0" data-date="2019-09-07"></rect>
      </g>
      <g transform="translate(704, 0)">
          <rect class="day" width="12" height="12" x="-28" y="0" fill="#7bc96f" data-count="3" data-date="2019-09-08"></rect>
          <rect class="day" width="12" height="12" x="-28" y="15" fill="#c6e48b" data-count="2" data-date="2019-09-09"></rect>
          <rect class="day" width="12" height="12" x="-28" y="30" fill="#ebedf0" data-count="0" data-date="2019-09-10"></rect>
          <rect class="day" width="12" height="12" x="-28" y="45" fill="#ebedf0" data-count="0" data-date="2019-09-11"></rect>
          <rect class="day" width="12" height="12" x="-28" y="60" fill="#ebedf0" data-count="0" data-date="2019-09-12"></rect>
          <rect class="day" width="12" height="12" x="-28" y="75" fill="#ebedf0" data-count="0" data-date="2019-09-13"></rect>
          <rect class="day" width="12" height="12" x="-28" y="90" fill="#ebedf0" data-count="0" data-date="2019-09-14"></rect>
      </g>
      <g transform="translate(720, 0)">
          <rect class="day" width="12" height="12" x="-29" y="0" fill="#c6e48b" data-count="1" data-date="2019-09-15"></rect>
          <rect class="day" width="12" height="12" x="-29" y="15" fill="#c6e48b" data-count="2" data-date="2019-09-16"></rect>
          <rect class="day" width="12" height="12" x="-29" y="30" fill="#ebedf0" data-count="0" data-date="2019-09-17"></rect>
          <rect class="day" width="12" height="12" x="-29" y="45" fill="#ebedf0" data-count="0" data-date="2019-09-18"></rect>
          <rect class="day" width="12" height="12" x="-29" y="60" fill="#ebedf0" data-count="0" data-date="2019-09-19"></rect>
          <rect class="day" width="12" height="12" x="-29" y="75" fill="#ebedf0" data-count="0" data-date="2019-09-20"></rect>
          <rect class="day" width="12" height="12" x="-29" y="90" fill="#ebedf0" data-count="0" data-date="2019-09-21"></rect>
      </g>
      <g transform="translate(736, 0)">
          <rect class="day" width="12" height="12" x="-30" y="0" fill="#ebedf0" data-count="0" data-date="2019-09-22"></rect>
          <rect class="day" width="12" height="12" x="-30" y="15" fill="#ebedf0" data-count="0" data-date="2019-09-23"></rect>
          <rect class="day" width="12" height="12" x="-30" y="30" fill="#ebedf0" data-count="0" data-date="2019-09-24"></rect>
          <rect class="day" width="12" height="12" x="-30" y="45" fill="#ebedf0" data-count="0" data-date="2019-09-25"></rect>
          <rect class="day" width="12" height="12" x="-30" y="60" fill="#ebedf0" data-count="0" data-date="2019-09-26"></rect>
          <rect class="day" width="12" height="12" x="-30" y="75" fill="#ebedf0" data-count="0" data-date="2019-09-27"></rect>
          <rect class="day" width="12" height="12" x="-30" y="90" fill="#ebedf0" data-count="0" data-date="2019-09-28"></rect>
      </g>
      <g transform="translate(752, 0)">
          <rect class="day" width="12" height="12" x="-31" y="0" fill="#ebedf0" data-count="0" data-date="2019-09-29"></rect>
          <rect class="day" width="12" height="12" x="-31" y="15" fill="#ebedf0" data-count="0" data-date="2019-09-30"></rect>
          <rect class="day" width="12" height="12" x="-31" y="30" fill="#ebedf0" data-count="0" data-date="2019-10-01"></rect>
          <rect class="day" width="12" height="12" x="-31" y="45" fill="#ebedf0" data-count="0" data-date="2019-10-02"></rect>
          <rect class="day" width="12" height="12" x="-31" y="60" fill="#ebedf0" data-count="0" data-date="2019-10-03"></rect>
          <rect class="day" width="12" height="12" x="-31" y="75" fill="#ebedf0" data-count="0" data-date="2019-10-04"></rect>
          <rect class="day" width="12" height="12" x="-31" y="90" fill="#ebedf0" data-count="0" data-date="2019-10-05"></rect>
      </g>
      <g transform="translate(768, 0)">
          <rect class="day" width="12" height="12" x="-32" y="0" fill="#ebedf0" data-count="0" data-date="2019-10-06"></rect>
          <rect class="day" width="12" height="12" x="-32" y="15" fill="#ebedf0" data-count="0" data-date="2019-10-07"></rect>
          <rect class="day" width="12" height="12" x="-32" y="30" fill="#ebedf0" data-count="0" data-date="2019-10-08"></rect>
          <rect class="day" width="12" height="12" x="-32" y="45" fill="#ebedf0" data-count="0" data-date="2019-10-09"></rect>
          <rect class="day" width="12" height="12" x="-32" y="60" fill="#ebedf0" data-count="0" data-date="2019-10-10"></rect>
          <rect class="day" width="12" height="12" x="-32" y="75" fill="#ebedf0" data-count="0" data-date="2019-10-11"></rect>
          <rect class="day" width="12" height="12" x="-32" y="90" fill="#ebedf0" data-count="0" data-date="2019-10-12"></rect>
      </g>
      <g transform="translate(784, 0)">
          <rect class="day" width="12" height="12" x="-33" y="0" fill="#ebedf0" data-count="0" data-date="2019-10-13"></rect>
          <rect class="day" width="12" height="12" x="-33" y="15" fill="#ebedf0" data-count="0" data-date="2019-10-14"></rect>
          <rect class="day" width="12" height="12" x="-33" y="30" fill="#ebedf0" data-count="0" data-date="2019-10-15"></rect>
          <rect class="day" width="12" height="12" x="-33" y="45" fill="#c6e48b" data-count="1" data-date="2019-10-16"></rect>
          <rect class="day" width="12" height="12" x="-33" y="60" fill="#196127" data-count="13" data-date="2019-10-17"></rect>
          <rect class="day" width="12" height="12" x="-33" y="75" fill="#7bc96f" data-count="4" data-date="2019-10-18"></rect>
          <rect class="day" width="12" height="12" x="-33" y="90" fill="#ebedf0" data-count="0" data-date="2019-10-19"></rect>
      </g>
      <g transform="translate(800, 0)">
          <rect class="day" width="12" height="12" x="-34" y="0" fill="#ebedf0" data-count="0" data-date="2019-10-20"></rect>
          <rect class="day" width="12" height="12" x="-34" y="15" fill="#196127" data-count="7" data-date="2019-10-21"></rect>
          <rect class="day" width="12" height="12" x="-34" y="30" fill="#239a3b" data-count="6" data-date="2019-10-22"></rect>
          <rect class="day" width="12" height="12" x="-34" y="45" fill="#c6e48b" data-count="1" data-date="2019-10-23"></rect>
          <rect class="day" width="12" height="12" x="-34" y="60" fill="#196127" data-count="9" data-date="2019-10-24"></rect>
          <rect class="day" width="12" height="12" x="-34" y="75" fill="#ebedf0" data-count="0" data-date="2019-10-25"></rect>
          <rect class="day" width="12" height="12" x="-34" y="90" fill="#ebedf0" data-count="0" data-date="2019-10-26"></rect>
      </g>
      <g transform="translate(816, 0)">
          <rect class="day" width="12" height="12" x="-35" y="0" fill="#ebedf0" data-count="0" data-date="2019-10-27"></rect>
          <rect class="day" width="12" height="12" x="-35" y="15" fill="#7bc96f" data-count="4" data-date="2019-10-28"></rect>
          <rect class="day" width="12" height="12" x="-35" y="30" fill="#c6e48b" data-count="2" data-date="2019-10-29"></rect>
          <rect class="day" width="12" height="12" x="-35" y="45" fill="#c6e48b" data-count="2" data-date="2019-10-30"></rect>
          <rect class="day" width="12" height="12" x="-35" y="60" fill="#239a3b" data-count="5" data-date="2019-10-31"></rect>
          <rect class="day" width="12" height="12" x="-35" y="75" fill="#196127" data-count="13" data-date="2019-11-01"></rect>
          <rect class="day" width="12" height="12" x="-35" y="90" fill="#ebedf0" data-count="0" data-date="2019-11-02"></rect>
      </g>
      <g transform="translate(832, 0)">
          <rect class="day" width="12" height="12" x="-36" y="0" fill="#ebedf0" data-count="0" data-date="2019-11-03"></rect>
          <rect class="day" width="12" height="12" x="-36" y="15" fill="#7bc96f" data-count="4" data-date="2019-11-04"></rect>
          <rect class="day" width="12" height="12" x="-36" y="30" fill="#239a3b" data-count="5" data-date="2019-11-05"></rect>
          <rect class="day" width="12" height="12" x="-36" y="45" fill="#ebedf0" data-count="0" data-date="2019-11-06"></rect>
          <rect class="day" width="12" height="12" x="-36" y="60" fill="#7bc96f" data-count="4" data-date="2019-11-07"></rect>
          <rect class="day" width="12" height="12" x="-36" y="75" fill="#ebedf0" data-count="0" data-date="2019-11-08"></rect>
      </g>
      <text x="16" y="-9" class="month">Nov</text>
      <text x="76" y="-9" class="month">Dec</text>
      <text x="151" y="-9" class="month">Jan</text>
      <text x="211" y="-9" class="month">Feb</text>
      <text x="271" y="-9" class="month">Mar</text>
      <text x="346" y="-9" class="month">Apr</text>
      <text x="406" y="-9" class="month">May</text>
      <text x="466" y="-9" class="month">Jun</text>
      <text x="541" y="-9" class="month">Jul</text>
      <text x="601" y="-9" class="month">Aug</text>
      <text x="661" y="-9" class="month">Sep</text>
      <text x="736" y="-9" class="month">Oct</text>
    <text text-anchor="start" class="wday" dx="-10" dy="8" style="display: none;">Sun</text>
    <text text-anchor="start" class="wday" dx="-10" dy="25">Mon</text>
    <text text-anchor="start" class="wday" dx="-10" dy="32" style="display: none;">Tue</text>
    <text text-anchor="start" class="wday" dx="-10" dy="56">Wed</text>
    <text text-anchor="start" class="wday" dx="-10" dy="57" style="display: none;">Thu</text>
    <text text-anchor="start" class="wday" dx="-10" dy="85">Fri</text>
    <text text-anchor="start" class="wday" dx="-10" dy="81" style="display: none;">Sat</text>
</g></svg>
		</div>
		<div class="contrib-footer clearfix mt-1 mx-3 px-3 pb-1">
			<div class="float-left text-gray">
				<a href="https://help.github.com/articles/why-are-my-contributions-not-showing-up-on-my-profile" class=""> Learn how we count contributions</a>.
			</div>
			<div class="contrib-legend text-gray" title="A summary of pull requests, issues opened, and commits to the default and gh-pages branches.">
				Less
				<ul class="legend">
					<li style="background-color: #ebedf0"></li>
					<li style="background-color: #c6e48b"></li>
					<li style="background-color: #7bc96f"></li>
					<li style="background-color: #239a3b"></li>
					<li style="background-color: #196127"></li>
				</ul>
				More
			</div>
		</div>
	</div>
	

	<link rel="stylesheet" type="text/css" href="css/default.css"><style type="text/css">/*CSS*/</style></head><body><div id="chartDiv" style="max-width: 260px;height:660px;margin: 0px auto"></div><script type="text/javascript">/*
Calendar chart from CSV data file with custom smartPalette and axis ticks.
Learn how to:

  - Overwrite existing calendar axis ticks.
  - Use custom smartPalette ranges and legend entries.
*/
// JS
var weekdayLabels = 'S,M,T,W,T,F,S'.split(',');
var chart = JSC.chart('chartDiv',{
	debug:true,
	type:'horizontal calendar year solid',
	data: './resources/ozone2017.csv',
	defaultSeries:{
		legendEntry_visible:false,
		defaultPoint_tooltip:'<b>%name</b><br> %zValue PPM'
	},
	annotations:[{
		label:{
			text:'2017 Daily Max 8-hour<br>Ozone Concentration (ppm)',
			style_fontWeight:'bold'
		},
		position:'top'
	}],
	toolbar_visible: false,
	yAxis:{
		//Custom ticks are added to replace existing calendar day tick values.
		customTicks:weekdayLabels.map(function(v,i){return {value:i,label_text:v}})
	},
	palette:{
		defaultRange_legendEntry_value:'{%min:n3} - {%max:n3}',
		ranges:[
			{value:[0,.018],color:'#8ce99a'},
			{value:[.019,.036],color:'#51cf66'},
			{value:[.037,.054],color:'#37b24d'},
			{value:[.055,.059],color:'#ffff8d',legendEntry_lineAbove: true},
			{value:[.06,.065],color:'#ffff00'},
			{value:[.066,.07],color:'#ffea00'},
			{value:[.017,.075],color:'#ffd180',legendEntry_lineAbove: true},
			{value:[.076,.08],color:'#ffab40'},
			{value:[.081,.085],color:'#ff9100'},
			{value:[.086,.092],color:'#ff8a80',legendEntry_lineAbove: true},
			{value:[.093,.098],color:'#ff5252'},
			{value:[.099,.105],color:'#ff1744'},
			{value:[.106,.2],color:'#880e4f',legendEntry_lineAbove: true}
		]
	}
});</script>
</html>
</body>
</html>