<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CBT Ready</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cbt.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/comcbt.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	var user = "${members.membersNo}"; // 세션을 통해 가져왔음!
	var level = "${param.testsNo}"; //  command의 vo객체를 통해 form 태그의 값을 가져왔음!
	
	$(document).ready(function() {
		$('#tabs').tabs();
		readyBox();
		getTest();
		examinationPage();
	});
	
	function readyBox() {
		$('#comment1').append('<b>[시험 안내사항]</b>은 난이도 별 시험상세정보 및 시험 유의사항 안내입니다. <br><br>')
					  .append('1.시험에 응시 하면, <b>10일</b>의 <b>유예기간</b>이 주어지며 유예기간이 지난 <br>')
					  .append('&nbsp;&nbsp;&nbsp;<b>1개월 후</b>에 <b>재 응시</b>가 가능합니다. <br>')
					  .append('<br>2.시험이 시작 된 후, <b>강제종료</b>되면 <b>중도포기</b>로 <b>불합격</b>처리 되며 <br>')
					  .append('&nbsp;&nbsp;&nbsp;응시자 책임으로 간주합니다. <br>')
					  .append('<br>3.<b>시간초과</b> 시, 시험이 <b>즉시종료</b>되며, 이전까지 체크된 답안으로<br>')
					  .append('&nbsp;&nbsp;&nbsp;점수를 채점합니다. <br>')
					  .append('<br>4.<b>시험종료</b> 후, 결과는 <b>즉시</b> 나오며 결과에 따라 응시기록 및 등급이<br>')
					  .append('&nbsp;&nbsp;&nbsp;<b>자동 업데이트</b> 됩니다. <br>');
		$('#comment2').append('<br> <b>[시험 메뉴안내]</b>는 응시화면에서 사용되는 <b>주요기능</b>을 소개합니다. <br><br>');
		$('#comment3').append('<br> <b>[시험 시작하기]</b>버튼을 누르시면 <b>잠시 후 시험이 시작됩니다.</b><br><br>');
	}
	
	function getTest() {
		$.ajax('getTestInfo/'+level, {  // 호출 Mapping URI
			type:'GET',
			dataType:'JSON'
		})
		.done(function(data) {
				var title = data.testsTitle;
				var contents = data.testsContents;
				var unitVolume = data.testsUnitVolume;
				var questVolume = data.testsQVolume;
				var passValue = data.testsPassCriterion;
				var time = data.testsTimeLimit;
					$('<tr>').append($('<th>').html(title))
							 .append($('<th>').html(contents))
							 .append($('<th>').html(unitVolume))
							 .append($('<th>').html(questVolume))
							 .append($('<th>').html(passValue))
							 .append($('<th>').html(time))
							 .appendTo('#readyTabBody');
		});
	}
	
	function examinationPage() {
		var modalView = $('#cbtReadyModal');
		$('#submitBtn').on('click',function() {
			$('#readyBtn').attr('disabled',true); // 중복 클릭 방지
			modalView.modal('hide');
			frm.level.value = level;
			document.frm.submit();
		});
		
		$('#homeBtn').on('click',function() {
			location.replace('../getDashboard');
		});
	}	
	
</script>
</head>
<body>
<div class="cbtReady" id="tabs">
	<form action="examination" name="frm" method="post">
		<input type="hidden" name="level"/>
		<ul id="subjects">
			<li id="content1"><a id="tab1" href="#tabs-1">시험 안내사항</a></li>
			<li id="content2"><a id="tab2" href="#tabs-2">시험 메뉴안내</a></li>
			<li id="content3"><a id="tab3" href="#tabs-3">시험 준비완료</a></li>
		</ul>
		<div id="tabs-1">
			<table id="chooseTab" class="table" border="1">
				<thead class="thead-dark">
					<tr>
						<th>시험명</th>
						<th>상세</th>
						<th>과목수</th>
						<th>총 문항수</th>
						<th>통과점수</th>
						<th>응시시간(분)</th>
					</tr>
				</thead>
				<tbody id="readyTabBody"></tbody>
			</table>
			<div id="comment1"></div>
		</div>
		<div id="tabs-2">
			<div id="comment2"></div>
		</div>
		<div id="tabs-3">
			<div id="comment3"></div>
		<button type="button" class="btn btn-primary" id="readyBtn" data-toggle="modal" data-target="#cbtReadyModal">시험 시작하기</button>
		<!-- Modal -->
		<div class="modal fade" id="cbtReadyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title" id="exampleModalCenterTitle"><b>시험안내</b></h4>
		        <button type="button" id="closeBtn" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	시험시작을 기점으로 다음 시험까지 유예기간 <b>10일</b>이 주어집니다. <br>
		      	<b>시작</b>을 선택하면 시험화면으로 이동합니다. <br>
		      	<b>홈</b>을 선택하면 메인화면으로 이동합니다.
		      </div> <!-- Modal 내용 -->
		      <div class="modal-footer">
		      	<button type="button" id="homeBtn" class="btn btn-warning">홈으로</button>
		      	<button type="button" id="submitBtn" class="btn btn-primary">시작</button>
		        <button type="button" id="resetBtn" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
	</form>
</div>
</body>
</html>