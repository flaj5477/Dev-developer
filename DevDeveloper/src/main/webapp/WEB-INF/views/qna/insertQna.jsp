<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dd</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/test.css">
	<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	<script>
	pageName = "Q & A";
</script>
</head>
<body>
<body id="qq">
	<div class="main-qqqcontent">
		<div class="col-xs-12">
			<div class="main-qqqcontainer">
				<div class="qqqcard qqqcard-form">
					<div class="main-qna-qqqform">
						<h2 class="title">질문 작성하기</h2>
						<form method="post">
							<input type='hidden' name='csrfmiddlewaretoken'
								value='3BaGTQsAQeKVf0mYREPdRBrvvxGM92lc34FLiQvUVu2CpZ2SuLszqK8hBIVG7qxD' />
							<div class="alert alert-secondary mb-20">
								<p>테스트</p>
								<p>아아아</p>
								<p>으으으</p>
							</div>
							<div class="form-group">
								<input type="text" name="title" autofocus
									placeholder="제목을 입력하세요." autocomplete="off" maxlength="99"
									id="id_title" />

							</div>
							<div class="form-group">
								<textarea name="content" cols="40" rows="10" id="id_content">
</textarea>

							</div>

							<div class="qqqrow">
								<div class="col-xs-10 tags">
									<h5>태그</h5>
									<input type="text" name="tags" id="id_tags" />
								</div>
							</div>
							<div class="row item">

								<button class="btn btn-darkblue" type="submit">작성한 질문
									등록하기</button>

							</div>
						</form>
						<div class="row">
							<hr class="hr-dotted">
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>