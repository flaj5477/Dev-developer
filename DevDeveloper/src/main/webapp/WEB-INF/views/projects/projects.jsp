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
<form action="./updateProjectForm" id="frm" >
	<div class="container-fluid mt--5">
		<div class="card bg-secondary shadow">
			<div class="card-header bg-white border-0">
				<div class="row align-items-center">
					<div class="col-xl-8">
					<div class="row">
						<h3 class="mb-0 pl-3 pr-3 display-3" >${project.projTitle }</h3>
						<input type="hidden" name="projTitle" value="${project.projTitle }"/>
						
						<a class="dropdown pt-2" href="#" id="navbar-default_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       <i class="fas fa-ellipsis-v fa-2x"></i> 
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
                        <button class="dropdown-item"  onclick="updateProject();">수정</button>
                        <a class="dropdown-item" href="#" onclick="deleteProject()">삭제</a>
                    </div>
                	</div>
                    
					</div>
					<div class="col-xl-4 text-right">
						<a href="./applyProjectsForm?projNo=${project.projNo}" class="btn btn-lg btn-primary">지원하기</a>
					</div>
					
				</div>
			</div>
			<div class="card-body">
				<!-- 내용 -->
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
							<div class=" ml-3 display-4" name="membersName">${project.membersName }</div>
						</div><br>
						<div class="display-4">Technologies</div>
						<div name="projTags">${project.projTags }</div><br>
						<div class="display-4">Descriptions</div>
						<div id="projContents" name="projContents">${project.projContents }</div><br>
						<script> //프로젝트 내용에 공백을 <br>태그로 치환해서 출력하기
						$(document).ready(function replaceBR() {
							var text = $('#projContents').html();
							var result = text.replace(/(\n|\r\n)/g, "<br>");
							
							//var result = replaceAll(text,"(\r\n|\r|\n|\n\r)", "<br>");
							
							$('#projContents').html(result);
						});
						
						function replaceAll(str, searchStr, replaceStr) {
							  return str.split(searchStr).join(replaceStr);
						}
							
						</script>
					</div>
			</div>
		</div>
	</div>
</form>
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
	<script>
	function deleteProject(){
	    if(confirm("삭제 하시겠습니까?")){
	        location.href = "./deleteProject?projNo=${project.projNo}";
	        return true;
	    } else {
	        return false;
	    }
	}
	</script>
	
	<script> //수정버튼 누르면 ajax로 데이터 전송
	function updateProject(){
		
		if(confirm("수정 하시겠습니까?")){
			
			console.log("이리로 들어왔는데??????");

			$('#frm').attr('action','./updateProjectForm')

			form.submit();	
			
			return false;
		} else {
		       return false;
		}
	}
	</script>
</body>

</html>