<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> CBT Ready </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$("#tabs").tabs();
		readyBox();
		testInfo();
	});
	
	history.pushState(null, null, "#noback");
	$(window).bind("hashchange", function(){
	  	history.pushState(null, null, "#noback");
	});

	function readyBox() {
		$('#subjects').css('height','55px');
		$('#content1,#content2,#content3').css({
			height:'48px',
			margin:'0 0 5px 5px'
		});
		$('#tab1').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시험 안내사항&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		$('#comment1').append('<br> <b>[시험 안내사항]</b>은 난이도 별 시험상세정보 및 시험 유의사항 안내입니다. <br><br>')
					  .append('1.시험에 응시 하면, <b>1개월</b>의 <b>유예기간</b>이 주어지며 유예기간이 지난 <br>')
					  .append('&nbsp;&nbsp;&nbsp;<b>1개월 후</b>에 <b>재 응시</b>가 가능합니다. <br>')
					  .append('2.시험이 시작 된 후, <b>강제종료</b>되면 <b>중도포기</b>로 <b>불합격</b>처리 되며 <br>')
					  .append('&nbsp;&nbsp;&nbsp;응시자 책임으로 간주합니다. <br>')
					  .append('3.<b>시간초과</b> 시, 시험이 <b>즉시종료</b>되며, 이전까지 체크된 답안으로<br>')
					  .append('&nbsp;&nbsp;&nbsp;점수를 채점합니다. <br>')
					  .append('4.<b>시험종료</b> 후, 결과는 <b>즉시</b> 나오며 결과에 따라 응시기록 및 등급이<br>')
					  .append('&nbsp;&nbsp;&nbsp;<b>자동 업데이트</b> 됩니다. <br>');
		$('#tab2').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시험 메뉴안내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		$('#comment2').append('<br> <b>[시험 메뉴안내]</b>는 응시화면에서 사용되는 <b>주요기능</b>을 소개합니다. <br><br>');
		$('#tab3').html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;시험 준비완료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
		$('#comment3').append('<br> <b>[시험준비완료]</b>버튼을 누르시면 <b>잠시 후 시험이 시작됩니다.</b><br><br>');
		$('#readyBtn').html('<h3>시험준비완료</h3>');
	}
	
	function testInfo() {
		var level = parseInt("${param.testsLevel}"); //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
		$.ajax('getTestInfo/'+level, { type:'GET', dataType:'JSON'}) // 호출 Mapping URI
		.done(function(data) {
				var title = data.testsTitle;
				var contents = data.testsContents;
				var volume = data.testsQVolume;
				var passValue = data.testsPassCriterion;
				var time = data.testsTimeLimit;
					$('<tr>').append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(volume))
							 .append($('<th>').html(passValue))
							 .append($('<th>').html(time))
							 .appendTo('tbody');
		});
	}
	
	function start() {
		console.log('success');
	}
	
</script>
</head>
<body>
<div class="ready" id="tabs" style="width:600px; left:445px">
	<ul id="subjects">
		<li id="content1"><a id="tab1" href="#tabs-1"></a></li>
		<li id="content2"><a id="tab2" href="#tabs-2"></a></li>
		<li id="content3"><a id="tab3" href="#tabs-3"></a></li>
	</ul>
	<div id="tabs-1">	
		<table id="chooseTab" border="1" style="width:550px; text-align:center">
			<thead>
				<tr align="center">
					<th>시험명</th>
					<th>상세</th>
					<th>문항수</th>
					<th>통과점수</th>
					<th>응시시간(분)</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div id="comment1"></div>
	</div>
	<div id="tabs-2">
		<p> Nice to meet you! </p>
		<div id="comment2"></div>
	</div>
	<div id="tabs-3">
		<p> Nice to meet you too! </p>
		<div id="comment3"></div>
		<div id="Toast" align="center">
			<button type="button" id="readyBtn" onclick="start()"></button>
		</div>
	</div>
</div>
</body>
</html>