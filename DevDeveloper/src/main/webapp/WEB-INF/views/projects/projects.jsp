<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>상세 프로젝트</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Favicon -->
<link href="./resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />

<script>
	pageName = "프로젝트공고";
</script>

</head>
<body class="">
<div>
	<form action="./updateProjectForm" id="frm" method="post">
		<div class="container-fluid mt-5">
			<div class="card bg-secondary shadow">
				<div class="card-header bg-white border-0">
				
				
					<div class="row align-items-center">
						<div class="col-xl-10">
							<div class="row mb-3">
								<h3 class="mb-0 pl-3 pr-3 display-3">${project.projTitle }</h3>
								
								<a  style="visibility: hidden;" class="dropdown pt-2" href="#" id="navbar-default_dropdown_1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-ellipsis-v fa-2x"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
									<button class="dropdown-item" onclick="updateProject();">수정</button>
									<a class="dropdown-item" href="#" onclick="deleteProject()">삭제</a>
								</div>
							</div>
							<div class="row">
								<div class="col">
									공고 마감일: 
									<strong>${project.projDueDate }</strong>
								</div>
								<div class="col">
									근무기간:
									<strong>${project.projStartDate } ~ ${project.projEndDate }</strong>
								</div>
							</div>
							<div class="row">
								<div class="col">
									모집인원: 
									<strong>${project.projMembersCnt }명</strong>
								</div>
								<div class="col">
									최소 지원 등급: 
									<strong id="projRequire">${project.projRequire }</strong>
								</div>
							</div>
							<div class="row">
								<div class="col">
									프로젝트 타입:
									<strong>${project.projType }</strong>
								</div>
								<div class="col">
									프로젝트 예산: 
									<strong>${project.projPrice }</strong>
								</div>
							</div>
						</div>
						
						<div class="col-xl-2">
						<div class="row pr-3">

								<span class="size-100 img-rounded " data-toggle="tooltip" data-original-title="${project.membersId }" style="margin-left:auto;">
									<img src="./images/profile/${project.membersImage }" class="size-100">
								</span>

						</div>
					</div>
					</div>
					
				</div>
			
			<div class="card-body">
				<!-- 내용 -->
			<!-- 	<div class="container"> -->
					<div class="display-4">Technologies</div>
					<c:forEach var="tag" items="${project.projTagsList }">
						<span class="badge badge-default">${tag}</span>&nbsp&nbsp
					</c:forEach>
					<br>
					<div class="display-4">Descriptions</div>
					<div id="projContents" name="projContents">${project.projContents }</div>
					<br>
					<script>
						//프로젝트 내용에 공백을 <br>태그로 치환해서 출력하기
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
			<!-- 	</div> -->
			</div>
			</div>
		<div class="row mt-3">
			<div class="col text-right">
				<a href="./applyProjectsForm?projNo=${project.projNo}" class="btn btn-lg btn-primary">지원하기</a>
			</div>
		</div>
		
		<input type="hidden" name="projNo" value="${project.projNo }" /> 
		<input type="hidden" name="projTitle" value="${project.projTitle }" /> 
		<input type="hidden" name="projContents" value="<c:out value="${project.projContents }" escapeXml="true" />" />
		<input type="hidden" name="projDueDate" value="${project.projDueDate }" /> 
		<input type="hidden" name="projRequire" value="${project.projRequire }" /> 
		<input type="hidden" name="projMembersCnt" value="${project.projMembersCnt }" /> 
		<input type="hidden" name="projType" value="${project.projType }" /> 
		<input type="hidden" name="projPrice" value="${project.projPrice }" /> 
		<input type="hidden" name="projTags" value="${project.projTags }" /> 
		<input type="hidden" name="projStartDate" value="${project.projStartDate }" /> 
		<input type="hidden" name="projEndDate" value="${project.projEndDate }" />
		
	</form>
	
	</div>
	<!--   Core   -->
	<script src="./resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script src="./resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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
		function deleteProject() {
			if (confirm("삭제 하시겠습니까?")) {
				location.href = "./deleteProject?projNo=${project.projNo}";
				return true;
			} else {
				return false;
			}
		}
	</script>
	<script>
		//수정버튼 누르면 ajax로 데이터 전송
		function updateProject() {

			if (confirm("수정 하시겠습니까?")) {

				console.log("이리로 들어왔는데??????");

				$('#frm').attr('action', './updateProjectForm')

				form.submit();

				return false;
			} else {
				return false;
			}
		}
	</script>
	<script>
		$(function(){
			
			//게시자와 로그인 한 사람이 같으면 수정, 삭제 보이게 함 
			if( "${project.membersNo}" == "${loginMembersNo}" ){
				$("#navbar-default_dropdown_1").attr("style","visibility:visible")
			
			}
			
			//최소 지원등급 숫자->문자로 고치기
			var projRequire = "";
			
			switch("${project.projRequire}"){
			case "0":
				projRequire = "브론즈";
				break;
			case "1":
				projRequire = "실버";
				break;
			case "2":
				projRequire = "골드";
				break;
			case "3":
				projRequire = "플래티넘";
				break;
			case "4":
				projRequire = "다이아";
				break;
			case "5":
				projRequire = "마스터";
				break;
			}
			
			$("#projRequire").html(projRequire);
		})
	</script>
</body>
</html>