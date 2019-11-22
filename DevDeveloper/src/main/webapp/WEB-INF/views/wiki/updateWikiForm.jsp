<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
<title>위키수정</title>
<style>
.ck-editor__editable {
    min-height: 400px;
    max-height: 800px;
}

.select2 {
	width:100%!important;
}

</style>
	<script>
	
		pageName = "위키가이드";
		
		var myEditor;
	
		$(function(){
			 checkForm();
			
			 
			 //tagSelectBox();	// 태그셀렉트박스
			
			 //ck에디터 생성
			 ClassicEditor
		     .create( document.querySelector( '#manualContents' ) , {
		    	// 제거 하고싶은 플러그인 (배열)
				 toolbar: [ "undo", "redo", "bold", "italic", "blockQuote", "heading",  "link", "numberedList", "bulletedList",  "insertTable" ]  //툴바설정
			 })
		     .then( editor => {
		            console.log( 'Editor was initialized', editor );
		            myEditor = editor;
		        } )
		     .catch( error => {
		         console.error( error );
		     } );
			
			 
			 $('#manualTags').select2({	//select2생성
					 placeholder: "태그 선택"
			 });
			 
		});
		
		function checkForm(){
			//var editor_val = CKEDITOR.instances.manualContents.document.getBody().getChild(0).getText() ;
			
			$("#btnfrm").on("click",function(){
				if($("#manualTitle").val() == '') {
					alert("제목을 입력해야합니다")
					return;
				} 
				else if ($("#manualTags").val() == null) {
					alert('태그를 입력 하세요');
					return false;
				}
				else if (myEditor.getData()=="") {
					alert('내용을 입력 하세요');
					myEditor.editing.view.focus()
					return false;
				}
				
				$("#frm").submit();
			});
		}
	
	</script>
</head>
	<body>
		<div class="main p-5">
			<form id="frm" name="frm" action="updateWiki" method="post">
				<input type="hidden" name="manualNo" value="${wiki.manualNo}"/>
				<input type="text" class="form-control" id="manualTitle" name="manualTitle" placeholder="제목을 입력해주세요" value="${wiki.manualTitle}">
				<input type="text" class="form-control" id="manualOriUrl" name="manualOriUrl" placeholder="url" value="${wiki.manualOriUrl}">
		  		<textarea class="form-control form-control-alternative" id="manualContents" name="manualContents" rows="20" placeholder="내용을 입력해주세요">${wiki.manualContents }</textarea>
		  		<select class="form-control" id="manualTags" name="manualTags" multiple="multiple">
		  			<c:forEach items="${tagList}" var="tag">
		  				<option>${tag.tagsTitle }</option>
		  			</c:forEach>
		  			<%--수정전 내용 가져오기 --%>
		  			<c:forEach items="${wiki.divTagList }" var="tag">	
		  				<option selected="selected">${tag}</option>
		  			</c:forEach>
		  		</select>
		  		<button type="button" id="btnfrm" class="btn btn-primary">수정</button>
			</form>
		</div>
	</body>
</html>