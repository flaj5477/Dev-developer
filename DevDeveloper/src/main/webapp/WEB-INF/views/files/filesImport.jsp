<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	pageName = "중요";
	
 	function fielsImport() {
		
		$.ajax({ type: "POST", enctype: 'multipart/form-data',
			url: 'filesImport',
			data:{filesNo: $('[name="chk_files"]:checked').val()},
			success: function (result) { 
				location.reload();
				
			},
			error: function (e) { } });
	}
 	
	function filesTrash() {
		
		$.ajax({ type: "POST",
			url: 'filesTrash',
			data:{filesNo: $('[name="chk_files"]:checked').val()},
			success: function (result) { 
				location.reload();
				
			},
			error: function (e) { } });
	}

	function filesDownload() {
		var filesNo =  $('[name="chk_files"]:checked').val(); 
		location.href="download?filesNo=" + filesNo
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
							
								<div class="col-9 pull-right">
									<button type="button" class="btn btn-primary btn" onclick="fielsImport()">중요</button>

									<button type="button" class="btn btn-primary btn" onclick="filesTrash()">휴지통</button>

									<button type="button" class="btn btn-primary btn" onclick="filesDownload()">다운로드</button>

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
							<c:forEach var="files" items="${list}">
								<tr>
									<td>
										<input type="checkbox" value="${files.filesNo}"	name="chk_files" id="chk_files">
										<%-- ${files.filesType} --%>
										<c:if test="${files.filesType=='F'}" >
										<!-- <i class="far fa-file"></i> -->
                						${files.filesTitle}
                						 </c:if> <c:if test="${files.filesType=='D'}"><i class="far fa-folder"></i>
										  <a href="./getFilesList?upperFolder=${files.filesNo}">${files.filesTitle}</a>
										</c:if>
										<span class="filesImportCheck"><c:if test="${files.filesImport=='Y'}">♥</c:if></span> <!-- 기존꺼 긁어옴 -->
									</td> <!-- <input type="checkbox" name="chk_info" value="HTML">HTML -->
									<td>${files.filesComment }</td>
									<td>${files.membersName }</td>
									<td><fmt:formatDate value="${files.filesUploadDate}" pattern="yyyy-MM-dd"/></td>
									<td><c:if	test="${files.filesType=='F'}">${files.filesSizeTrans}</c:if></td>
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
	</div>

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
</body>

</html>