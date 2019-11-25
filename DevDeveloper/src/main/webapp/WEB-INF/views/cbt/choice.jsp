<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Choice</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/comcbt.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/format.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	var grade = parseInt('${members.membersGrade}'); // String -> Number 변환
	var readyTime = null;
	
	$(document).ready(function() {
		choiceBox();
		testList();
		readyPage();		
	});

	function choiceBox() {
		$('#submitBtn').hide();
		$('#resetBtn').css('background-color','white');   	
	}
	
	function testList() { // JSON으로 tests테이블 리스트 조회
		$.ajax('getTestList', { // 호출 Mapping URI
			type:'GET',
			dataType:'JSON'
		}) 
		.done(function(data) {
			$.each(data,function(idx,test) {
				var level = data[idx].testsNo;
				var title = data[idx].testsTitle;
				var contents = data[idx].testsContents;
				var force = formatDifficulty(level);
				if(grade < level) { // 자기보다 높은 레벨의 시험만 선택
					$('<tr>').append($('<th>').html('<input type="radio" name="testsNo" value="'+level+'" onclick="chooseEvent()">')) // testsLevel = VO 변수명
							 .append($('<th>').html(title))
							 .append($('<td align="left">').html(contents))
							 .append($('<th>').html(force))
							 .appendTo('#choiceTabBody');
				}
			});
		});
	}
	
	function chooseEvent() {
		var level = $('[name ="testsNo"]:checked').val(); // 현재 클릭된 상태의 값을 Checked..
		var chooseGrade = formatGrade(parseInt(level)); // parseInt(String 값으로 들어오기때문에)
		var memberGrade = formatGrade(grade);
		$('#toast').children('p').html('Loading..');
		$('#comment').html('<p> 진행 하시려면 선택완료 버튼을 눌러주세요. </p>')
					 .prepend('<p> 현재등급 : '+memberGrade+'</p> <p> 합격 시 등급 : '+chooseGrade+'</p>');
		$('#submitBtn').show()
					   .html('선택완료');
		clearInterval(readyTime); // radio 버튼누르면 반복실행 Clear
	}
	
	function readyPage() {
		$('#submitBtn').on('click',function() {
			$(this).attr('disabled',true);
			var sec = 2; // 클릭 시, 초기화
			var level = $('[name ="testsNo"]:checked').val();
			if(level != null) {
				$('#toast').fadeIn(500).delay(10,function() {
					readyTime = setInterval(function() {
						$('#toast').children('p').html(sec+'초 후 이동합니다.');
						if(sec<=0) {
							clearInterval(readyTime);
							frm.level.value = level; // frm 태그에 레벨 값 저장
							document.frm.submit(); // web에 name = frm인 form태그를 submit, POST
							//location.replace('ready?testsNo='+level); // 페이지 이동, 뒤로가기 하면 현재 페이지 건너 뛴다, GET				
						}
						sec--;
					},300); // n초마다
				});
			}
		});
		//선택취소..
		$('#resetBtn').on('click',function() {
			$('#submitBtn').attr('disabled',false);
			clearInterval(readyTime); // 조건 만족 시, 반복 실행 종료
			$('#toast').stop().fadeOut(500); // setInterval 작업을 STOP()한 후에 fadeOut처리 해야 제대로 된다.
			chooseEvent(); // 버튼 한번 더 누르면 반복 Clear하고 chooseEvent로 return
		});
	}
</script>
</head>
<body>
<div class ="cbtChoice">
	<div id="subject">
		<p class="h1" style="color:black; line-height:0.8"><br>LEVEL CHOICE</p>
	</div>	
	<div id="content">
		<form action="ready" name="frm" method="post">
			<input type="hidden" name="level">
			<table id="chooseTab" class="table" border="1">
				<thead class="thead-dark">
					<tr>
						<th>선택</th>
						<th>시험명</th>
						<th>상세설명</th>
						<th>난이도</th>
					</tr>
				</thead>
				<tbody id="choiceTabBody"></tbody>
			</table>
		</form>
		<div id="comment" class="alert alert-secondary" role="alert">
		</div>
		<button type="button" id="submitBtn" class="btn btn-primary">선택완료</button>
	</div>
	<div id="toast">
		<br><p></p><br>
		<button type="button" id="resetBtn" class="btn btn-light">선택취소</button>
	</div>
</div>
</body>
</html>