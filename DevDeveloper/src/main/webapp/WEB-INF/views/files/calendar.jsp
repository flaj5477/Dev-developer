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
<script src='./resources/calendar/timegrid/main.js'></script>
<script src='./resources/calendar/core/locales-all.js'></script>
<script src='./resources/calendar/moment/main.js'></script>
<script src='./resources/calendar/moment/main.esm.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/af.js"></script>

<script>
	$(function(){
		getcalList();
		//calRender(data);
	})

	function getcalList(){
		 //DB데이터 가져오기
		$.ajax({
				url : 'getProjCalendarData?projNo=1',		//projNo를 값으로 넘김
				type : 'GET',		//조회 요청
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : calRender,
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			});
	}
	
	function inputData(data){ //data는 list<Map>형식임 
		console.log(data);
	
	} 
	
	//캘린더 화면에 출력
	function calRender(data){
		
		console.log(data);
		
		var calendarEl = document.getElementById('calendar');  //캘린더 아이디 가져오고
		var calendar = new FullCalendar.Calendar(calendarEl, { // 캘린더 생성
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : moment(),  //오늘 날짜
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			editable : true,
			eventLimit : true,
			eventClick: function(info){
				//showCalDetail(info);
			},
			dataClick: function(info){
				//showCalAdd(info);
			},
			droppable: true,
			events:data
		});
		calendar.render();	
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
		<form action="./excelUpload?projNo=1" id="formUpload" name="formUpload" method="post" enctype="multipart/form-data">
			<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업" accept=".xlsx"> <br>
			<br>
			<input type="submit" value="파일업로드">
		</form>
		<div id='calendar'></div>
	</div>
</body>
</html>
