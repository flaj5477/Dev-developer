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
	<form id="frm" name="frm" action="insertProject" method="post">
		제목 <input type="text" class="form-control mb-3" id="projectTitle" name="projectTitle" placeholder="제목을 입력해주세요"> 
		
           공고 마감일  <input id="datepicker" width="276" />
           프로젝트 시작일
	프로젝트 종료일 
       <script>
        $('#datepicker').datepicker({
            uiLibrary: 'bootstrap4'
        });
    </script>
		 
		모집인원 	<select>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
				</select>
		최소참여등급 <select>
					<option>브론즈</option>
					<option>실버</option>
					<option>골드</option>
					<option>플래티넘</option>
					<option>다이아</option>
					<option>마스터</option>
				</select>
		프로젝트 타입 <select>
					<option>공모전</option>
					<option>프로젝트</option>
				</select>
		프로젝트 비용 <input type="number">
		
		<textarea class="form-control form-control-alternative" id="editor" name="editor" rows="20" placeholder="여기는 프로젝트 입력하는 곳입니다."></textarea>
		<br>
		<input type="text" class="form-control mb-3" id="projectTags" name="projectTags" placeholder="테그">
		<div class="row">
			<div class="col-xl-12  text-right">
				<button type="button" id="btnfrm" class="btn btn-primary">등록</button>
			</div>
		</div>
	</form>
	
	
</body>



</html>
