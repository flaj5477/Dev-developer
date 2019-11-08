<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<title>위키수정</title>
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
	위키수정페이지
		<form id="frm" name="frm" action="updateWiki" method="post">
			<input type="hidden" name="manualNo" value="${wiki.manualNo}"/>
			<input type="text" class="form-control" id="manualTitle" name="manualTitle" placeholder="등록할 제목" value="${wiki.manualTitle}">
			<input type="text" class="form-control" id="manualOriUrl" name="manualOriUrl" placeholder="참고페이지url" value="${wiki.manualOriUrl}">
	  		<textarea class="form-control form-control-alternative" id="manualContents" name="manualContents" rows="20" placeholder="문서입력">${wiki.manualContents }</textarea>
	  		<input type="text" class="form-control" id="manualTags" name="manualTags" placeholder="테그" value="${wiki.manualTags}">
	  		<button type="button" id="btnfrm" class="btn btn-primary">수정</button>
		</form>
	</body>
</html>