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
	pageName = "프로젝트공고";
</script>
</head>

<body class="">
	<div class="container-fluid mt--3">
		<!-- Table -->
		<div class="row">
			<div class="col">

				<form name="searchfrm">
					<div class="row mb-3">
						<div class="col-xl-3 col-lg-4 col-md-8 col-sm-6 col-xs-7">
							<input class="form-control" name="searchVal" placeholder="Search" type="text">
							<input type="hidden" name="page" value="1">
							
						</div>
						<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1">
							<button class="btn btn-icon btn-2 btn-primary">
								<span class="btn-inner--icon"><i class="fas fa-search"></i></span>
							</button>
						</div>
						
						<div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-xs-12 text-right">
						<!-- 로그인 한 사람만 버튼 보이게!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<a href="insertProjectForm" class="btn btn-lg btn-primary">프로젝트 등록</a>
						</div>
					</div>
				</form>
				<div class="card shadow">
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">Project</th>
									<th scope="col">공고일</th>
									<th scope="col">마감일</th>
									<th scope="col">공고자</th>
									<th scope="col">Users</th>
									<th scope="col">Completion</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="projects" items="${list}">
									<tr>
										<td><a href="./getProjects?projNo=${projects.projNo}">${projects.projTitle }</a>
										</td>
										<td>${projects.projRegDate }</td>
										<td>${projects.projDueDate }</td>
										<td>${projects.membersNo }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<my:paging paging="${paging}" jsFunc="go_page" />
					<!-- 페이징 페이지이동 -->
					<script>
						function go_page(p) { //p번 페이지로 이동하는 함수 
							document.searchfrm.page.value = p
							document.searchfrm.submit()
						}
					</script>
				</div>
			</div>
		</div>


	</div>
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
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>