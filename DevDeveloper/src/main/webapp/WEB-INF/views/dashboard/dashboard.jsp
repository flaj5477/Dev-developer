<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.7.1/svg.js"></script>
<script>
	pageName = "Dashboard";
</script>
<script>
<!--도트 색 표시-->
	$(document).ready(function() {
		var rect1 = $('.A').attr({
			//fill : '#196127'
			fill : '#2B0799'
		})
		var rect2 = $('.B').attr({
			//fill : '#239a3b'
			fill : '#4F0CE4'
		})
		var rect3 = $('.C').attr({
			//fill : '#7bc96f'
			fill : '#7A43F9'
		})
		var rect4 = $('.D').attr({
			//fill : '#c6e48b'
			fill : '#AC80ED'
		})
		var rect5 = $('.F').attr({
			//fill : '#ebedf0'
			fill : '#EBE3F6'
		})
	})
</script>
<style type="text/css">
<!--
출석률 표시하는거 고정크기 지정
		-->.col-fixed {
	position: relative;
	min-height: 1px;
	padding-right: 5px;
	padding-left: 5px;
	float: left;
	width: 100%;
	border: 1px solid black;
}

.col-fluid {
	position: relative;
	min-height: 1px;
	padding-right: 5px;
	padding-left: 5px;
	float: left;
	width: 100%;
	border: 1px solid black;
}

@media ( min-width : 768px) and (max-width: 991px) {
	.col-fixed {
		width: 800px;
	}
	.col-fluid {
		width: calc(100% - 
		 300px);
	}
}

@media ( min-width : 992px) and (max-width: 1199px) {
	.col-fixed {
		width: 800px;
	}
	.col-fluid {
		width: calc(100% - 
		 300px);
	}
}

@media ( min-width : 1200px) {
	.col-fixed {
		width: 800px;
	}
	.col-fluid {
		width: calc(100% - 
		 300px);
	}
}

.proj-modal:hover {
	box-shadow: 0 7px 14px rgba(50, 50, 93, .1), 0 3px 6px
		rgba(0, 0, 0, .08);
	transform: translateY(-1px);
}
</style>
</head>
<body>
	<div class="mt-7">
		<div class="header pb-8">
			<div class="container-fluid">
				<div class="header-body">
					<div class="row">
						<div class="col-xl-4 col-lg-8 col-md-6 mb-5 mb-xl-0">
							<!-- 프로필 -->
							<div class="card card-profile shadow">
								<div class="row justify-content-center">
									<div class="col-lg-3 order-lg-2">
										<div class="card-profile-image">
											<a href="#"> <img src="./images/profile/${members.membersImage}" class="rounded-circle">
											</a>
										</div>
									</div>
								</div>
								<div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									<div class="d-flex justify-content-between">
										<a href="#" class="btn btn-sm btn-info mr-4">Connect</a> <a href="#" class="btn btn-sm btn-default float-right">Message</a>
									</div>
								</div>
								<div class="card-body pt-0 pt-md-4 mt-5">
									<div class="text-center">
										<div class="row justify-content-center">
											<div class="col-2 align-self-center">
												<img src="./images/grade/2.png" width="70px">
											</div>
											<div class="col-3 justify-content-center">
												<h2>${members.membersName}</h2>
												<div class="h4 font-weight-300">${members.membersId}</div>
											</div>
										</div>
										<div class="h5 mt-4">
											<i class="fas fa-map-marker-alt"></i> ${members.membersAddr}
										</div>
										<div>
											<i class="fas fa-envelope"></i> ${members.membersMail}
										</div>
										<hr class="my-4">
										<!-- 출석률 도트 -->
										<div id="drawing" class="align-self-center">
											<svg class=" col-fixed" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="100%" height="84">
												<c:forEach var="activityLog" items="${activityLogList}" varStatus="status">
													<c:if test="${status.index % 7 == 0 }">
														<!-- 일요일이면 g태그 열기 -->
														<g transform="translate(<fmt:formatNumber value="
															${status.index/7*10}" pattern="#" />, 0)">

													
													
													
													
													
													
													
													</c:if>
													<!-- col-fixed 의 width인 620에 대한 % -->
													<rect width="1%" height="10%" class="${activityLog.activityScore }" x="0" y="${status.index%7*14 }"></rect>
													<c:if test="${status.index % 7 == 6 }">
														<!-- 토요일이면 g태그 닫기 -->
														</g>
													</c:if>
												</c:forEach>
											</svg>
										</div>
										<a href="#">Show more</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col col-xl-8 col-lg-4 col-md-6">
							<!-- 프로젝트 상태 카드 -->
							<div class="row">
								<div class="col-xl-3 col-lg-12">
									<a data-toggle="modal" data-target="#projectModal"> <!-- 모달 창 걸기 -->
										<div class="card card-stats mb-4 mb-xl-0">
											<div class="card-body proj-modal">
												<div class="row">
													<div class="col">
														<h5 class="card-title text-uppercase text-muted mb-0">
															프로젝트 <span class="proj_status">지원</span>
														</h5>
														<span class="h2 font-weight-bold mb-0">${projApply } </span>
													</div>
													<div class="col-auto">
														<div class="icon icon-shape bg-warning text-white rounded-circle shadow">
															<i class="fas fa-chart-pie"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-xl-3 col-lg-12">
									<a data-toggle="modal" data-target="#projectModal">
										<div class="card card-stats mb-4 mb-xl-0">
											<div class="card-body proj-modal">
												<div class="row">
													<div class="col">
														<h5 class="card-title text-uppercase text-muted mb-0">
															프로젝트 <span class="proj_status">승인</span>
														</h5>
														<span class="h2 font-weight-bold mb-0">${projApprove}</span>
													</div>
													<div class="col-auto">
														<div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
															<i class="fas fa-users"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-xl-3 col-lg-12">
									<a data-toggle="modal" data-target="#projectModal">
										<div class="card card-stats mb-4 mb-xl-0">
											<div class="card-body proj-modal">
												<div class="row">
													<div class="col">
														<h5 class="card-title text-uppercase text-muted mb-0">
															프로젝트 <span class="proj_status">참여</span>
														</h5>
														<span class="h2 font-weight-bold mb-0">${projParticipant}</span>
													</div>
													<div class="col-auto">
														<div class="icon icon-shape bg-info text-white rounded-circle shadow">
															<i class="fas fa-percent"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-xl-3 col-lg-12">
									<a data-toggle="modal" data-target="#projectModal">
										<div class="card card-stats mb-4 mb-xl-0">
											<div class="card-body proj-modal">
												<div class="row">
													<div class="col">
														<h5 class="card-title text-uppercase text-muted mb-0">
															프로젝트 <span class="proj_status">완료</span>
														</h5>
														<span class="h2 font-weight-bold mb-0">0</span>
													</div>
													<div class="col-auto">
														<div class="icon icon-shape bg-warning text-white rounded-circle shadow">
															<i class="fas fa-chart-pie"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
							</div>
							<div class="row  mb-4 mt-3">
								<div class="col-xl-12 col-lg-15">
									<div class="card bg-gradient-default shadow">
										<div class="card-header bg-transparent border-0">
											<div class="row align-items-center">
												<div class="col">
													<h3 class="text-white mb-0">프로젝트 관리</h3>
												</div>
												<div class="col text-right">
													<button type="button" class="btn btn-primary">파일 관리</button>
												</div>
											</div>
										</div>
										<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
											<ol class="carousel-indicators">
												<c:forEach var="myProject" items="${myProjectsList}" varStatus="status">
													<c:choose>
														<c:when test="${status.index == 0}">
															<li data-target="#carouselExampleIndicators" data-slide-to="${status.index }" class="active"></li>
														</c:when>
														<c:otherwise>
															<li data-target="#carouselExampleIndicators" data-slide-to="${status.index }"></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</ol>
											<div class="carousel-inner">
												<c:forEach var="myProject" items="${myProjectsList}" varStatus="status">
													<c:choose>
														<c:when test="${status.index == 0}">
															<div class="carousel-item pl-5 pr-5 active" id="${myProject.projNo }">
														</c:when>
														<c:otherwise>
															<div class="carousel-item pl-5 pr-5" id="${myProject.projNo }">
														</c:otherwise>
													</c:choose>
													<div class="table-responsive">
														<table class="table align-items-center table-flush table-dark">
															<caption class="mt--3" style="caption-side: top;" id="${myProject.projNo }${myProject.projTitle}">${myProject.projTitle}</caption>
															<thead class="thead-dark text-light">
																<tr>
																	<th scope="col" class="text-light">지원자 번호</th>
																	<th scope="col" class="text-light">이름</th>
																	<th scope="col" class="text-light">지원상태</th>
																	<th scope="col" class="text-light">진척률</th>
																	<th scope="col" class="text-light"></th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="projApplicant" items="${projApplicantsList}">
																	<c:if test="${projApplicant.projNo == myProject.projNo }">
																		<tr>
																			<input type="hidden" value="${projApplicant.applyNo }"/>
																			<th scope="row">${projApplicant.membersNo }</th>
																			<td>${projApplicant.participantName }</td>
																			<td>${projApplicant.status }</td>
																			<td>
																				<div class="d-flex align-items-center">
																					<span class="mr-2">60%</span>
																					<div>
																						<div class="progress">
																							<div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
																						</div>
																					</div>
																				</div>
																			</td>
																			<td>
																				<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#projApplyModal" id="${projApplicant.applyNo }">보기버튼</button>
																			</td>
																		</tr>
																	</c:if>
																</c:forEach>
															</tbody>
														</table>
													</div>
											</div>
											</c:forEach>
										</div>
										<!-- div짝이 안맞는건 div 여는 태그가 c:choose문 안에 있어서 그럼 -->
										<br> <br> <br>
									</div>
									<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
									</a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
									</a>
								</div>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">응시기록 열람</button>
							<!-- Modal --> 
							<div id="#recModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-lg">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalCenterTitle">${members.membersName}님의 응시기록</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <jsp:include page="../cbt/record.jsp"></jsp:include>
							      </div>
							    </div>
							  </div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Card stats 여기 프로젝트 카드 있던 곳-->
		<div class="row"></div>
	</div>
	</div>
	</div>
<<<<<<< HEAD
	<!-- 프로젝트 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로젝트</h5>
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close modal-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mt--4">
					<table class="table align-items-center table-flush text-center">
						<thead class="thead-light">
							<tr>
								<th>프로젝트 이름</th>
								<th>버튼</th>
							</tr>
						</thead>
						<tbody id="tbody">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modal-close" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 제어 스크립트 (데이터 담기) -->
	<script>
	$('#recModal').on('hidden.bs.modal', function () {
			$('.modal-body').remove();
		})
		
		$('#exampleModal').on('show.bs.modal', function(event) {
			//프로젝트 지원, 프로젝트 승인, 프로젝트 참여 상태의 테이블을 만들어서 보여줘야함
			var button = $(event.relatedTarget) // Button that triggered the modal
			var status = button.find(".proj_status").html();
			var ajaxRow = "";

			console.log(status);
			$.ajax({
				url : "getProjStatusDetail/" + status,
				type : 'GET',
				dataType : 'json',
				async : false, //동기화 방식으로 해야 데이터를 다 받아 온 후에 실행한다.
				/* data : JSON.stringify({
					status : encodeURI(status)
				}), */
				contentType : 'application/json;charset=utf-8',
				success : function(data) { //데이터 받아오기 성공하면 
					//테이블 생성
					console.log(data.length);
					console.log(data[0].projTitle);

					for (i = 0; i < data.length; i++) {
						//이부분 함수로 만들어서 status가 지원일때, 승인일때, 참여일때, 버튼과 클릭이벤트 따로 주기
						ajaxRow += CreateTableRow(status, data);

						/* 
						"<tr id=" + data[i].projNo + ">"
							+ "<td>"
							+ data[i].projTitle
							+ "</td>"
							+ "<td>"
							+ "<button type=\"button\" class=\"btn btn-default\">지원 취소</button>"
							+ "</td>" + "</tr>"; */
					}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});

			//모달 띄우기
			var modal = $(this);
			$(this).find("#exampleModalLabel").html(status);
			$(this).find("#tbody").append(ajaxRow); //여기서 모달을 다시 띄우면 그 전에 열었던 모달창에 더 추가된다. 정보가 계속 누적됨;;;
		});

		//status 별로 다른 테이블 값 생성
		function CreateTableRow(status, data) {
			var row = "";
			if (status == "지원") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './deleteApply?applyNo="
						+ data[i].applyNo + "' \">지원 취소</button>" + "</td>"
						+ "</tr>";
			} else if (status == "승인") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './updateApplyParticipantIn?applyNo="
						+ data[i].applyNo + "' \">승인 확인</button>" + "</td>"
						+ "</tr>";
			} else if (status == "참여") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './moveToFileList?projNo="
						+ data[i].projNo + "' \">파일 관리</button>" + "</td>"
						+ "</tr>";
			} else if (status == "완료") {

			} else if (status == "관리") {

			}
			return row;
		}

		//모달 닫기
		$('#exampleModal').on('hide.bs.modal', function(e) {

			$("#tbody").html("");

			e.stopImmediatePropagation();

		});
	</script>
=======
>>>>>>> branch 'master' of https://github.com/flaj5477/Dev-developer.git
	<div class="container-fluid mt--7">
		<div class="row mt-5">
			<div class="col-xl-8 mb-5 mb-xl-0">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">Question리스트</h3>
							</div>
							<div class="col text-right">
								<a href="#!" class="btn btn-sm btn-primary">See all</a>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<!-- Projects table -->
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">Page name</th>
									<th scope="col">Visitors</th>
									<th scope="col">Unique users</th>
									<th scope="col">Bounce rate</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">/argon/</th>
									<td>4,569</td>
									<td>340</td>
									<td><i class="fas fa-arrow-up text-success mr-3"></i> 46,53%</td>
								</tr>
								<tr>
									<th scope="row">/argon/index.html</th>
									<td>3,985</td>
									<td>319</td>
									<td><i class="fas fa-arrow-down text-warning mr-3"></i> 46,53%</td>
								</tr>
								<tr>
									<th scope="row">/argon/charts.html</th>
									<td>3,513</td>
									<td>294</td>
									<td><i class="fas fa-arrow-down text-warning mr-3"></i> 36,49%</td>
								</tr>
								<tr>
									<th scope="row">/argon/tables.html</th>
									<td>2,050</td>
									<td>147</td>
									<td><i class="fas fa-arrow-up text-success mr-3"></i> 50,87%</td>
								</tr>
								<tr>
									<th scope="row">/argon/profile.html</th>
									<td>1,795</td>
									<td>190</td>
									<td><i class="fas fa-arrow-down text-danger mr-3"></i> 46,53%</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col">
								<h3 class="mb-0">Social traffic</h3>
							</div>
							<div class="col text-right">
								<a href="#!" class="btn btn-sm btn-primary">See all</a>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<!-- Projects table -->
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th scope="col">Referral</th>
									<th scope="col">Visitors</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Facebook</th>
									<td>1,480</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">60%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">Facebook</th>
									<td>5,480</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">70%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-success" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;"></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">Google</th>
									<td>4,807</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">80%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">Instagram</th>
									<td>3,678</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">75%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">twitter</th>
									<td>2,645</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">30%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-gradient-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%;"></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer class="footer">
			<div class="row align-items-center justify-content-xl-between">
				<div class="col-xl-6">
					<div class="copyright text-center text-xl-left text-muted">
						© 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
					</div>
				</div>
				<div class="col-xl-6">
					<ul class="nav nav-footer justify-content-center justify-content-xl-end">
						<li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
	</div>
	<!-- 프로젝트 지원자 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="projApplyModal" tabindex="-1" role="dialog" aria-labelledby="projApplyModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="projApplyModalLabel">프로젝트 지원자</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">승인하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 프로젝트 지원자 모달 스크립트 -->
	<script>
		$('#projApplyModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var applyNo = button.parent().prevAll().eq(4).attr("value");
			var projApplicantsList = JSON.parse('${jsonProjApplicantsList}');
			
			
	        console.log(projApplicantsList[0].phoneNo);
	     	
	        var content = "<div class= container> " +
	        					"<div class=row> " +
	        						"<div class=col>" +
	        							"프로필 및 이름 자리" +
	        						"</div>" +
	        					"</div>" +
	        					"<div class=row> " +
        							"<div class=col>" +
        								projApplicantsList[0].phoneNo +
        							"</div>" +
        							"<div class=col>" +
        								projApplicantsList[0].email +
        							"</div>" +
        						"</div>" +
        						"<div class=row> " +
        							"<div class=col>" +
        								projApplicantsList[0].address +
        							"</div>" +
        						"</div>" +
        						"<div class=row> " +
    								"<div class=col>" +
    									projApplicantsList[0].coverLetter +
    								"</div>" +
    							"</div>" +
	        				"</div> ";
		
			
			//모달창 열기
			var modal = $(this);
			$(this).find(".modal-body").append(content); //여기서 모달을 다시 띄우면 그 전에 열었던 모달창에 더 추가된다. 정보가 계속 누적됨;;;
		});
		
		//모달 닫기
		$('#projApplyModal').on('hide.bs.modal', function(e) {

			$(".modal-body").html("");

			e.stopImmediatePropagation();

		});
	</script>
	
	
	
	
	
	
	<!-- 프로젝트 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="projectModal" tabindex="-1" role="dialog" aria-labelledby="projectModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로젝트</h5>
					<h5 class="modal-title" id="projectModalLabel"></h5>
					<button type="button" class="close modal-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mt--4">
					<table class="table align-items-center table-flush text-center">
						<thead class="thead-light">
							<tr>
								<th>프로젝트 이름</th>
								<th>버튼</th>
							</tr>
						</thead>
						<tbody id="tbody">
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary modal-close" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 프로젝트 모달 제어 스크립트 (데이터 담기) -->
	<script>
		$('#projectModal').on('show.bs.modal', function(event) {
			//프로젝트 지원, 프로젝트 승인, 프로젝트 참여 상태의 테이블을 만들어서 보여줘야함
			var button = $(event.relatedTarget) // Button that triggered the modal
			var status = button.find(".proj_status").html();
			var ajaxRow = "";

			console.log(status);
			$.ajax({
				url : "getProjStatusDetail/" + status,
				type : 'GET',
				dataType : 'json',
				async : false, //동기화 방식으로 해야 데이터를 다 받아 온 후에 실행한다.
				/* data : JSON.stringify({
					status : encodeURI(status)
				}), */
				contentType : 'application/json;charset=utf-8',
				success : function(data) { //데이터 받아오기 성공하면 
					//테이블 생성
					/* 					console.log(data.length);
					 console.log(data[0].projTitle); */

					for (i = 0; i < data.length; i++) {
						//이부분 함수로 만들어서 status가 지원일때, 승인일때, 참여일때, 버튼과 클릭이벤트 따로 주기
						ajaxRow += CreateTableRow(status, data);

						/* 
						"<tr id=" + data[i].projNo + ">"
							+ "<td>"
							+ data[i].projTitle
							+ "</td>"
							+ "<td>"
							+ "<button type=\"button\" class=\"btn btn-default\">지원 취소</button>"
							+ "</td>" + "</tr>"; */
					}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});

			//모달 띄우기
			var modal = $(this);
			$(this).find("#projectModalLabel").html(status);
			$(this).find("#tbody").append(ajaxRow); //여기서 모달을 다시 띄우면 그 전에 열었던 모달창에 더 추가된다. 정보가 계속 누적됨;;;
		});

		//status 별로 다른 테이블 값 생성
		function CreateTableRow(status, data) {
			var row = "";
			if (status == "지원") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './deleteApply?applyNo="
						+ data[i].applyNo + "' \">지원 취소</button>" + "</td>"
						+ "</tr>";
			} else if (status == "승인") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './updateApplyParticipantIn?applyNo="
						+ data[i].applyNo + "' \">승인 확인</button>" + "</td>"
						+ "</tr>";
			} else if (status == "참여") {
				row = "<tr id=" + data[i].applyNo + ">"
						+ "<td>"
						+ data[i].projTitle
						+ "</td>"
						+ "<td>"
						+ "<button type=\"button\" class=\"btn btn-default\" onclick=\"location.href = './moveToFileList?projNo="
						+ data[i].projNo + "' \">파일 관리</button>" + "</td>"
						+ "</tr>";
			} else if (status == "완료") {

			} else if (status == "관리") {

			}
			return row;
		}

		//모달 닫기
		$('#projectModal').on('hide.bs.modal', function(e) {

			$("#tbody").html("");

			e.stopImmediatePropagation();

		});
	</script>
</body>
</html>