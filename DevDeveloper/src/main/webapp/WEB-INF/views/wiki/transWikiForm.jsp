<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hide{
  display: none;
}
.transEdit{
  padding: 50px;
}
</style>

<script>

	$(function(){
		deleteWiki();
		startTrans();
		hover();
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
	
	/*
		곽동우
		20191030
		번역 하기(문장클릭이벤트 번역append)
	*/
	function startTrans(){
		$('.translate').on('click', function(){
			var id = $(this).attr("id");
			
			
			//편집창 숨기고 기존문장 보이게
			$('.translate.hide').attr("class", "translate");	
			$('.transEdit.open').attr("class", "transEdit hide");	//다른곳에 편집창 열려있으면 숨김
			
			$(this).attr("class", "translate hide");	//클릭한 기존 문장 숨김
			
			
			//translate 다음 클래스 transEdit hide 를 transEdit 로만듬
			$(this).nextAll().filter(".transEdit.hide").first().attr("class", "transEdit open");	//편집창 열어줌
			//$(this+'transEdit hide').first().attr("class", "transEdit");
			
		});
	}
	
	function hover(){
		$('.translate').hover(function() {
			$(this).css("background-color", "red");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}
	


</script>
</head>
<body>
	${wiki.manualNo}<br>
	${wiki.manualTitle}<br>
	${wiki.manualContentsPath}<br>
	${wiki.manualOriUrl}<br>
	${wiki.manualTags}<br>
	<form name="frm" id="frm" action="updateWikiForm">
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
			<c:forEach var="entry" items="${transWiki}">
				<div class="translate open" id="translate${entry.key}">
					${entry.value }
				</div>
				
				<i class="ni ni-air-baloon"></i>
				<div class="transEdit hide">
					<div class="row">
						<div class="col">
							${entry.value }
							<textarea class="form-control" rows="3" placeholder="번역이필요합니다"></textarea>
							
						</div>
						<div class="col">
							다른사람이 번역한거 표시
						</div>
					</div>
				</div>
			</c:forEach>
			
			
			
		</div>
	</form>
		
		
		
</body>
</html>