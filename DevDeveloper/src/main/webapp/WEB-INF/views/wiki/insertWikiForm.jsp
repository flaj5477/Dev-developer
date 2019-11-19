<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<title>위키등록</title>
<!-- 위 세줄 -->
<style>
.ck-editor__editable {
    min-height: 400px;
    max-height: 800px;
}
</style>
<script>
	var myEditor;

	$(function(){
		 checkForm();
		
		//에디터
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
		
		
		 
		/*  select2 초기화
		 $('select').select2(
			 ajax: {
			 	url: ,//url 주소,
			 	dataType: 'json',
			 	delay: 250,
			 	cache: true,
			 // 검색 쿼리를 만든다.
			 	data: function (params) {
			 		return {
			 		q: params.term
			 		};
			 	},
			 // 결과를 표현한다.
			 processResults: function (data) {
			 	return {
			 		results: data.results
			 	};
			 }
			},
			 placeholder: 'Search for a repository'
		 }); 
		*/
		 
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
	
<!-- textarea 넣을것 -->
	
	
	
	
</body>
</html>