<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	pageName = "Q & A";
</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/qna.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/test2.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/js/test1.js">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/js/test2.js">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/js/test3.js"> --%>
<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link href="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/styles/obsidian.css" rel="stylesheet">
 <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
 
 
	<script>
	pageName = "Q & A";
</script>
</head>
<body>
<body id = "pp">
	<div class="main-qqqcontent">
		<div class="col-xs-12">
			<div class="main-qqqcontainer">
				<div class="qqqcard qqqcard-form">
					<div class="main-qna-qqqform">
						<h2 class="title" style="margin: 12px 0px">질문 수정하기</h2>
						<form method="post" action="updateQna" name = "updateQna">
						<input type="hidden" name="qNo" value="${qna.qNo}"/>
							<div class="qqqalert qqqalert-secondary mb-20">
								<p style="font-size: 0.8rem"><img src="https://i.imgur.com/CUtuI2T.png">버튼으로 코드를 넣을 수 있습니다.</p>
							</div>
							<div class="form-group">
								<input class ="insert" type="text" name="qTitle" autofocus
									placeholder=" 제목을 입력하세요." autocomplete="off" maxlength="99"
									id="qna_title" >
							</div>
							<div class="form-group">
								<textarea name="qContents" cols="40" rows="10" id="qna_content" placeholder="에디터넣기" >
								${qna.qContents}															
</textarea>

							</div>
							
							<div class="qqrow">
								<div class="col-xs-10 tags">
									<h5 style="font-size: 12px; color: #6a737c;">태그</h5>
									<div class="bootstrap-tagsinput">
									<input class ="insert" type="text" name="tags" id="id_tags"/>
									</div>
									<input class ="insert" type="text" name="tags" id="id_tags" style="display: none;">	
								</div>
							</div>
							<div class="qqrow item" style="margin-top: 15px">

								<button class="btn qqqbutton" type="button" id="qqqbutton">
								수정하기 </button>
							</div>
						</form>
						<div class="qqrow">
							<hr class="hr-dotted" style ="border-top: 1px dotted #e4e6e8;">
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
	        <script>
          
                CKEDITOR.replace( 'qna_content' ,{height: 500, 
                	  filebrowserUploadUrl: 'qnaUpload.jsp'
                });
            </script>
            
            <script>
            	$(document).ready(function(){
			

			$("#qna_title").val('<c:out value="${qna.qTitle}"/>');
		/* 	CKEDITOR.instances.qna_content.setData(${qna.qContents})  */
			 
			 
            	})
		


			</script>
	
 	<script>
 	
	 	$(document).ready(function(){ 
		$("#qqqbutton").click(function(){
			var title = $("#qna_title").val();
			var content = CKEDITOR.instances['qna_content'].getData();
			
			if(title==""){
				alert("제목을 입력하세요");
				document.insertQna.qTitle.focus();
				return false;
			
			}
			else if(content==""){
				alert("내용을 입력하세요");
				CKEDITOR.instances['qna_content'].focus();
				return false;
			}
			
			document.updateQna.submit();
			
		 }) 
	 	})
	 	
	 	
	 	
	</script> 


</body>
</html>
