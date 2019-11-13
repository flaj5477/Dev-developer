<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Viewer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var level = parseInt("${param.testsNo}");
	var title = null;
	var contents = null;
	var unitVolume = 0;
	var questVolume = 0;
	var allocate = 0;
	var passValue = 0;
	var min = 0;
	var sec = 0;
	var permisMin = 0;
	var permisSec = 0;
	var size = 0;
	var nolist = [];
	var questkey = [];
	function testInfo() {
		$.ajax('getTestInfo/'+level, {
			type : 'GET',
			dataType : 'JSON',
			success : function(data) {
				title = data.testsTitle;
				contents = data.testsContents;
				unitVolume = parseInt(data.testsUnitVolume);
				questVolume = parseInt(data.testsQVolume);
				allocate = parseInt(questVolume/unitVolume);
				passValue = data.testsPassCriterion;
				min = data.testsTimeLimit;
				sec = min * 60;
				permisMin = parseInt(sec/60);
				permisSec = sec%60;
			},
			complete : function() {
				viewerBox();
				questList(); // 동기전송
				radioList();
				//timeCount();
				radioEvent();
				noexpEvent();
				submitEvent();
			}
		});
	}
	
	function viewerBox() {
		$('#header').prepend(title+' <br> '+contents+' <br> ${members.membersName}');
		$('#permisTime').prepend(permisMin+'분 '+permisSec+'초');
		$('#restTime').prepend(permisMin+'분 '+permisSec+'초');
	}
	
	function timeCount() {
		var setTime = 0;
		var restTime = setInterval(function() {
			var getTime = sec - setTime;
			var restMin = parseInt(getTime/60);
			var restSec = getTime%60;
			if(getTime > 0) {
				setTime++;
			}
			else {
				clearInterval(restTime);
				complete(true);
			}
			$('#restTime').html(restMin+'분 '+restSec+'초');
		},1000);
	}
	
	function questList() {
		$.ajax('getQuestList/'+level+'/'+allocate, {
			type : 'GET',
			dataType : 'JSON',
			async : false // 동기전송
		}) // 호출 Mapping URI
		.done(function(data) {
			var oldUnit = "";
			size = data.length;
			$.each(data, function(idx) {
				questkey.push(data[idx].testsQNo);
				var no = 1 + parseInt([idx]);
				var quest = data[idx].testsQContents;
				var ex1 = data[idx].testsQEx1;
				var ex2 = data[idx].testsQEx2;
				var ex3 = data[idx].testsQEx3;
				var ex4 = data[idx].testsQEx4;
				var answer = data[idx].testsQAnswer
				var vdata = [ex1,ex2,ex3,ex4]; //보기 담기
				var vrand = randomWrite(); // 4개의 숫자 랜덤 push
				var rex = []; // 랜덤하게 배열된 보기 담을 공간
				var answer = data[idx].testsQAnswer;
				var newUnit = data[idx].testsQUnit;
				var caption = '';
				for (var i=0;i<4;i++) { // 4지 선다형, 보기 랜덤 배열 Push
					rex.push(vdata[vrand[i]]); // 배열 값 랜덤 출력
				}
				if(oldUnit != newUnit) {  // 문제의 과목이 달라지는 시점
					caption = '<caption>'+newUnit+'</caption>'; // 새로운 과목을 담음
				}
				oldUnit = newUnit; // 과목단위로 과목명 출력 중복방지
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
							+'<td><div><input type="radio" data="'+no+'" name="questNum'+no+'" value="1">'+rex[0]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" data="'+no+'" name="questNum'+no+'" value="2">'+rex[1]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" data="'+no+'" name="questNum'+no+'" value="3">'+rex[2]+'</div></td>'
						+'</tr>'
						+'<tr>'
							+'<td><div><input type="radio" data="'+no+'" name="questNum'+no+'" value="4">'+rex[3]+'</div></td>'
						+'</tr>'
					+'</table>';
				$('#questView').append(str);
			});
		});
	}
	
	function radioList() {
		for(var i=1;i<=size;i++) {
			var str =
				'<div>'
					+'<label>'
					+i+'.'
					+'</label>'
					+'<span>'
						+'<input type="radio" data="'+i+'" name="putNum'+i+'" value="1">'
						+'<input type="radio" data="'+i+'" name="putNum'+i+'" value="2">'
						+'<input type="radio" data="'+i+'" name="putNum'+i+'" value="3">'
						+'<input type="radio" data="'+i+'" name="putNum'+i+'" value="4">'
					+'</span>'
				+'</div>';
			$('#putView').append(str);
		}		
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
	
	function radioEvent() { //radio Matching
		var value = null;
		var no = null;
		
		$('#questView input:radio').change(function() {
			value = $(this).val();
			no = $(this).attr('data');
			$('#putView').find('[data="'+no+'"]').val([value]);
			noexpEvent(no);
		});
		
		$('#putView input:radio').change(function() {
			value = $(this).val();
			no = $(this).attr('data');
			$('#questView').find('[data="'+no+'"]').val([value]);
			noexpEvent(no);
		});
	}
	
	function noexpEvent(no) {
		nolist[no] = true;
		$('#footer').empty();
		for(var i=1;i<=size;i++) {
			var str = 
					'<div>'
						+'<button type="button" id="explain'+i+'" value="'+i+'">'+i
					+'</div>';
			$('#footer').append(str);
			
			if(nolist[i] == true) {
				$('#explain'+i).hide();
			} 
		}
	}
	
	function submitEvent() {
		$('#submit').on('click',function() {
			complete(true);
		});
	}
	
	function complete(step) {
		var param = "";
		var marklist = [];
		if(step == true) {
			for(var i=0;i<size;i++) {
				var markobj = {
						"key" : questkey[i],
						"value" : parseInt($('[name="putNum'+i+'"]:checked').val())
				};
				marklist.push(markobj);
			}
			param = JSON.stringify(marklist);
			console.log(param);
			$.ajax({
				url:'questionMapping',
				type:'POST',
				dataType:'json',
				contentType:'application/json',
				data: param,
				success: function() {
						location.replace('process');
				}
			});
		}
	}

</script>
</head>
<body onload="testInfo()">
<div class="cbtViewer">
	<div id="header">
		<div id="permisTime"></div>
		<div id="restTime"></div>
	</div>
	<div id="content">
		<div id="questView" style="width:60%; float:left"></div>
		<div id="putView" style="width:40%; float:right"></div>
	</div>
	<div id="footer"></div>
	<div>
		<button type="button" id="submit">제출하기</button>
	</div>
</div>
</body>
</html>