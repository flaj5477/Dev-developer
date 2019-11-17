<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Viewer</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var rid = parseInt("${testsRecordVO.testsApplyNo}");
	var user = parseInt("${members.membersNo}");
	var level = parseInt("${param.testsNo}");
	var questVolume = 0;
	var allocate = 0;
	var min = 0;
	var sec = 0;
	var permisMin = 0;
	var permisSec = 0;
	var size = 0;
	var nolist = [];
	var questKey = [];
	var offset = [];
	var setTime = 0;
	
	function getTest() {
		$.ajax('getTestInfo/'+level, {
			type : 'GET',
			dataType : 'JSON',
			success : function(data) {
				var title = data.testsTitle;
				var contents = data.testsContents;
				var unitVolume = parseInt(data.testsUnitVolume);
				questVolume = parseInt(data.testsQVolume);
				allocate = parseInt(questVolume/unitVolume);
				min = data.testsTimeLimit;
				sec = min * 60;
				permisMin = parseInt(sec/60);
				permisSec = sec%60;
				$('#header').prepend(title+' <br> '+contents+' <br> ${members.membersName}');
				$('#permisTime').prepend(permisMin+'분 '+permisSec+'초');
				$('#restTime').prepend(permisMin+'분 '+permisSec+'초');
			},
			complete : function() {
				timeCount();
				questList(); // sync
				submitEvent();
			}
		});
	}
	function timeCount() {
		var restTime = setInterval(function() {
			var getTime = sec - setTime;
			var restMin = parseInt(getTime/60);
			var restSec = getTime%60;
			$('#restTime').html(restMin+'분 '+restSec+'초');
			if(getTime > 0) {
				setTime++;
			}
			else {
				clearInterval(restTime);
				solutionProc();
			}
		},1000);
	}
	
	function questList() {
		$.ajax('getQuestList/'+level+'/'+allocate, {
			type : 'GET',
			dataType : 'JSON',
			async : false, // 동기전송
			success : function(data) {
				var oldUnit = "";
				size = data.length;
				$.each(data, function(idx) {
					questKey.push(data[idx].testsQNo);
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
						'<div id="questNo'+no+'">'
							+'<table id="contentsTab" style="width:550px">'
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
							+'</table>'
						+'</div>';
					$('#questView').append(str);
				});
			},
			complete : function() {
				switchFont();
				radioList();
				radioEvent();
				expEvent();
				focusEvent();
			}
		});
	}
	
	function switchFont() {
		var defaultSize = parseFloat($('#content').css('fontSize'),10);
		$("#switchFont").on('click','button',function() {
			var currentSize = $('#content').css('fontSize');
			var num = parseFloat(currentSize, 10);	// parseFloat()은 숫자가 아니면 숫자가 아니라는 뜻의 NaN을 반환한다. currentSize의 숫자만 반환
			var unit = currentSize.slice(-2);	// 끝에서 2자리 문자 px를 반환한다.
			
			if(this.id == "small"){
				num = defaultSize*0.8;
			} else if(this.id == "medium") {
				num = defaultSize;
			} else if(this.id == "large") {
				num = defaultSize*1.2;
			}
			$('#content').css('fontSize', num + unit);
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
			expEvent(no);
		});
		
		$('#putView input:radio').change(function() {
			value = $(this).val();
			no = $(this).attr('data');
			$('#questView').find('[data="'+no+'"]').val([value]);
			expEvent(no);
		});
	}
	
	function expEvent(no) { // 안 푼 문제, 버튼 추가 이벤트
		if(no != null) { // 리스트에 값이 있다면..
			nolist[no-1] = true; // return true;
			$('#footer').empty();		
		}
		for(var i=1;i<=size;i++) {
			var str = 
					'<div>'
						+'<button type="button" id="explain'+i+'">'+i
					+'</div>';
			$('#footer').append(str);	
			if(nolist[i-1] == true) {
				$('#explain'+i).hide();
			} 
		}
	}
	function focusEvent() { // 안 푼 문제 버튼 focus 이벤트
		$('#footer').on('click','div>button',function() { // div>button : div태그의 자식만을 지칭함(단일대상), on('click',div>button..) :  태그에 대한 부모(이벤트)위임 button이 부모가 된다.
		//현재 expEvent에서 footer에서 empty()시키기 때문에 empEvent가 두번 째 실행 될 때 기존에 있는 버튼은 사라졌으므로 focusEvent실행되고나서 클릭해도 이벤트 발생이 되지 않는다.
		// 이벤트 전파, 이벤트 위임 참고
			offset.splice(0,size); // 기존 offset 값 모두 삭제
			for(var i=1;i<=size;i++) { // offset값 push
				offset.push($('#questNo'+i).offset());
			}
			var value = parseInt($(this).text());
			$('html, body').animate({
				scrollTop:offset[value-1].top		
			},10);
		})
	}
	
	function submitEvent() { // 제출 버튼에 관한 이벤트
		$('#submitBtn').on('click',function() {
			var markcheck = markCheck();
			if(markcheck != true) { // 아직 못 푼 문제가 있다면?
				// 아직 못 푼 문제가 있다..
				// 그래도 답안 제출을 하시겠습니까?
						// BTN YES OR NO
						// if.. yes
						// 한번 더 묻기
			}
			else { // 문제를 다 풀었다면?
				// 답안을 제출 하시겠습니까?
						// BTN YES OR NO
						// if.. yes
						// 한번 더 묻기
			}
			//solutionProc();
		});
	}
	
	function markCheck() { // marking 덜 된것이 있는지 체크
		for(var i=0;i<size;i++) {
			if(nolist[i] != true) {
				return false;
			}
		}
		return true;
	}
	
	function solutionProc() { // ajax 컨트롤러로 요청
		var marklist = [];
		for(var i=1;i<=size;i++) {
			var markobj = {
					"key" : questKey[i-1],
					"value" : parseInt($('[name="putNum'+(i)+'"]:checked').val())
			};
			marklist.push(markobj);
		}
		var param = JSON.stringify({
			rid : rid,
			user : user,
			level : level,
			quest : questVolume,
			time: setTime,
			data: marklist
		});
		console.log(param);
		$.ajax({
			url:'solutionProc',
			type:'POST',
			dataType:'json',
			contentType:'application/json',
			data: param,
			success: function() {
				location.replace('processing?testsApplyNo='+rid);
			}
		});
	}
</script>
</head>
<body onload="getTest()">
<div class="cbtViewer">
	<div id="header">
		<div id="switchFont">
			<button type="button" id="small">80%</button>
			<button type="button" id="medium">100%</button>
			<button type="button" id="large">120%</button>
		</div>
		<div id="permisTime"></div>
		<div id="restTime"></div>
	</div>
	<div id="content">
		<div id="questView" style="width:60%; float:left"></div>
		<div id="putView" style="width:40%; float:right"></div>
	</div>
	<div id="footer"></div>
	<div>
		<button type="button" id="submitBtn">제출하기</button>
	</div>
</div>
</html>