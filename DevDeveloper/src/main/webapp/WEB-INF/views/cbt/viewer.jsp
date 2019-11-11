<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Viewer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var title = null;
	var contents = null;
	var volume = 0;
	var passValue = 0;
	var min = 0;
	var sec = 0;
	var setTime = 0;
	var level = parseInt("${param.testsNo}");
	function testInfo() {
		let idx;
		$.ajax('getTestInfo/' + level, {
			type : 'GET',
			dataType : 'JSON',
			success : function(data) {
				title = data.testsTitle;
				contents = data.testsContents;
				volume = data.testsQVolume;
				passValue = data.testsPassCriterion;
				min = data.testsTimeLimit;
				sec = min * 60;		
			},
			complete : function() {
				timeCount();
				questList();
			}
		});
	}
	
	function timeCount() {
		var restTime = setInterval(function() {
			var getTime = sec - setTime;
			var restMin = parseInt(getTime/60);
			var restSec = getTime%60;
			if(getTime > 0) {
				console.log(restMin+'분 '+restSec+'초');
				setTime++;
			}
			else {
				clearInterval(restTime);
				alert('시간초과');
			}
		},1000);
	}
	
	function questList() {
		$.ajax('getQuestList/' + level, {
			type : 'GET',
			dataType : 'JSON'
		}) // 호출 Mapping URI
		.done(function(data) {
			var rand = randomWrite(data.length);
			$.each(data, function(idx) {
				var no = 1 + parseInt([idx]);
				var quest = data[rand[idx]].testsQContents;
				var ex1 = data[rand[idx]].testsQEx1;
				var ex2 = data[rand[idx]].testsQEx2;
				var ex3 = data[rand[idx]].testsQEx3;
				var ex4 = data[rand[idx]].testsQEx4;
				var vdata = [ex1,ex2,ex3,ex4];
				var vrand = randomWrite();
				var rex = [];
				var answer = data[rand[idx]].testsQAnswer;
				var unit = data[rand[idx]].testsQUnit;
				for (var i=0;i<vdata.length;i++) {
					rex.push(vdata[vrand[i]]);
				}
				$('.cbtViewer').append('<p>' + no + '.' + quest + '<br> 1.' + rex[0] + '<br> 2.' + rex[1] + '<br> 3.' + rex[2] + '<br> 4.' + rex[3] + '<br> 정답: ' + answer + '<br>' + unit + '</p>');
			});
		});
	}

	function randomWrite(size) {
		var i = 0;
		let idx = [];
		let set = size;
		if(size != null) { // 문제 랜덤출제
			while (i < volume) {
				let n = Math.floor(Math.random() * set);
				if (!sameNum(n)) {
					idx.push(n); // 배열에 저장
					i++;
				}
			}
		}
		else { // 보기 랜덤출력
			set = 4;
			while (i < 4) {
				let n = Math.floor(Math.random() * set);
				if (!sameNum(n)) {
					idx.push(n);
					i++;
				}
			}
		}
		function sameNum(n) { // 중복제거
			for (var i = 0; i < idx.length; i++) {
				if (n === idx[i]) {
					return true;
				}
			}
			return false; // false면은 push	
		}
		return idx;
	}
	
</script>
</head>
<body onload="testInfo()">
<div class="cbtViewer">
	<div>
		<div>
			<div>
				<table>
					<caption>정보처리</caption>
					<tbody>
						<tr>
							<td><div>1.</div></td>
							<td><div>문제1</div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<table>
					<tbody>
						<tr>
							<td><div><input type="radio" name="quest1" value="1">지문1</div></td>
						</tr>
						<tr>
							<td><div><input type="radio" name="quest1" value="2">지문2</div></td>
						</tr>
						<tr>
							<td><div><input type="radio" name="quest1" value="3">지문3</div></td>
						</tr>
						<tr>
							<td><div><input type="radio" name="quest1" value="4">지문4</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>