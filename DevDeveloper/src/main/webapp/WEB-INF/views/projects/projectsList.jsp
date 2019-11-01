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
				<div class="card shadow">
					<div class="card-header border-0">
						<h3 class="mb-0">Card tables</h3>
					</div>
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
							//			location.href = "wikihome?page=" + p
							document.searchfrm.page.value = p
							document.searchfrm.submit()
						}
					</script>
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