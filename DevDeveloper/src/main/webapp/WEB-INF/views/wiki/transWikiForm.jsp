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
  padding: 5px 5px;
  margin: 0px;
  background-color: white;
  border: 1px solid;
  border-radius: 0.25rem;
  margin-right: -10px;
  margin-left: -10px;
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


</style>

<script>

	$(function(){
		deleteWiki();
		startTrans();
		hover();
		btnClose();
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
			
			transClose();

			
			$(this).attr("class", "translate hide");	//클릭한 기존 문장 숨김
			
			
			//translate 다음 클래스 transEdit hide 를 transEdit 로만듬
			$(this).nextAll().filter(".transEdit.hide").first().attr("class", "transEdit open");	//편집창 열어줌gfdgf
			//$(this+'transEdit hide').first().attr("class", "transEdit");
			
		});
	}
	
	/*
		곽동우
		20191031
		번역종료(편집창닫는다)
	*/
	function transClose(){
		//편집창 숨기고 기존문장 보이게
		$('.translate.hide').attr("class", "translate");	
		$('.transEdit.open').attr("class", "transEdit hide");	//다른곳에 편집창 열려있으면 숨김
	}
	
	/*
		곽동우
		20191031
		x아이콘 클릭
	*/
	function btnClose(){
		$('[name="btn-trans-close"]').on("click", function(){
			transClose();
		});
	}
	
	function hover(){
		$('.translate').hover(function() {
			$(this).css("background-color", "#f4f5f7");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}
	

	/*
		곽동우
		20191031
		위키번역 등록
	*/
	function insertWikiTrans(){
		$('#btnDelWiki').on('click', function(){
			var result = confirm('정말삭제?'); 
			if(result) { //yes 
				$("#frm").attr("action", "insertWikiTrans").submit();
			} else { //no 
				return;
			}
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
			<%-- 위키 번역 문장 뿌려줌 --%>
			<c:forEach var="entry" items="${transWiki}">
				<div class="translate open" id="translate${entry.key}">
					${entry.value }
				</div>
				
				
				<%-- 변역등록 편집기 --%>
				<div class="transEdit hide">
					<div class="row">
						<div class="col">
							<div class="row">
								<span class="badge badge-primary" id="transLine${entry.key}">
									${wiki.manualTitle}_번역_${entry.key} </span>
							</div>
							<div class="row">
								${entry.value }
							</div>
							<div class="row">	
								<textarea class="form-control form-control-alternative2"
								id="transContents" rows="3" placeholder="번역이필요합니다"></textarea>
							</div>
							<div class="row">
								<a href='javascript:void(0);' onclick="함수();" class="btn btn-sm btn-primary">번역등록</a>
								<a href='javascript:void(0);' onclick="함수();" class="btn btn-sm btn-primary">구글번역</a>
							</div>
						</div>
						<div class="col">
							<div class="row nav nav-pills justify-content-end">
								<span>
									<i name="btn-trans-close" class="ni ni-fat-remove"></i>
								</span>
							</div>
							<div class="row">
								
								<div class="col">
									다른사람 번역한거 표시
								</div>
							</div>
						
					</div>
				</div>
				</div>
				
			</c:forEach>
		</div>
	</form>
		
		
		
</body>
</html>