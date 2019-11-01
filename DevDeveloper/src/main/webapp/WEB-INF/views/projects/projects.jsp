<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세 프로젝트</title>
<!-- Favicon -->
<link href="../assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="../assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link
	href="../assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="../assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
</head>

<body class="">
	<div class="container-fluid mt--5">
		<div class="card bg-secondary shadow">
			<div class="card-header bg-white border-0">
				<div class="row align-items-center">
					<div class="col-8">
						<h3 class="mb-0 display-3">${project.projTitle }</h3>
					</div>
					<div class="col-4 text-right">
						<a href="./applyProjectsForm?projNo=${project.projNo }" class="btn btn-lg btn-primary">지원하기</a>
					</div>
					
					<!--  임시 파일링크  -->
					<div class="col-4 text-right">
						<a href="./getFilesList" class="btn btn-lg btn-primary">파일이동</a>
					</div>
				
				</div>
			</div>
			<div class="card-body">
				<!-- 내용 -->
				<form>
					<div class="container">
						<div class="row">
							<div>
								<a href="#" class="avatar avatar-lg" data-toggle="tooltip"
									data-original-title="Jessica Doe"> <img
									alt="Image placeholder"
									src="./resources/assets/img/theme/team-4-800x800.jpg"
									class="rounded-circle">
								</a>
							</div>
							<div class=" ml-3 display-4">${project.membersName }</div>
						</div><br>
						<div class="display-4">Technologies</div>
						<div>${project.projTags }</div><br>
						<div class="display-4">Descriptions</div>
						<div>${project.projContents }</div><br>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!--   Core   -->
	<script src="../assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="../assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="../assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>