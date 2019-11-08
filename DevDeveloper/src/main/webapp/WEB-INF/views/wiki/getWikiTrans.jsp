<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="./resources/json.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.hide{
  display: none;
}
.transEdit{
  padding: 5px 5px;
  margin: 0px;
  background-color: white;
  border: 1px solid;
  border-radius: 0.25rem;
  margin-right: -10px;
  margin-left: -10px;
  margin-top: -5px;
}

.transEdit .col{
  padding: 10px;
}

.row{
  margin-right: 0px;
  margin-left: 0px;
  padding: 5px;
}

.transEdit .row > *:not(:first-child) {
  border-left: solid gray 0.5px;
}

.ni-fat-remove{
  font-size: 20px;
}
.form-control-alternative2 {
  box-shadow: 0 1px 3px rgba(50, 50, 93, 0.6), 0 1px 3px rgba(0, 0, 0, 0.4);
  border: 1px;
  transition: box-shadow .15s ease;
}

.translate {
  border-bottom: 1px solid #848484;
  padding: 30px 30px;
}

.otherTrans{
  margin: 5px;
  background-color: #f4f5f7;
  border-radius: 0.25rem;
  cursor : pointer
}

.otherTrans div{
  border : 0px;
}


</style>

<script>

	$(function(){
		btnControl();
		/* startTrans();
		hover();
		btnClose();
		otherTransClick(); */
	});

	/*
		위키 버튼 클릭이벤트
	*/
	function btnControl(){
		$('#btnDelWiki').on('click', function(){
			/* document.frm.action.value = "deleteWiki";
			document.frm.submit(); */
			var result = confirm('정말삭제?'); 
			
			if(result) { //yes 
				$("#frm").attr("action", "deleteWiki").submit();
			} else { //no 
				return;
			}
		});
		
	 	$('#btnOriWiki').on('click', function(){
			$("#frm").attr("action", "getWiki").submit();
		});
		
		$('#btnTransWiki').on('click', function(){
			$("#frm").attr("action", "transWikiForm").submit();
		});
		
		$('#btnGetTransWiki').on('click', function(){
			$("#frm").attr("action", "getWikiTrans").submit();
		});
	} //버튼이벤트 끝

</script>
</head>
<body>
	<form name="frm" id="frm" action="updateWikiForm" method="post">
		<c:if test="${sessionScope.members.membersGrade eq 5}">
			<span class="col-3 text-right">
				<button type="button" id="btnDelWiki" class="btn btn-danger">삭제</button>
				<button class="btn btn-primary">수정</button>
			</span>
		</c:if>
		${wiki.manualNo}<br>
		${wiki.manualTitle}<br>
		${wiki.manualContentsPath}<br>
		${wiki.manualOriUrl}<br>
		${wiki.manualTags}<br>
	
		<input type="hidden" name="manualNo" value="${wiki.manualNo}">
		<input type="hidden" name="manualContentsPath" value="${wiki.manualContentsPath}">
		
		<div class="nav-wrapper">
		    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text">
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0" id="btnOriWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-1" aria-selected="false"><i class="ni ni-cloud-upload-96 mr-2"></i>원문보기</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0" id="btnTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>번역하기</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0 active" id="btnGetTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-3" aria-selected="true"><i class="ni ni-calendar-grid-58 mr-2"></i>번역본보기</a>
		        </li>
		    </ul>
		</div>
		<div class="col">
			<div class="row align-items-center">
				<div class="col">
					<div class="ct-page-title">
			          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
			        </div>
		        </div>
		    </div>

			<hr>
			<%-- 위키 번역 문장 뿌려줌 --%>
			<c:forEach var="entry" items="${transWiki}">
				<p id="translate${entry.key}">
					${entry.value }
				</p>
			</c:forEach>
		</div>
	</form>
		
		
		
</body>
</html>