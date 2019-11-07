<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wiki.manualTitle}-DD</title>
<script>

	if("${wiki.manualContentsCheck }" == 0){
		alert("접근불가!");
		history.go(-1);//첫번째 방법
		//history.back();//두번째 방법
	}
	


	$(function(){
		
		btnControl();
	});
	
	function add(){
	     
	}

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
	}

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
	
	
		<div class="nav-wrapper">
		    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0 active" id="btnOriWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="ni ni-cloud-upload-96 mr-2"></i>원문보기</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0" id="btnTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="ni ni-bell-55 mr-2"></i>번역하기</a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link mb-sm-3 mb-md-0" id="btnGetTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="ni ni-calendar-grid-58 mr-2"></i>번역본보기</a>
		        </li>
		    </ul>
		</div>
		<input type="hidden" name="manualNo" value="${wiki.manualNo}">
		<input type="hidden" name="manualContentsPath" value="${wiki.manualContentsPath}">
		<div class="col">
			<div class="row align-items-center">
				<div class="col">
					<div class="ct-page-title">
			          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
			        </div>
		        </div>
		        <div class="col">
			        <div class="nav nav-pills justify-content-end">
			        	<button type="button" id="btnGetTransWiki" class="btn btn-primary">번역본보기</button>
			        	<button type="button" id="btnTransWiki" class="btn btn-success">번역하기</button>
			        </div>
		        </div>
		    </div>
		
			<hr>
			${wiki.manualContents }
		</div>
	</form>
		
		
		
</body>
</html>