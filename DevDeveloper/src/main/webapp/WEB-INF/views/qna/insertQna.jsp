<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dd</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/test.css">
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
<%-- <link href="${pageContext.request.contextPath}/resources/ckeditor/plugins/codesnippet/lib/highlight/styles/default.css" rel="stylesheet">
 --%> 
 
 
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
						<h2 class="title" style="margin: 12px 0px">질문 작성하기</h2>
						<form method="post" action="insertQna" name = "insertQna">
							<input type="hidden" name="membersNo"
								value="${sessionScope.members.membersNo}" />
							<div class="qqqalert qqqalert-secondary mb-20">
								<p style="font-size: 0.8rem">테스트</p>
							</div>
							<div class="form-group">
								<input class ="insert" type="text" name="qTitle" autofocus
									placeholder=" 제목을 입력하세요." autocomplete="off" maxlength="99"
									id="id_title" />
							</div>
							<div class="form-group">
								<textarea name="qContents" cols="40" rows="10" id="id_content" placeholder="에디터넣기">
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

								<button class="btn btn-darkblue" type="submit" id="qqqbutton">
								등록하기</button>
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
          
                CKEDITOR.replace( 'id_content' ,{height: 500, 
                	  filebrowserUploadUrl: 'qnaUpload.jsp'
                });
            </script>
	
<!-- 	<script>
		$(document).ready(function(){
		$("#qqqbutton").click(function(){
			var title = $(".qTitle").val();
			var content = $(".qContent").val();
			
			if(title==""){
				alert("제목을 입력하세요");
				//document.insertQna.qTitle.focus();
				return;
			
			}
			if(content==""){
				alert("내용을 입력하세요");
				//document.insertQna.qContent.focus();
				return;
			}
			
			document.insertQna.submit();
			}

		}

	</script> -->


</body>
</html>