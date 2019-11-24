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
	pageName = "프로젝트공고";
</script>

</head>

<body class="">
	<div class="container-fluid mt-5">
		<!-- Table -->
		<div class="row">
			<div class="col">

				<form name="searchfrm">
					<div class="row mb-3">
						<div class="col-6">
							<div class="row">
								<div class="mr-auto pl-3">
    								<select name="select" class="form-control">
										<option value="title" <c:if test="${param.select == 'title'}">selected</c:if>  >제목</option>
										<option value="tags" <c:if test="${param.select == 'tags'}">selected</c:if>  >태그</option>
									</select>
								</div>
								<div class="col">
									<input class="form-control" name="searchVal" placeholder="Search" type="text">
									<input type="hidden" name="page" value="1">
								</div>
								<button class="btn btn-icon btn-2 btn-primary">
									<span class="btn-inner--icon"><i class="fas fa-search"></i></span>
								</button>
								
							</div>
							
						</div>
						
						
						<div class="ml-auto pr-3">
					
							<a href="insertProjectForm" class="btn btn-lg btn-primary mr-auto">프로젝트 등록</a>
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
									<th scope="col">마감</th> <!-- 마감일 - 오늘날짜 -->
									<th scope="col">프로젝트  기간</th>
									<th scope="col">공고자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="projects" items="${list}">
									<tr>
										<td><a class="display-4" href="./getProjects?projNo=${projects.projNo}">${projects.projTitle }</a><br>
											<c:forEach var="tag" items="${projects.projTagsList }">
												<span class="badge badge-default">${tag}</span>&nbsp&nbsp
											</c:forEach>
										</td>
										<td>${projects.projRegDate }</td>
										<td>
											<span>
												<jsp:useBean id="toDay" class="java.util.Date" />
												<fmt:parseNumber var="toDay_N" value="${toDay.time / (1000*60*60*24)}" integerOnly="true"></fmt:parseNumber>
												<fmt:parseDate var="projDueDate" value="${projects.projDueDate }" pattern="yyyy-MM-dd"></fmt:parseDate>
												<fmt:parseNumber var="projDueDate_N" value="${projDueDate.time / (1000*60*60*24)}" integerOnly="true"></fmt:parseNumber>
											  	D-${projDueDate_N - toDay_N}
											 </span>
											 <div>
												<div class="progress">
													<div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="${(projDueDate_N - toDay_N)/30*100}" aria-valuemin="0" aria-valuemax="100" style="width: ${(projDueDate_N - toDay_N)/30*100}%;"></div>
												</div>
											</div>
										</td>
										<td><fmt:parseDate var="projStartDate" value="${projects.projStartDate }" pattern="yyyy-MM-dd"></fmt:parseDate>
											<fmt:parseNumber var="projStartDate_N" value="${projStartDate.time / (1000*60*60*24)}" integerOnly="true"></fmt:parseNumber>
											<fmt:parseDate var="projEndDate" value="${projects.projEndDate }" pattern="yyyy-MM-dd"></fmt:parseDate>
											<fmt:parseNumber var="projEndDate_N" value="${projEndDate.time / (1000*60*60*24)}" integerOnly="true"></fmt:parseNumber>
											 ${projEndDate_N - projStartDate_N}일</td>
										<td><span class="avatar avatar-sm rounded-circle" data-toggle="tooltip" data-original-title="${projects.membersId }">
												<img src="./images/profile/${projects.membersImage }">
											</span></td>
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