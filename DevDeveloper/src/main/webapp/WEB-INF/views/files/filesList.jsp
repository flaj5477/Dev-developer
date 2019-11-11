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

<script>
	pageName = "프로젝트 파일";

	function fImport() {
//	 uri:"./filesImport.jsp"
		$.ajax({})
	}
	
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
						<br />
						<div class="btn-card-header-group text-right">
							<div class="row">
								<div class="col-3">
									<form name="searchfrm">
										<div class="input-group">
											<select name="select">
												<option value="title">제목
												<option value="userNo">작성자
											</select>

											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="ni ni-zoom-split-in"></i></span>
											</div>
											<input class="form-control" name="searchVal">
											<!--  value=${param.searchVal } getparameter? el에서 value안에값처럼표시 -->

											<input type="hidden" name="page" value="1">
											<button>검색</button>
										</div>
									</form>
								</div>

								<!-- Modal -->
								<div class="modal fade" id="upmodal" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">파일 업로드</h5>
												<form id="fileForm" action="filesUpload" method="post" enctype="multipart/form-data">
													 <%-- <input type="hidden" name="projNo" value=${projNo }/> --%>
											
												타이틀<input type="text" name="filesTitle"> 코멘트<input type="text" name="filesComment">								
													<input type="file" value="파일 선택" name="uploadFile" />
													<input type="submit" value="업로드" />
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
								</div>

								<div class="col-9 pull-right">
									<button type="button" class="btn btn-primary btn">새폴더</button>

									<button type="button" class="btn btn-primary btn"
										onclick="location.href='filesImport' ">중요</button>
									<!-- ./import -->

									<button type="button" class="btn btn-primary btn">휴지통</button>

									<button type="button" class="btn btn-primary btn">미리보기</button>

									<button type="button" class="btn btn-primary btn" id="" 
										data-toggle="modal" data-target="#upmodal">업로드</button>

									<button type="button" class="btn btn-primary btn">다운로드</button>

									<button type="button" class="btn btn-primary btn">압축</button>

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
						<!--  여기 검색창 -->
						<!--  아래 한라인에 넣을것 -->
						<!-- <div class="ni ni-zoom-split-in"> -->

					</div>
					<!--  href="./getFiles?filesNo=${files.filesNo}">${files.filesTitle }  -->
				</div>
				<div class="table-responsive">

					<table class="table align-items-center table-flush">
						<thead class="thead-light">
							<tr>
								<th scope="col">파일명</th>
								<th scope="col">코멘트</th>
								<th scope="col">Users</th>
								<th scope="col">업데이트 날짜</th>
								<th scope="col">파일 크기</th>
							</tr>
						</thead>
						<tbody>
					<%-- 	<c:if test="${files.filesNo }">
							<a href="./getFilesList?upperFolder=${files.filesNo}">..</a>
						</c:if>
						<c:if test="${files.filesImport=='Y'}">
							<a href="./getFilesList?upperFolder=${files.filesNo}">..</a>
						</c:if> --%>
							<c:forEach var="files" items="${list}">
								<tr>
									<%-- <td><input type="checkbox" name="chk_files" value="${files.filesNo}"> --%>
									<td><c:if test="${files.filesImport=='Y'}">
											<input type="checkbox" value="${files.filesNo}"
												name="chk_files" checked>
										</c:if> <c:if test="${files.filesImport==null}">
											<input type="checkbox" value="${files.filesNo}"
												name="chk_files">
										</c:if> <%-- ${files.filesType} --%> <c:if
											test="${files.filesType=='F'}">
											<i class="far fa-file"></i>
                						${files.filesTitle}
                						 </c:if> <c:if test="${files.filesType=='D'}">
											<i class="far fa-folder"></i>
											<a href="./getFilesList?upperFolder=${files.filesNo}">${files.filesTitle}</a>
										</c:if></td>
									<!-- <input type="checkbox" name="chk_info" value="HTML">HTML -->
									<td>${files.filesComment }</td>
									<td>${files.membersNo }</td>
									<td>${files.filesUploadDate }</td>
									<td>${files.filesSize }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="card-footer py-4">
					<my:paging paging="${paging}" jsFunc="go_page" />

				</div>
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
	<script>
		function go_page(p) {
			location.href = "getFilesList?page=" + p
		}
		/*  window.TrackJS &&
		    TrackJS.install({
		      token: "ee6fab19c5a04ac1a32a645abde4613a",
		      application: "argon-dashboard-free"
		    }); */
	</script>
	<script>
		$("input[name='chk_files']").on("click", function() {
			console.log(this);

			$.ajax({
				url : "${pageContext.request.contextPath}/filesImport",
				type : "POST",
				data : {
					"filesNo" : $(this).val()
				},
				success : function(data) {
					console.log(data);
				}
			})
		});
	</script>
</body>

</html>