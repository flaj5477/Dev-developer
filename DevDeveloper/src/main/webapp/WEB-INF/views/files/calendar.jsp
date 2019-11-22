<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='./resources/calendar/core/main.css' rel='stylesheet' />
<link href='./resources/calendar/daygrid/main.css' rel='stylesheet' />
<link href='./resources/calendar/timegrid/main.css' rel='stylesheet' />
<script src='./resources/calendar/core/main.js'></script>
<script src='./resources/calendar/interaction/main.js'></script>
<script src='./resources/calendar/daygrid/main.js'></script>
<script src='./resources/calendar/moment/main.js'></script>
<script src='./resources/calendar/moment-timezone/main.js'></script>
<script src='./resources/calendar/timegrid/main.js'></script>
<script src='./resources/calendar/core/locales-all.js'></script> 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script>
	$(function() {
		getcalList();
		//calRender(data);
	})

	function getcalList() {
		//DB데이터 가져오기
		$.ajax({
			url : 'getProjCalendarData?projNo=1', //projNo를 값으로 넘김
			type : 'GET', //조회 요청
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			success : calRender,
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			}
		});
	}

	function inputData(data) { //data는 list<Map>형식임 
		console.log(data);

	}

	//캘린더 화면에 출력
	function calRender(data) {

		console.log(data);

		var calendarEl = document.getElementById('calendar'); //캘린더 아이디 가져오고
		var calendar = new FullCalendar.Calendar(calendarEl, { // 캘린더 생성
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' , 'momentPlugin'],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : "2019-11-21", //오늘 날짜
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			/* select : function(arg) { //날짜 기간 선택 기능
				$('#myModal').modal();
				console.log(arg.start.dateStr);
				
			}, */
			editable : true,
			eventLimit : true,
			eventClick : function(info) {
				//showCalDetail(info);
				if(event.url) {
                    alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                    window.open(event.url);
                    return false;
                }

			},
			dateClick : function(date){ //날짜 하루
				getCal(date);
			},
			droppable : true,
			events : data
		});
		calendar.render();
	}

	function getCal(date){ //클릭된 날짜에 해당하는 할일 가져오기
		$('#myModal').modal();
		 console.log(date.dateStr);
			//DB데이터 가져오기
			$.ajax({
				url : 'getToDoList?date=' + date.dateStr, //날짜 넘김
				type : 'GET', //조회 요청
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(data){
					//성공한 데이터로 모달창에 그리기
					console.log(data);
				},
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			});
	}

	/* document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');  //캘린더 아이디 가져오고

		//$('#calendar').fullCalendar({
		var calendar = new FullCalendar.Calendar(calendarEl, { // 캘린더 생성
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : '2019-08-12',  //오늘 날짜로 수정
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,  //클릭한 날짜 
						end : arg.end,
						allDay : arg.allDay	//종일로 해서 들어감
					})
				}
				calendar.unselect()
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			// eventSources: [{
			//	url: 'getProjCalendarData?projNo=1' 
			// } ] 
	 		events : [ {
				title : 'All Day Event',
				start : '2019-08-01'
			}, {
				title : 'Long Event',
				start : '2019-08-07',
				end : '2019-08-10'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2019-08-09T16:00:00'
			}, {
				groupId : 999,
				title : 'Repeating Event',
				start : '2019-08-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2019-08-11',
				end : '2019-08-13'
			}, {
				title : 'Meeting',
				start : '2019-08-12T10:30:00',
				end : '2019-08-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2019-08-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2019-08-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2019-08-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2019-08-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2019-08-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2019-08-28'
			} ] 
		});

		calendar.render(); //캘린더 그리기
	}); */
</script>
<style>
body {
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div class="container-fluid mt-5">
		<form action="./excelUpload?projNo=1" id="formUpload"
			name="formUpload" method="post" enctype="multipart/form-data">
			<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업"
				accept=".xlsx"> <br> <br> <input type="submit"
				value="파일업로드">
		</form>
		<div id='calendar'></div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="modal-default" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered modal-"
			role="document">
			<div class="modal-content">

				<div class="modal-header bg-primary ">
					<div class="display-4 text-secondary" id="modal-title-default">To do List</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">

					<div class="table-responsive">
								<!-- Projects table -->
								<table class="table align-items-center table-flush">
									<thead class="thead-light">
										<tr>
											<th scope="col">체크</th>
											<th scope="col">할일</th>
											<th scope="col">개발자</th>
											<th scope="col">완성여부</th>
											<!-- 태그or좋아요넣기 -->
										</tr>
									</thead>
									<tbody id="toDoList">
									
								
										<tr>
											<th scope="row" class="df"><input type="checkbox" name="agree" id="chk1"></th>
											<th scope="row" class="df">공고입력</th>
											<th scope="row" class="df">10</th>
											<th scope="row" class="df">y</th>
											
										</tr>
										
									</tbody>
								</table>
							</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary">Save changes</button>
					<button type="button" class="btn btn-link  ml-auto"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
