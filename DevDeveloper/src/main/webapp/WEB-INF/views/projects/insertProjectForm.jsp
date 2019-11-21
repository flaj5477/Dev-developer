<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- ckeditor -->
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<!-- jQuery UI CSS파일  -->
<!--  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
jQuery 기본 js파일
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
jQuery UI 라이브러리 js파일
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<title>프로젝트 등록 폼</title>
<style>
.ck-editor__editable {
	min-height: 400px;
	max-height: 800px;
}
</style>
<script>
	pageName = "프로젝트 등록";
</script>
<script>
	
	 //ckeditor 커스터마이징
	var myEditor = document.querySelector( '#editor' );
	 
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
	        
	     
	    $('#projTags').select2({
	    	 placeholder: "태그 선택"
	    });
	});
	
	//폼 체크
	function checkForm(){
		
		//var editor_val = CKEDITOR.instances.editor.document.getBody().getChild(0).getText() ;
		
		$("#btnfrm").on("click",function(){
			if($("#projTitle").val() == "") {
				alert("제목을 입력해야합니다")
				return false;
			} 
			else if (myEditor.getData()=="") {
				alert('내용을 입력 하세요');
				myEditor.editing.view.focus()
				return false;
			}
			else if($("#projDueDate").val() == ""){
				alert('공고 마감일을 입력하세요')
				return false;
			}
			else if($("#projStartDate").val() == ""){
				alert('프로젝트 시작일을 입력하세요')
				return false;
			}
			else if($("#projEndDate").val() == ""){
				alert('공고 종료일을 입력하세요')
				return false;
			}
			else if($("#projTags").val() == ""){
				alert('태그를 입력하세요')
				return false;
			}
			else{
				$("#frm").submit();
			}
		});
	}
</script>
</head>
<body>
	<div class="container-fluid mt-5">
		<form id="frm" name="frm" action="insertProject" method="post" class="mb-9">
			<div class="row  mb-3">
				<div class="col">
					<label for="projTitle" class="control-label">제목</label> <input type="text" class="form-control" id="projTitle" name="projTitle" placeholder="제목을 입력해주세요">
				</div>
			</div>
			<div class="row  mb-3">
				<div class="col">
					<label for="projDueDate" class="control-label">공고 마감일 </label> <input id="projDueDate" name="projDueDate" width="276" />
				</div>
				<div class="col">
					<label for="projStartDate" class="control-label">프로젝트 시작일 </label> <input id="projStartDate" name="projStartDate" width="276" />
				</div>
				<div class="col">
					<label for="projEndDate" class="control-label">프로젝트 종료일</label> <input id="projEndDate" name="projEndDate" width="276" />
				</div>
			</div>
			
			
			<div class="row  mb-3">
				<div class="col">
					<label for="projMembersCnt" class="control-label">모집인원</label> <select id="projMembersCnt" name="projMembersCnt">
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
					<label for="projRequire" class="control-label">최소참여등급</label> <select id="projRequire" name="projRequire">
						<option value="0">브론즈</option>
						<option value="1">실버</option>
						<option value="2">골드</option>
						<option value="3">플래티넘</option>
						<option value="4">다이아</option>
						<option value="5">마스터</option>
					</select>
				</div>
				<div class="col">
					<label for="projType" class="control-label">프로젝트 타입</label> <select id="projType" name="projType">
						<option>공모전</option>
						<option>프로젝트</option>
					</select>
				</div>
				<div class="col">
					<label for="projPrice" class="control-label">프로젝트 비용(만원)</label> <input id="projPrice" name="projPrice" type="number" value=0 style="text-align: right;">
				</div>
			</div>
			<textarea class="form-control form-control-alternative" id="editor" name="projContents" rows="20" placeholder="여기는 프로젝트 입력하는 곳입니다."></textarea>
			<br> 
			<!-- <input type="text" class="form-control mb-3" id="projTags" name="projTags" placeholder="테그"> -->
			<select class="form-control mb-3" id="projTags" name="projTags" multiple="multiple">
  			<c:forEach items="${tagList}" var="tag">
  				<option>${tag.tagsTitle }</option>
  			</c:forEach>
  			</select>
			<div class="row">
				<div class="col-xl-12  text-right mt-3">
					<button type="button" id="btnfrm" class="btn btn-primary">등록</button>
				</div>
			</div>
		</form>
		<!-- Footer -->
		<footer class="footer">
			<div class="row align-items-center justify-content-xl-between">
				<div class="col-xl-6">
					<div class="copyright text-center text-xl-left text-muted">
						© 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
					</div>
				</div>
				<div class="col-xl-6">
					<ul class="nav nav-footer justify-content-center justify-content-xl-end">
						<li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
	<script> //날짜 설정 스크립트
		$(document).ready(function(){
			 // 공고 마감일
 			$('#projDueDate').datepicker({
     			uiLibrary: 'bootstrap4',
     			 format: 'yyyy-mm-dd',
     			minDate: new Date()
 			});
   	
			// 프로젝트 시작일
 			$('#projStartDate').datepicker({
     			uiLibrary: 'bootstrap4',
     			 format:  'yyyy-mm-dd',
     			 minDate: new Date(),
                 maxDate: function () {
                     return $('#projEndDate').val();
                 }
 			});
   

			//프로젝트 종료일
			$('#projEndDate').datepicker({
    			uiLibrary: 'bootstrap4',
    			 format:  'yyyy-mm-dd',
    			 minDate: function () {
    	                return $('#projStartDate').val();
    	            }
			});
			
			
	
		});    
	</script>
</body>
</html>
