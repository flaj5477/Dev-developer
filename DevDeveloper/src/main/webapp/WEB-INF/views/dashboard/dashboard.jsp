<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="activityLog" items="${activityLogList}">
<p>${activityLog.activityDate }</p>
<p>${activityLog.activityScore }</p>
</c:forEach>
	<div>
		<div class="header pb-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">프로필&레벨 표시 자리</h5>
											<span class="h2 font-weight-bold mb-0">350,897</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-danger text-white rounded-circle shadow">
												<i class="fas fa-chart-bar"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-success mr-2"><i
											class="fa fa-arrow-up"></i> 3.48%</span> <span class="text-nowrap">프로젝트 지원</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">프로젝트 지원</h5>
											<span class="h2 font-weight-bold mb-0">2,356</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-warning text-white rounded-circle shadow">
												<i class="fas fa-chart-pie"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-danger mr-2"><i
											class="fas fa-arrow-down"></i> 3.48%</span> <span
											class="text-nowrap">Since last week</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">프로젝트 승인</h5>
											<span class="h2 font-weight-bold mb-0">1</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-yellow text-white rounded-circle shadow">
												<i class="fas fa-users"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-warning mr-2"><i
											class="fas fa-arrow-down"></i> 1.10%</span> <span
											class="text-nowrap">Since yesterday</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">프로젝트 참여</h5>
											<span class="h2 font-weight-bold mb-0">49,65%</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-info text-white rounded-circle shadow">
												<i class="fas fa-percent"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<span class="text-success mr-2"><i
											class="fas fa-arrow-up"></i> 12%</span> <span class="text-nowrap">Since
											last month</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<script>
//표 데이터
{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}
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
												class="d-none d-md-block">Week</span> <span
												class="d-md-none">W</span>
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
									style="display: block; width: 255px; height: 350px;"
									width="255" height="350"></canvas>
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
								href="https://www.creative-tim.com/presentation"
								class="nav-link" target="_blank">About Us</a></li>
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