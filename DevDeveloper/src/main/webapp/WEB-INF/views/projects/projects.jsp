<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세 프로젝트</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<!-- Favicon -->
<link href="./resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link
	href="./resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="./resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />

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
						<div id="projContents">${project.projContents }</div><br>
						<script> //프로젝트 내용에 공백을 <br>태그로 치환해서 출력하기
						$(document).ready(function() {
							var text = $('#projContents').text();
							var result = text.replace(/(\n|\r\n)/g, "<br>");
							
							//var result = replaceAll(text,"(\r\n|\r|\n|\n\r)", "<br>");

							console.log(result);
							
							$('#projContents').html(result);
						});
						
						function replaceAll(str, searchStr, replaceStr) {
							  return str.split(searchStr).join(replaceStr);
						}
							
						</script>
					</div>

				</form>
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