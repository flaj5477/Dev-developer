<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ckeditor -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<!-- jQuery UI CSS파일  -->
<!--  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
jQuery 기본 js파일
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
jQuery UI 라이브러리 js파일
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<title>프로젝트 수정 폼</title>
<style>
.ck-editor__editable {
	min-height: 400px;
	max-height: 800px;
}
</style>
<script>
	pageName = "프로젝트 수정";
</script>
<script>
	
	 //ckeditor 커스터마이징
	var myEditor;
	$(function(){
		 checkForm();
		
		 ClassicEditor
	     .create( document.querySelector( '#editor' ) , {

	    	 toolbar: [ "undo", "redo", "bold", "italic", "blockQuote", "heading",  "link", "numberedList", "bulletedList",  "insertTable" ] 
		 })
	     .then( editor => {
	    	 console.log( Array.from( editor.ui.componentFactory.names() ) );
	            //console.log( 'Editor was initialized', editor );
	            myEditor = editor;
	        } )
	});
	

	//폼 체크
	function checkForm(){
		
		//var editor_val = CKEDITOR.instances.editor.document.getBody().getChild(0).getText() ;
		
		$("#btnfrm").on("click",function(){
			if($("#projectTitle").val() == '') {
				alert("제목을 입력해야합니다")
				return;
			} 
			if (myEditor.getData()=="") {
				alert('내용을 입력 하세요');
				myEditor.editing.view.focus()
				return;
			}
			
			$("#frm").submit();
		});
	}
</script>
</head>
<body>
	<form id="frm" name="frm" action="./updateProject" method="post">
		<input type="hidden" name="projNo" value="${vo.projNo }" inputmode="numeric"/>
		<div class="row  mb-3">
			<div class="col">
				<label for="projTitle" class="control-label">제목</label> <input
					type="text" class="form-control" id="projTitle" name="projTitle"
					value="${vo.projTitle }">
			</div>
		</div>
		<div class="row  mb-3">
			<div class="col">
				<label for="projDueDate" class="control-label">공고 마감일 </label> <input
					id="projDueDate" name="projDueDate" width="276" value="${vo.projDueDate }"/>
			</div>

			<div class="col">
				<label for="projStartDate" class="control-label">프로젝트 시작일 </label> <input
					id="projStartDate" name="projStartDate" width="276" value="${vo.projStartDate }"/>
			</div>

			<div class="col">
				<label for="projEndDate" class="control-label">프로젝트 종료일</label> <input
					id="projEndDate" name="projEndDate" width="276" value="${vo.projEndDate }"/>
			</div>
		</div>
		<div class="row  mb-3">
			<div class="col">
				<label for="projMembersCnt" class="control-label">모집인원</label> 
				
				<!--//페이지 동작 시 원하는 값을 보여주
				$(document).ready(function(){

  	  				$("select option[value='010']").attr("selected", true);
				});  -->

				<select
					id="projMembersCnt" name="projMembersCnt">
					<option value="${vo.projMembersCnt }" selected hidden>${vo.projMembersCnt }</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
				</select>
			</div>
			<div class="col">
				<label for="projRequire" class="control-label">최소참여등급</label> <select
					id="projRequire" name="projRequire">
					<option value="${vo.projRequire }" selected hidden>${vo.projRequire }</option>
					<option value="0">브론즈</option>
					<option value="1">실버</option>
					<option value="2">골드</option>
					<option value="3">플래티넘</option>
					<option value="4">다이아</option>
					<option value="5">마스터</option>
				</select>
			</div>
			<div class="col">
				<label for="projType" class="control-label">프로젝트 타입</label> <select
					id="projType" name="projType">
					<option value="${vo.projType }" selected hidden>${vo.projType }</option>
					<option>공모전</option>
					<option>프로젝트</option>
				</select>
			</div>
			<div class="col">
				<label for="projPrice" class="control-label">프로젝트 비용(원)</label> <input
					id="projPrice" name="projPrice" type="number"
					value="${vo.projPrice }">
			</div>
		</div>
		<textarea class="form-control form-control-alternative" id="editor"
			name="projContents" rows="20">${vo.projContents }</textarea>
		<br> <input type="text" class="form-control mb-3" id="projTags"
			name="projTags" placeholder="테그" value="${vo.projTags }">
		<div class="row">
			<div class="col-xl-12  text-right">
				<button type="submit" id="btnfrm" class="btn btn-primary">등록</button>
			</div>
		</div>
	</form>

	<script> //날짜 설정 스크립트
		$(document).ready(function(){
			 // 공고 마감일
 			$('#projDueDate').datepicker({
     			uiLibrary: 'bootstrap4',
     			 format: 'yyyy-mm-dd'
 			});
			// 프로젝트 시작일
 			$('#projStartDate').datepicker({
     			uiLibrary: 'bootstrap4',
     			 format:  'yyyy-mm-dd'
 			});
   
			//프로젝트 종료일
			$('#projEndDate').datepicker({
    			uiLibrary: 'bootstrap4',
    			 format:  'yyyy-mm-dd'
			});
		 	
		});    
	</script>
</body>
</html>
