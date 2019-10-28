<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위키등록</title>
<script>
	$(function(){
		checkForm();
	});
	
	function checkForm(){
		$("#btnfrm").on("click",function(){
			if($("#manualTitle").val() == ''){
				alert("제목을 입력해야합니다")
				return;
			} else if($("#manualContents").val() == ''){
				alert("내용을 입력해야합니다")
				return;
			}
			$("#frm").submit();
		});
	}

</script>
</head>
<body>
위키등록페이지
	<form id="frm" name="frm" action="insertWiki">
		<input type="text" class="form-control" id="manualTitle" name="manualTitle" placeholder="등록할 제목" >
		<input type="text" class="form-control" id="manualOriUrl" name="manualOriUrl" placeholder="참고페이지url" >
  		<textarea class="form-control form-control-alternative" id="manualContents" name="manualContents" rows="20" placeholder="문서입력"></textarea>
  		<input type="text" class="form-control" id="manualTags" name="manualTags" placeholder="테그" >
  		<button type="button" id="btnfrm" class="btn btn-primary">등록</button>
	</form>
</body>
</html>