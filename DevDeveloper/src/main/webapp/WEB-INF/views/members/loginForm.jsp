<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>login test</title>
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

<body class="bg-default">
	<div class="main-content">
		<!-- Navbar -->



		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
						<div class="col-lg-5 col-md-6">
							<h1 class="text-white">안녕!</h1>
							<p class="text-lead text-light">안녕안녕</p>
						</div>
					</div>
				</div>
			</div>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none"
					version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
			</div>
		</div>
		<!-- Page content -->
		<div class="container mt--8 pb-5">
			<div class="row justify-content-center">
				<div class="col-lg-5 col-md-7">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-5">
							<div class="text-muted text-center mt-2 mb-3">
								<small>Sign in with</small>
							</div>
							<div class="btn-wrapper text-center">

								<a href="#" class="btn btn-neutral btn-icon"> <span
									class="btn-inner--icon"><img
										src="../assets/img/icons/common/google.svg"></span> <span
									class="btn-inner--text">Google</span>
								</a>
							</div>
						</div>
						<div class="card-body px-lg-5 py-lg-5">
							<div class="text-center text-muted mb-4"></div>
							<c:choose>
								<c:when test="${empty sessionScope.members.membersId}">
									<!-- 로그인이 안되어 있으면 -->
									<form name="loginfrm" id="loginfrm" action="loginCheck" method="POST">
										<div class="form-group mb-3">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="ni ni-circle-08"></i></span>
												</div>
												<input class="form-control" placeholder="아이디" type="text"
													id="membersId" name="membersId">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="ni ni-lock-circle-open"></i></span>
												</div>
												<input class="form-control" placeholder="비밀번호"
													type="password" id="membersPw" name="membersPw">
												<c:if test="${msg == '실패'}">
													<div
														class="alert alert-default alert-dismissible fade show"
														role="alert">
														<span class="alert-inner--icon"></span> <span class="alert-inner--text">
															<strong>아이디 또는 패스워드가 틀렸습니다</strong>
															</span>
														<button type="button" class="close" data-dismiss="alert"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>

												</c:if>
											</div>
										</div>
										<div
											class="custom-control custom-control-alternative custom-checkbox">
											<input class="custom-control-input" id=" customCheckLogin"
												type="checkbox"> <label class="custom-control-label"
												for=" customCheckLogin"> <span class="text-muted">Remember
													me</span>
											</label>
										</div>
										<div class="text-center">
											<button type="button" id="login" class="btn btn-primary my-4">로그인</button>
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<h3>${sessionScope.members.membersId}님 안녕하세요.</h3>
									<br>${sessionScope.members.membersGrade} 등급	<br>							 
									이름: ${sessionScope.members.membersName} <br>
									
									<a href="logout">로그아웃</a>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
					<div class="row mt-3">
						<div class="col-6">
							<a href="#" class="text-light"><small>비밀번호 찾기</small></a>
						</div>
						<div class="col-6 text-right">
							<a href="loginTest" class="text-light"><small>회원가입</small></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function(e) {
			$('#login').click(function() {

				// 입력 값 체크
				if ($.trim($('#membersId').val()) == '') {
					alert("아이디를 입력해 주세요.");
					$('#membersId').focus();
					return;
				} else if ($.trim($('#membersPw').val()) == '') {
					alert("패스워드를 입력해 주세요.");
					$('#membersPw').focus();
					return;
				}

				//전송
				$('#loginfrm').submit();
			});

		});
	</script>
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