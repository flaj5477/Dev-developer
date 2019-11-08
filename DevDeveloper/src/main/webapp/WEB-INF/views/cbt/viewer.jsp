<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Viewer</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		testInfo();

	});
	var title;
	var contents;
	var volume;
	var passValue;
	var time;
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
				time = data.testsTimeLimit;
			},
			complete : function() {
				questList();
			}
		});
	}
	
	function questList() {
		$.ajax('getQuestList/' + level, {
			type : 'GET',
			dataType : 'JSON'
		}) // 호출 Mapping URI
		.done(function(data) {
			let rand = randomWrite(data.length);
			$.each(data, function(idx) {
				var randEx = [];
				var randIdx = 4;
				console.log(data);
				var no = 1 + parseInt([idx]);
				var quest = data[rand[idx]].testsQContents;
				var ex1 = data[rand[idx]].testsQEx1;
				var ex2 = data[rand[idx]].testsQEx2;
				var ex3 = data[rand[idx]].testsQEx3;
				var ex4 = data[rand[idx]].testsQEx4;
				var answer = data[rand[idx]].testsQAnswer;
				var unit = data[rand[idx]].testsQUnit;
				$('div').append('<p>' + no + '.' + quest + '<br> 1.' + ex1 + '<br> 2.' + ex2 + '<br> 3.' + ex3 + '<br> 4.' + ex4 + '<br>' + answer + '<br>' + unit + '</p>');
			});
		});
	}

	function randomWrite(size) {
		var i = 0;
		let idx = [];
		let set = size;
		while (i < volume) {
			let n = Math.floor(Math.random() * set);
			if (!sameNum(n)) {
				idx.push(n); // 배열에 저장
				i++;
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
<body>
	<div>
		<h2>hi!</h2>
	</div>
</body>
</html>