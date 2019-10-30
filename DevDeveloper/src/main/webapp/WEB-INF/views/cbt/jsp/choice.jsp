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
	
	function testList() {
		$.ajax('getTestList', { type:'GET', dataType:'JSON'})
		.done(function(data) {
			$.each(data,function(idx,test) {
				var level = Number(data[idx].testsLevel);
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				if(curLevel < level) {
					var force = formatDifficulty(level);
					$('<tr>').append($('<th>').html('<input type="radio" name="test" onclick="chooseEvent('+level+')">'))
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
			sec = 3;
			var level = $('[name ="test"]:checked').val(); // 현재 클릭된 상태의 값을 Checked..
			interLock = !interLock;
			if(level != null && interLock == true) {
				$('#accessBtn').html('선택취소')
							   .css('background-color','orange');
				readyTime = setInterval(function() {
					$('#comment').html('<br> <p>'+sec+'초 후 시험이 시작됩니다. </p>');
					console.log(sec);
					if(sec<=0) {
						clearInterval(readyTime);
						console.log('success');
						location.replace('step1');
					}
					sec--;
				},1000);
			}
			else if(level != null && interLock == false){
				clearInterval(readyTime);
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
	</div>
	<div id="comment"></div>
	<button id='accessBtn' type="button"></button>
</div>
</body>
</html>