<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> CBT Choice </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/comcbt.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	var readyTime;
	var curLevel = parseInt('${members.membersGrade}'); // String -> Number 변환
	
	$(document).ready(function() {
		levelBox();
		testList();
		accessEvent();		
	});

	function levelBox() {
		$('#accessBtn').css('background-color','gray');	   
		$('#cancleBtn').css('background-color','white');   	
	}
	
	function testList() { // JSON으로 tests테이블 리스트 조회
		$.ajax('getTestList', { type:'GET', dataType:'JSON'}) // 호출 Mapping URI
		.done(function(data) {
			$.each(data,function(idx,test) {
				var level = data[idx].testsLevel;
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				var force = formatDifficulty(level);
				if(curLevel < level) { // 자기보다 높은 레벨의 시험만 선택
					$('<tr>').append($('<th>').html('<input type="radio" name="testsLevel" value="'+level+'" onclick="chooseEvent()">')) // testsLevel = VO 변수명
							 .append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(force))
							 .appendTo('tbody');
				}
			});
		});
	}
	
	function chooseEvent() {
		var level = $('[name ="testsLevel"]:checked').val(); // 현재 클릭된 상태의 값을 Checked..
		var chooseGrade = formatGrade(parseInt(level)); // parseInt(String 값으로 들어오기때문에)
		var memberGrade = formatGrade(curLevel);
		$('#toast').children('p').html('Loading..');
		$('#comment').html('<p> 진행 하시려면 선택완료 버튼을 눌러주세요. </p> <br>')
					 .prepend('<br> <p> 현재등급 : '+memberGrade+'</p> <p> 합격 시 등급 : '+chooseGrade+'</p>');
		$('#accessBtn').html('선택완료')
					   .css('background-color','#81A8D6');
		clearInterval(readyTime); // radio 버튼누르면 반복실행 Clear
	}
	
	function accessEvent() {
		var interLock = false;
		$('#accessBtn').on('click',function() {
			var sec = 3; // 클릭 시, 초기화
			var level = $('[name ="testsLevel"]:checked').val();
			interLock = !interLock; // 선택 Toggle
			if(level != null && interLock == true) {
				$('#toast').fadeIn(500).delay(10,function() {
					readyTime = setInterval(function() {
						$('#toast').children('p').html(sec+'초 후 이동합니다.');
						if(sec<=0) {
							console.log('success');
							clearInterval(readyTime);
							location.replace('ready?testsLevel='+level); // 페이지 이동, 뒤로가기 하면 현재 페이지 건너 뛴다, GET
							//document.frm.submit(); // web에 name = frm인 form태그를 submit, POST
						}
						sec--;
					},1000); // n초마다
				});
			}
		});
		$('#cancleBtn').on('click',function() {
			clearInterval(readyTime); // 조건 만족 시, 반복 실행 종료
			$('#toast').stop().fadeOut(500); // setInterval 작업을 STOP()한 후에 fadeOut처리 해야 제대로 된다.
			chooseEvent(); // 버튼 한번 더 누르면 반복 Clear하고 chooseEvent로 return
		});
	}
</script>
</head>
<body>
<div class ="levelChoice" align="center">
	<div id="subject">
		<h2>난이도 선택</h2>
	</div>	
	<div id="content">
		<form action="ready" name="frm" method="post">
			<table id="chooseTab" border="1" style="width:500px">
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
	<div id="toast">
		<br><p></p><br>
		<button type="button" id="cancleBtn">선택취소</button>
	</div>
	<button type="button" id="accessBtn">선택완료</button>
</div>
</body>
</html>