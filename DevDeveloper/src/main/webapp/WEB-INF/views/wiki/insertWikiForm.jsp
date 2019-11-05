<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link href="vendor/select2/dist/css/select2.min.css" rel="stylesheet" />
<script src="vendor/select2/dist/js/select2.min.js"></script>
<title>위키등록</title>
<style>
.ck-editor__editable {
    min-height: 400px;
}
</style>
<script>
	var myEditor;

	$(function(){
		 checkForm();
		
		
		 ClassicEditor
	     .create( document.querySelector( '#manualContents' ) , {
	    	// 제거 하고싶은 플러그인 (배열)
			 removePlugins: [ 'ImageUpload' , 'mediaEmbed']
		 })
	     .then( editor => {
	            console.log( 'Editor was initialized', editor );
	            myEditor = editor;
	        } )
	     .catch( error => {
	         console.error( error );
	     } );
		
		
		 
	});
	
	function checkForm(){
		
		//var editor_val = CKEDITOR.instances.manualContents.document.getBody().getChild(0).getText() ;
		
		$("#btnfrm").on("click",function(){
			if($("#manualTitle").val() == '') {
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
위키등록페이지
	<form id="frm" name="frm" action="insertWiki" method="post">
		<input type="text" class="form-control" id="manualTitle" name="manualTitle" placeholder="제목을 입력해주세요" >
		<input type="text" class="form-control" id="manualOriUrl" name="manualOriUrl" placeholder="url" >
  		<textarea class="form-control form-control-alternative" id="manualContents" name="manualContents" rows="20" placeholder="내용을 입력해주세요"></textarea>
  		<input type="text" class="form-control" id="manualTags" name="manualTags" placeholder="테그" >
  		<button type="button" id="btnfrm" class="btn btn-primary">등록</button>
	</form>
	

	
	
	
	
</body>
</html>