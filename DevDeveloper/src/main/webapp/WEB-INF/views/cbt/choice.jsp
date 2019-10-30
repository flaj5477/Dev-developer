<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Choice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script>
	var readyTime;
	var curLevel = Number('${members.membersGrade}'); // String -> Number 변환
	
	$(document).ready(function() {
		levelBox();
		testList();
		accessEvent();
	});
	
	function levelBox() {
		$('#subject').html('<h2> 난이도 선택 </h2>');
		$('#comment').html('<br>');
		$('#accessBtn').html('선택완료')
					   .css('background-color','gray');
	}
	
	function testList() { // JSON으로 tests테이블 리스트 조회
		$.ajax('getTestList', { type:'GET', dataType:'JSON'}) // 호출 Mapping URI
		.done(function(data) {
			$.each(data,function(idx,test) {
				var level = data[idx].testsLevel;
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				if(curLevel < level) { // 자기보다 높은 레벨의 시험만 선택
					var force = formatDifficulty(level);
					$('<tr>').append($('<th>').html('<input type="radio" name="testsLevel" value="'+level+'" onclick="chooseEvent('+level+')">')) // testsLevel = VO 변수명
							 .append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(force))
							 .appendTo('tbody');
				}
			});
		});
	}
	
	function chooseEvent(level) {
		var chooseGrade = formatGrade(level);
		var memberGrade = formatGrade(curLevel);
		$('#accessBtn').html('선택완료')
					   .css('background-color','#81A8D6');
		$('#comment').html('<p> 진행 하시려면 선택완료 버튼을 눌러주세요. </p>')
					 .prepend('<br> <p> 현재등급 : '+memberGrade+'</p> <p> 합격 시 등급 : '+chooseGrade+'</p>');
		clearInterval(readyTime); // radio 버튼누르면 반복실행 Clear
	}
	
	function accessEvent() {
		var sec;
		var interLock = false;
		$('#accessBtn').on('click',function() {
			sec = 3; // 클릭 시, 초기화
			var level = $('[name ="testsLevel"]:checked').val(); // 현재 클릭된 상태의 값을 Checked..
			interLock = !interLock; // 선택 Toggle
			if(level != null && interLock == true) {
				$('#accessBtn').html('선택취소')
							   .css('background-color','orange');
				readyTime = setInterval(function() {
					$('#comment').html('<br> <p>'+sec+'초 후 시험이 시작됩니다. </p>');
					if(sec<=0) {
						console.log('success');
						clearInterval(readyTime);
						document.frm.submit(); // web에 name = frm인 form태그를 submit
					}
					sec--;
				},1000); // 1초마다
			}
			else if(level != null && interLock == false){
				clearInterval(readyTime); // 조건 만족 시, 반복 실행 종료
				chooseEvent(level); // 버튼 한번 더 누르면 반복 Clear하고 chooseEvent로 return
			}
		});
	}
	
</script>
</head>
<body>
<div class ="levelChoice" align="center">
	<div id="subject"></div>	
	<div id="content">
		<form action="step1" name="frm">
			<table id="chooseTab" border="1" width="500">
				<thead>
					<tr align="center">
						<th>선택</th>
						<th>시험명</th>
						<th>상세설명</th>
						<th>난이도</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</form>
	</div>
	<div id="comment"></div>
	<button id='accessBtn' type="button"></button>
</div>
</body>
</html>