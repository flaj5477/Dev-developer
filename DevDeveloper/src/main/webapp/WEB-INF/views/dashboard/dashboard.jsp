<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	pageName="Dashboard";
</script>

<script> <!--도트 색 표시-->
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
출석률 표시하는거 고정크기 지정 -->.col-fixed {
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
		width: calc(100% - 300px);
	}
}

@media ( min-width : 992px) and (max-width: 1199px) {
	.col-fixed {
		width: 800px;
	}
	.col-fluid {
		width: calc(100% - 300px);
	}
}

@media ( min-width : 1200px) {
	.col-fixed {
		width: 800px;
	}
	.col-fluid {
		width: calc(100% - 300px);
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
						<div class="col-xl-4 mb-5 mb-xl-0">
							<!-- 프로필 -->
							<div class="card card-profile shadow">
								<div class="row justify-content-center">
									<div class="col-lg-3 order-lg-2">
										<div class="card-profile-image">
											<a href="#"> <img
												src="./resources/assets/img/theme/team-4-800x800.jpg"
												class="rounded-circle">
											</a>
										</div>
									</div>
								</div>
								<div
									class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
									<div class="d-flex justify-content-between">
										<a href="#" class="btn btn-sm btn-info mr-4">Connect</a> <a
											href="#" class="btn btn-sm btn-default float-right">Message</a>
									</div>
								</div>
								<div class="card-body pt-0 pt-md-4">
									<div class="row">
										<div class="col">
											<div
												class="card-profile-stats d-flex justify-content-center mt-md-5">
												<div>
													<span class="heading">22</span> <span class="description">Friends</span>
												</div>
												<div>
													<span class="heading">10</span> <span class="description">Photos</span>
												</div>
												<div>
													<span class="heading">89</span> <span class="description">Comments</span>
												</div>
											</div>
										</div>
									</div>
									<div class="text-center">
										<h3>
											Jessica Jones<span class="font-weight-light">, 27</span>
										</h3>
										<div class="h5 font-weight-300">
											<i class="ni location_pin mr-2"></i>Bucharest, Romania
										</div>
										<div class="h5 mt-4">
											<i class="ni business_briefcase-24 mr-2"></i>Solution Manager
											- Creative Tim Officer
										</div>
										<div>
											<i class="ni education_hat mr-2"></i>University of Computer
											Science
										</div>
										<hr class="my-4">
										<p>Ryan — the name taken by Melbourne-raised,
											Brooklyn-based Nick Murphy — writes, performs and records all
											of his own music.</p>
										<a href="#">Show more</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col col-xl-8">
							<!-- 프로젝트 상태 카드 -->
							<div class="row">
								<div class="col-xl-3 col-lg-6">
									<a data-toggle="modal" data-target="#exampleModal"> <!-- 모달 창 걸기 -->
										<div class="card card-stats mb-4 mb-xl-0" >
											<div class="card-body proj-modal">
												<div class="row">
													<div class="col">
														<h5 class="card-title text-uppercase text-muted mb-0">프로젝트
															<span class="proj_status">지원</span></h5>
														<span class="h2 font-weight-bold mb-0">${projApply }
														</span>
													</div>
													<div class="col-auto">
														<div
															class="icon icon-shape bg-warning text-white rounded-circle shadow">
															<i class="fas fa-chart-pie"></i>
														</div>
													</div>
												</div>
											</div>
										</div>
									</a>
								</div>
								<div class="col-xl-3 col-lg-6">
									<div class="card card-stats mb-4 mb-xl-0">
										<div class="card-body">
											<div class="row">
												<div class="col">
													<h5 class="card-title text-uppercase text-muted mb-0">프로젝트
														승인</h5>
													<span class="h2 font-weight-bold mb-0">${projApprove}</span>
												</div>
												<div class="col-auto">
													<div
														class="icon icon-shape bg-yellow text-white rounded-circle shadow">
														<i class="fas fa-users"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-6">
									<div class="card card-stats mb-4 mb-xl-0">
										<div class="card-body">
											<div class="row">
												<div class="col">
													<h5 class="card-title text-uppercase text-muted mb-0">프로젝트
														참여</h5>
													<span class="h2 font-weight-bold mb-0"><a
														href="./getFilesList?projNo=1">${projParticipant}</a></span>
												</div>
												<div class="col-auto">
													<div
														class="icon icon-shape bg-info text-white rounded-circle shadow">
														<i class="fas fa-percent"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-6">
									<div class="card card-stats mb-4 mb-xl-0">
										<div class="card-body">
											<div class="row">
												<div class="col">
													<h5 class="card-title text-uppercase text-muted mb-0">프로젝트
														완료</h5>
													<span class="h2 font-weight-bold mb-0">0</span>
												</div>
												<div class="col-auto">
													<div
														class="icon icon-shape bg-warning text-white rounded-circle shadow">
														<i class="fas fa-chart-pie"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 출석률 도트 -->
							<div class="row  mb-4">
								<div class="col-xl-7">
									<div class="card-body">
										<div id="drawing" class="align-self-center">
											<svg class=" col-fixed" xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
												width="100%" height="84">
							<c:forEach var="activityLog" items="${activityLogList}"
													varStatus="status">
								<c:if test="${status.index % 7 == 0 }">		<!-- 일요일이면 g태그 열기 -->
									<g
															transform="translate(<fmt:formatNumber value="${status.index/7*10}" pattern="#" />, 0)">
								
											
											
													
													
													
													</c:if>
									<!-- col-fixed 의 width인 620에 대한 % -->
								<rect width="1%" height="10%"
														class="${activityLog.activityScore }" x="0"
														y="${status.index%7*14 }"></rect>
								<c:if test="${status.index % 7 == 6 }">		<!-- 토요일이면 g태그 닫기 -->
									</g>
								</c:if>
							</c:forEach>
						</svg>
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



	<!-- 프로젝트 모달 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

<!-- 모달 제어 스크립트 (데이터 담기) -->
<script> 
$('#exampleModal').on('show.bs.modal', function (event) {
	//프로젝트 지원, 프로젝트 승인, 프로젝트 참여 상태의 테이블을 만들어서 보여줘야함
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var status = button.find(".proj_status").html();
	  $.ajax({
			url : "getProjStatusDetail",
			type : 'GET',	//등록이랑 다른부분 
			dataType : 'json',
			data : JSON.stringify({
				status : status
			}),
			contentType : 'application/json',
			success : function(data) {	//데이터 받아오기 성공하면 
				//테이블 생성
			},
			error : function(xhr, status, message) {
				alert(" status: " + status + " er:" + message);
			}
		});
	  
	});
</script>








	<div class="container-fluid mt--7">
		<div class="row">
			<div class="col-xl-8 mb-5 mb-xl-0">
				<div class="card bg-gradient-default shadow">
					<div class="card-header bg-transparent">
						<div class="row align-items-center">
							<div class="col">
								<h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
								<h2 class="text-white mb-0">출석률</h2>
							</div>
							<div class="col">
								<ul class="nav nav-pills justify-content-end">
									<li class="nav-item mr-2 mr-md-0" data-toggle="chart"
										data-target="#chart-sales"
										data-update="{&quot;data&quot;:{&quot;datasets&quot;:[{&quot;data&quot;:[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}"
										data-prefix="$" data-suffix="k"><a href="#"
										class="nav-link py-2 px-3 active" data-toggle="tab"> <span
											class="d-none d-md-block">Month</span> <span
											class="d-md-none">M</span>
									</a></li>
									<li class="nav-item" data-toggle="chart"
										data-target="#chart-sales"
										data-update="{&quot;data&quot;:{&quot;datasets&quot;:[{&quot;data&quot;:[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}"
										data-prefix="$" data-suffix="k"><a href="#"
										class="nav-link py-2 px-3" data-toggle="tab"> <span
											class="d-none d-md-block">Week</span> <span class="d-md-none">W</span>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-body">
						<!-- Chart -->
						<div class="chart">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<!-- Chart wrapper -->
							<canvas id="chart-sales"
								class="chart-canvas chartjs-render-monitor" width="590"
								height="350"
								style="display: block; width: 590px; height: 350px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="card shadow">
					<div class="card-header bg-transparent">
						<div class="row align-items-center">
							<div class="col">
								<h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
								<h2 class="mb-0">지원자 리스트</h2>
							</div>
						</div>
					</div>
					<div class="card-body">
						<!-- Chart -->
						<div class="chart">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<canvas id="chart-orders"
								class="chart-canvas chartjs-render-monitor"
								style="display: block; width: 255px; height: 350px;" width="255"
								height="350"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
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
									<td><i class="fas fa-arrow-up text-success mr-3"></i>
										46,53%</td>
								</tr>
								<tr>
									<th scope="row">/argon/index.html</th>
									<td>3,985</td>
									<td>319</td>
									<td><i class="fas fa-arrow-down text-warning mr-3"></i>
										46,53%</td>
								</tr>
								<tr>
									<th scope="row">/argon/charts.html</th>
									<td>3,513</td>
									<td>294</td>
									<td><i class="fas fa-arrow-down text-warning mr-3"></i>
										36,49%</td>
								</tr>
								<tr>
									<th scope="row">/argon/tables.html</th>
									<td>2,050</td>
									<td>147</td>
									<td><i class="fas fa-arrow-up text-success mr-3"></i>
										50,87%</td>
								</tr>
								<tr>
									<th scope="row">/argon/profile.html</th>
									<td>1,795</td>
									<td>190</td>
									<td><i class="fas fa-arrow-down text-danger mr-3"></i>
										46,53%</td>
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
													<div class="progress-bar bg-gradient-danger"
														role="progressbar" aria-valuenow="60" aria-valuemin="0"
														aria-valuemax="100" style="width: 60%;"></div>
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
													<div class="progress-bar bg-gradient-success"
														role="progressbar" aria-valuenow="70" aria-valuemin="0"
														aria-valuemax="100" style="width: 70%;"></div>
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
													<div class="progress-bar bg-gradient-primary"
														role="progressbar" aria-valuenow="80" aria-valuemin="0"
														aria-valuemax="100" style="width: 80%;"></div>
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
													<div class="progress-bar bg-gradient-info"
														role="progressbar" aria-valuenow="75" aria-valuemin="0"
														aria-valuemax="100" style="width: 75%;"></div>
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
													<div class="progress-bar bg-gradient-warning"
														role="progressbar" aria-valuenow="30" aria-valuemin="0"
														aria-valuemax="100" style="width: 30%;"></div>
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
						© 2018 <a href="https://www.creative-tim.com"
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
</body>
</html>