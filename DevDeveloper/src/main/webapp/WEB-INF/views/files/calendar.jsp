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
			//defaultDate : "2019-11-21", //오늘 날짜
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
			events : data,
			backgroundColor: 'green',
		      borderColor: 'green',
		      textColor: 'yellow'
		});
		calendar.render();
	}

	function getCal(date){ //클릭된 날짜에 해당하는 할일 가져오기
		
		 console.log(date.dateStr);
			//DB데이터 가져오기
			$.ajax({
				url : 'getToDoList?date=' + date.dateStr + "&projNo=1", //날짜 넘김
				type : 'GET', //조회 요청
				async: false,
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : makeModal,
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			});	
	}
	
	
	
	
	//성공한 데이터로 모달창에 그리기
	function makeModal(data){
		console.log(data);
		var cnt = Object.keys(data).length;
		//console.log(cnt);
		//모달이 그려지기 전에
		$("#toDoList").empty();

		$.each(data, function(idx, item) {
			
			//taskComplete 값에 따라서 체크 태그 만들기
			var check = "";
			if(item.taskComplete == "y"){
				check = "<input type='checkbox' name='check' value=" + item.taskComplete + " checked>";
			} else {
				check = "<input type='checkbox' name='check' value=" + item.taskComplete + ">";
			}
			
			$('<tr>').attr('id',item.taskNo)
					.append($('<td>').html(check))
					.append($('<td>').html(item.title))
					.append($('<td>').html(item.developerNo))
					.append($('<td>').html(item.taskComplete))
					.appendTo('#toDoList');
		})//each	
		
		
		//모달 그리기
		$('#myModal').modal();
	}
	
	
	//todolist 수정
	function updateToDoList(){
		var cnt = $("#toDoList")[0].childElementCount; //tbody의 행 갯수
		
		let list = [];
		
		
		for(i=0;i<cnt;i++){
			var obj = {};
			var task_no = parseInt( $("#toDoList").children().eq(i).attr("id") );
			var checked = $("input:checkbox[name*=check]")[i].checked == true ? 'y' : 'n'; //true->y

			obj["taskNo"] = task_no;
			obj["taskComplete"] = checked;
			
			list.push(obj);
		}
		
		console.log(list);
		
		//DB 수정
		$.ajax({
			url : "updateToDoList",
			type : 'PUT',	//등록이랑 다른부분 
			dataType : 'json',
			data : JSON.stringify(list),
			contentType : 'application/json',
			success : function(response){
				//모달 닫기
				$('#myModal').modal("hide"); 
				
  				if(response.result = true){
  					alert("총 " + response.success + "/" + response.total + "건이 처리 되었습니다.");
  				}
  			},
			error : function(xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			}
		});
		
	}
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

.fc-content .fc-title{
	color: white;
}
</style>
</head>
<body>
	<div class="container-fluid mt-5">
		
		<div class="row mb-3">
			<div style="margin:auto">
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Exel 업로드</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div id='calendar'></div>
			</div>
		</div>
		
	</div>
	
	
	<!-- Exel Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="display-4 text-primary" id="exampleModalLabel">Exel 업로드</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="./excelUpload?projNo=1" id="formUpload"
			name="formUpload" method="post" enctype="multipart/form-data">
      <div class="modal-body">
        
			<input type="file" id="fileInput" name="fileInput" value="엑셀업로드 작업"
				accept=".xlsx"> <br> <br> 
		 </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="파일업로드">
      </div>
    
   
      </form>
  </div>
</div>
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
											<th scope="col">y/n</th>
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
					<button type="button" class="btn btn-primary ml-auto" onclick="updateToDoList()">Save</button>
				</div>

			</div>
		</div>
	</div>
</body>
</html>
