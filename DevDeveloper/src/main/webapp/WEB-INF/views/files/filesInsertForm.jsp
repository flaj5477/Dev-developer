<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Argon Dashboard - Free Dashboard for Bootstrap 4 by
	Creative Tim</title>
<!-- Favicon -->
<link href="./resources/assets/img/brand/favicon.png" rel="icon"
	type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./resources/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="./resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="./resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
	
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>

<title>파일등록</title>

<style>
.ck-editor__editable {
	min-height: 400px;
	max-height: 800px;
}
</style>

<script>
	pageName = "새 파일";
</script>
</head>

<body class="">
	<div class="container-fluid mt--7">
		<!-- Table -->
		<div class="row">
			<div class="col">
				</br> </br> </br> </br>
				<div class="card shadow">
					<div class="card-header border-0">
						<h2 class="mb-0">프로젝트명</h2>
						<div>
							<!-- 		  <script>
						 	var route=[${filesRoute}];
						 	function prontArr(item) {
						 		document.write(item);
						 	}
						 	route.forEach(printArr);
						 </script> -->
						</div>
						<br />
						<div class="btn-card-header-group text-right">
							<div class="row">
								<div class="col-3">
									<form name="searchfrm" action="filesSearch">
										<input type="hidden" name="projNo" value='${projNo}' />
										<div class="input-group">
											<select name="select">
												<option value="title">제목
												<option value="userNo">작성자
											</select>
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="ni ni-zoom-split-in"></i></span>
											</div>
											<input class="form-control" name="searchVal"> <input
												type="hidden" name="page" value="1">
											<button>검색</button>
										</div>
									</form>
								</div>

								<%-- <!-- Modal -->
								<div class="modal fade" id="upmodal" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">파일 업로드</h5>
												<form id="fileForm" action="filesUpload" method="post"
													enctype="multipart/form-data">
													<input type="hidden" name="upperFolder"
														value="${param.upperFolder}" /> 타이틀<input type="text"
														name="filesTitle"> 코멘트<input type="text"
														name="filesComment"> <input type="file"
														value="파일 선택" name="uploadFile" /> <input type="submit"
														value="업로드" />
												</form>

												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>

											</div>
											<div class="modal-body">...</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary">Save
													changes</button>
											</div>
										</div>
									</div>
								</div> --%>

								<div class="col-9 pull-right">
									<button type="button" class="btn btn-primary btn" onclick="">등록</button>

									<button type="button" class="btn btn-primary btn" onclick="">수정</button>

									<button type="button" class="btn btn-primary btn" onclick="">삭제</button>

									<!-- <button type="button" class="btn btn-primary btn" id=""
										data-toggle="modal" data-target="#upmodal">업로드</button> -->


									<a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Ryan Tompson"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-1-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Romina Hadid"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-2-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Alexander Smith"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-3-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Jessica Doe"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-4-800x800.jpg"
										class="rounded-circle">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="table-responsive">
					<form id="frm" name="frm" action="insertWiki" method="post"> <!-- 수정~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
						<input type="text" class="form-control" id="manualTitle"
							name="manualTitle" placeholder="제목을 입력해주세요"> <input
							type="text" class="form-control" id="manualOriUrl"
							name="manualOriUrl" placeholder="url">
						<textarea class="form-control form-control-alternative"
							id="manualContents" name="manualContents" rows="20"
							placeholder="내용을 입력해주세요"></textarea>
						<input type="text" class="form-control" id="manualTags"
							name="manualTags" placeholder="테그">
						<button type="button" id="btnfrm" class="btn btn-primary">등록</button>
					</form>
				</div>
				<%-- <div class="card-footer py-4">
					<my:paging paging="${paging}" jsFunc="go_page" />
				</div> --%>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="row align-items-center justify-content-xl-between">
			<div class="col-xl-6">
				<div class="copyright text-center text-xl-left text-muted">
					&copy; 2018 <a href="https://www.creative-tim.com"
						class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
				</div>
			</div>
			<div class="col-xl-6">
				<ul
					class="nav nav-footer justify-content-center justify-content-xl-end">
					<li class="nav-item"><a href="https://www.creative-tim.com"
						class="nav-link" target="_blank">Creative Tim</a></li>
					<li class="nav-item"><a
						href="https://www.creative-tim.com/presentation" class="nav-link"
						target="_blank">About Us</a></li>
					<li class="nav-item"><a href="http://blog.creative-tim.com"
						class="nav-link" target="_blank">Blog</a></li>
					<li class="nav-item"><a
						href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md"
						class="nav-link" target="_blank">MIT License</a></li>
				</ul>
			</div>
		</div>
	</footer>

	<!--   Core   -->
	<script src="./resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="./resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

</body>

</html>