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
	var unitVolume = 0;
	var unitQVolume = 0;
	var allQVolume = 0;
	var passValue = 0;
	var min = 0;
	var sec = 0;
	var setTime = 0;
	var level = parseInt("${param.testsNo}");
	function testInfo() {
		$.ajax('getTestInfo/'+level, {
			type : 'GET',
			dataType : 'JSON',
			success : function(data) {
				title = data.testsTitle;
				contents = data.testsContents;
				unitVolume = parseInt(data.testsUnitVolume);
				unitQVolume = parseInt(data.testsUnitQVolume);
				allQVolume = parseInt(data.testsAllQVolume);
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
		$.ajax('getQuestList/'+level+'/'+unitQVolume, {
			type : 'GET',
			dataType : 'JSON'
		}) // 호출 Mapping URI
		.done(function(data) {
			var oldUnit = "";
			$.each(data, function(idx) {
				var no = 1 + parseInt([idx]);
				var quest = data[idx].testsQContents;
				var ex1 = data[idx].testsQEx1;
				var ex2 = data[idx].testsQEx2;
				var ex3 = data[idx].testsQEx3;
				var ex4 = data[idx].testsQEx4;
				var vdata = [ex1,ex2,ex3,ex4];
				var vrand = randomWrite();
				var rex = [];
				var answer = data[idx].testsQAnswer;
				var newUnit = data[idx].testsQUnit;
				var caption = "";
				for (var i=0;i<vdata.length;i++) { // 보기 랜덤 배열 Push
					rex.push(vdata[vrand[i]]);
				}
				if(oldUnit != newUnit) { 
					caption = '<caption>'+newUnit+'</caption>';
				}
				oldUnit = newUnit; // 과목단위로 과목명 출력 중복방지
				console.log(oldUnit);
				var str = 
					'<table id="contentsTab" style="width:550px">'
						+caption
						+'<tr>'
							+'<td><div>'+no+'.</div></td>'
							+'<td><div>'+quest+'</div></td>'
						+'</tr>'
					+'</table>'
					+'<table id="exTab" style="width:550px">'
						+'<tr>'
							+'<td><div><input type="radio" name="questNum'+no+'" value="1">'+rex[0]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" name="questNum'+no+'" value="2">'+rex[1]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" name="questNum'+no+'" value="3">'+rex[2]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" name="questNum'+no+'" value="4">'+rex[3]+'</div></td>'
						+'</tr>'
					+'</table>';
				$('#viewerDiv').append(str);
			});
		});
	}
	
	function randomWrite() { // 보기 랜덤 배열 function
		var i = 0;
		let idx = [];
		let size = 4;
		while (i < 4) {
			let n = Math.floor(Math.random() * size);
			if (!sameNum(n)) {
				idx.push(n);
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
<body onload="testInfo()">
<div class="cbtViewer">
	<div>
		<div id="viewerDiv"></div>
	</div>
</div>
</body>
</html>