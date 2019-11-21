<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CBT Viewer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/comcbt.js"></script>
<script>
	var rid = parseInt("${recvo.testsApplyNo}");
	var user = parseInt("${recvo.membersNo}");
	var userName = "${members.membersName}";
	var level = parseInt("${recvo.testsNo}");
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
				$('#title').html(title);
				$('#subTitle').html(contents);
				$('#userNo').html('${members.membersNo}');
				$('#userName').html(userName);
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
					var vrand = randomExample(); // 4개의 숫자 랜덤 push
					var rex = []; // 랜덤하게 배열된 보기 담을 공간
					var answer = data[idx].testsQAnswer;
					var newUnit = data[idx].testsQUnit;
					var caption = '';
					for (var i=0;i<4;i++) { // 4지 선다형, 보기 랜덤 배열 Push
						rex.push(vdata[vrand[i]]); // 배열 값 랜덤 출력
					}
					if(oldUnit != newUnit) {  // 문제의 과목이 달라지는 시점
						caption = '<caption style="caption-side: top">'+newUnit+'</caption>'; // 새로운 과목을 담음
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
				questEvent();
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
	
	function randomExample() { // 보기 랜덤 배열 function
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
			questEvent(no);
		});
		
		$('#putView input:radio').change(function() {
			value = $(this).val();
			no = $(this).attr('data');
			$('#questView').find('[data="'+no+'"]').val([value]);
			questEvent(no);
		});
	}
	
	function questEvent(no) { // 안 푼 문제, 버튼 추가 이벤트
		if(no != null) { // 리스트에 값이 있다면..
			nolist[no-1] = true; // return true;
			$('#noExp').empty();		
		}
		for(var i=1;i<=size;i++) {
			var str = 
					'<div>'
						+'<button type="button" id="explain'+i+'">'+i
					+'</div>';
			$('#noExp').append(str);	
			if(nolist[i-1] == true) {
				$('#explain'+i).hide();
			} 
		}
	}
	
	function focusEvent() { // 안 푼 문제 버튼 focus 이벤트
		$('#footer').on('click','div>button',function() { // div>button : div태그의 자식만을 지칭함(단일대상), on('click',div>button..) :  태그에 대한 부모(이벤트)위임 button이 부모가 된다.
		//현재 questEvent에서 footer에서 empty()시키기 때문에 empEvent가 두번 째 실행 될 때 기존에 있는 버튼은 사라졌으므로 focusEvent실행되고나서 클릭해도 이벤트 발생이 되지 않는다.
		// 이벤트 전파, 이벤트 위임 참고
			offset.splice(0,size); // 기존 offset 값 모두 삭제
			for(var i=1;i<=size;i++) { // offset값 push
				offset.push($('#questNo'+i).offset());
			}
			var value = parseInt($(this).text())-1;
			var offsetValue = offset[value]["top"];
			$('html, body').animate({
				scrollTop : offsetValue
			},10);
		})
	}
	
	function submitEvent() { // 제출 버튼에 관한 이벤트
		var flag = 0;
		var cbtViewer = $('.cbtViewer');
		var modalWindow = $('#cbtSubmitModal');
		$('#confirmBtn').on('click',function() {
			var nomark = markCheck();
			flag = 1;
			if(nomark != 0) { // 아직 못 푼 문제가 있다면?
				$('.modal-body').html('아직 '+nomark+'개의 안 푼 문제가 남아있습니다. <br> 그래도 답안을 제출 하시겠습니까?');		
			}
			else { 
				$('.modal-body').html('최종답안을 제출 하시겠습니까?');		
			}
		});
		
		$('#submitBtn').on('click',function() {
			if(flag == 1) {
				modalWindow.modal('hide');
				setTimeout(function() {
					$('.modal-body').html('정말 답안을 제출 하시겠습니까?');
					modalWindow.modal('show');
				},400);
			}
			else if(flag == -1) {
				modalWindow.modal('hide');
				cbtViewer.hide();
				setTimeout(function() {
					$('#toast').fadeIn(1000).delay(1000).fadeOut(1000,solutionProc);
				},200);
			}
			flag = flag*-1;
		});
	}
	
	function markCheck() { // marking 덜 된것이 있는지 체크
		var nomark = 0;
		for(var i=0;i<size;i++) {
			if(nolist[i] != true) {
				nomark ++;
			}
		}
		return nomark;
	}
	
	function solutionProc() { // ajax 컨트롤러로 요청
		var marklist = [];
		for(var i=1;i<=size;i++) {
			var markobj = {
					"key" : questKey[i-1],
					"value" : parseInt($('[name="putNum'+i+'"]:checked').val())
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
			success: function(response) {
				if(response.result == true) {
					frm.response.value = true;
					document.frm.submit();
				}
			}
		});
	}
</script>
<style>
div.cbtViewer #header {
	top: 3%;
	left: 5%;
	width: max;
	height: 200px;
	position: static;
}
div.cbtViewer #title {
	top: 2%;
	left: 5%;
	position: absolute;
}
div.cbtViewer #subTitle {
	top: 2%;
	left: 20%;
	position: absolute;
}
div.cbtViewer #users {
	top: 2%;
	left: 60%;
	position: absolute;
}
</style>
</head>
<body onload="getTest()">
<div class="cbtViewer">
	<div id="header">
		<div id="exam">
			<span id="title"></span>
			<span id="subTitle"></span>
		</div>
		<div id="users">
			<span id="userNo"></span>
			<span id="userName"></span>
		</div>
		<div id="putTime">
			<div id="permisTime"></div>
			<div id="restTime"></div>
		</div>
		<div id="menu">
			<div id="switchFont">
				<span><button type="button" id="small">80%</button></span>
				<span><button type="button" id="medium">100%</button></span>
				<span><button type="button" id="large">120%</button></span>
			</div>
			<div>
				<span id="allVol"></span>
				<span id="restVol"></span>
			</div>
		</div>
	</div>
	<div id="content">
		<div id="questView" style="width:60%; float:left"></div>
		<div id="putView" style="width:40%; float:right"></div>
	</div>
	<div id="footer">
		<div id="noExp">
			<button type="button" class="btn btn-light" id="noExpBtn"></button>
		</div>
		<button type="button" class="btn btn-primary" id="confirmBtn" data-toggle="modal" data-target="#cbtSubmitModal">제출하기</button>
		<!-- Modal -->
		<div class="modal fade" id="cbtSubmitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalCenterTitle">답안제출</h5>
		        <button type="button" id="closeBtn" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body"></div> <!-- Modal 내용 -->
		      <div class="modal-footer">
		      	<button type="button" id="submitBtn" class="btn btn-primary">YES</button>
		        <button type="button" id="resetBtn" class="btn btn-secondary" data-dismiss="modal">NO</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</div>
<div class="cbtProcess">
	<div id="process">
		<form action="examination" name="frm" method="POST">
			<input type="hidden" name="response"/>
			<div id="toast">
				<p> <br> 작성하신 답안을 채점중입니다. <br> 잠시만 기다려주세요. </p>
				<div class="spinner-border text-info" style="width: 4rem; height: 4rem;" role="status">
					<span class="sr-only"></span>
				</div>
			</div>
		</form>
	</div>
</div>
</html>