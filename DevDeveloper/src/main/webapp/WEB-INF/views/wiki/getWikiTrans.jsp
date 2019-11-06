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
		deleteWiki();
		/* startTrans();
		hover();
		btnClose();
		otherTransClick(); */
	});

	/*
		위키삭제 클릭이벤트
	*/
	function deleteWiki(){
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
	}//end-deleteWiki()

</script>
</head>
<body>
	${wiki.manualNo}<br>
	${wiki.manualTitle}<br>
	${wiki.manualContentsPath}<br>
	${wiki.manualOriUrl}<br>
	${wiki.manualTags}<br>
	<form name="frm" id="frm" action="updateWikiForm" method="post">
		<input type="hidden" name="manualNo" value="${wiki.manualNo}">
	
		<div class="col">
			<div class="row align-items-center">
				<div class="col">
					<div class="ct-page-title">
			          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
			        </div>
		        </div>
		        <div class="col">
			        <div class="nav nav-pills justify-content-end">
			        	<button type="button" id="btnDelWiki" class="btn btn-danger">삭제</button>
			        	<button class="btn btn-primary">수정</button>
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