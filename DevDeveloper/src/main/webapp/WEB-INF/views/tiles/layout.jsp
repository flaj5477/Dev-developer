<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Dev Developer
  </title>
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons, 현재 상대경로로 되있어서, 절대경로로 지정(${pageContext.request.contextPath}) -->
  <link href="${pageContext.request.contextPath}/resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
   <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
  
  <script>
  	
  	$(document).ready(function(){	
  			//페이지 이름 표시
	        $("#pageName").html(pageName);
	      //메뉴 볼드 설정
	    	$( 'a.nav-link:contains('+pageName+')' ).addClass('active');
	});
  	
  </script>
</head>

<body class="">
  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <!-- <a class="navbar-brand pt-0" href="./index.html"> -->
      <a class="navbar-brand pt-0" href="getFilesList">
        <img src="${pageContext.request.contextPath}/images/profile/DevDeveloper.png" class="navbar-brand-img" alt="...">
      </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="ni ni-bell-55"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <div class="media align-items-center">
              <span class="avatar avatar-sm rounded-circle">
            <c:choose>
        	<c:when test="${not empty sessionScope.members.membersId}">
                <img alt="Image placeholder" src="${pageContext.request.contextPath}/images/profile/${sessionScope.members.membersImage}
">				
              </span>
             </c:when>
             <c:otherwise>
             <img alt="Image placeholder" src="${pageContext.request.contextPath}/resources/assets/img/theme/team-1-800x800.jpg
">				
			</c:otherwise>
			</c:choose>
            </div>
          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="${pageContext.request.contextPath}/examples/profile.html" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="${pageContext.request.contextPath}/examples/profile.html" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="${pageContext.request.contextPath}/examples/profile.html" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="${pageContext.request.contextPath}/examples/profile.html" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="./index.html">
                <img src="${pageContext.request.contextPath}/resources/assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <form class="mt-4 mb-3 d-md-none">
          <div class="input-group input-group-rounded input-group-merge">
            <input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <span class="fa fa-search"></span>
              </div>
            </div>
          </div>
        </form>
        
        <!-- Navigation -->

        <tiles:insertAttribute name="left"></tiles:insertAttribute>



        <!-- Divider -->
        <hr class="my-3">
        <!-- Heading -->
        <h6 class="navbar-heading text-muted">Documentation</h6>
        <!-- Navigation -->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html">
              <i class="ni ni-spaceship"></i> Getting started
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html">
              <i class="ni ni-palette"></i> Foundation
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html">
              <i class="ni ni-ui-04"></i> Components
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  <div class="main-content">
    <!-- Navbar -->
    <nav class="navbar navbar-top navbar-expand-md navbar-dark bg-gradient-primary" id="navbar-main">
      <div class="container-fluid">
        <!-- Brand -->
        <a id="pageName" class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Dashboard</a>
        <!-- Form -->
        <form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
          <div class="form-group mb-0">
            <div class="input-group input-group-alternative">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-search"></i></span>
              </div>
              <input class="form-control" placeholder="Search" type="text">
            </div>
          </div>
        </form>
        <!-- User -->
        <c:choose>
        	<c:when test="${empty sessionScope.members.membersId}">
        	<div>
				<a data-toggle="modal" href="signup" data-target="#modal-testNew"
				role="button" style="color:#e8e8e8;"> 회원가입
				</a>
				&nbsp;&nbsp;
				<a data-toggle="modal" href="login2" data-target="#modal-login"
				role="button" style="color:#e8e8e8;" id="pop">로그인</a>

				</div>
        	</c:when>
        	<c:otherwise>
        <ul class="navbar-nav align-items-center d-none d-md-flex">
          <li class="nav-item dropdown">
            <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="${pageContext.request.contextPath}/images/profile/${sessionScope.members.membersImage}">
                </span>
                <div class="media-body ml-2 d-none d-lg-block">
                  <span class="mb-0 text-sm  font-weight-bold">${sessionScope.members.membersId}</span>
                </div>
              </div>
            </a>
            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
              <div class=" dropdown-header noti-title">
                <h6 class="text-overflow m-0">Welcome!</h6>
              </div>
              <a href="#" class="dropdown-item">
                <i class="ni ni-single-02"></i>
                <span>My profile</span>
              </a>
              <a href="#" class="dropdown-item">
                <i class="ni ni-settings-gear-65"></i>
                <span>Settings</span>
              </a>
              <a href="#" class="dropdown-item">
                <i class="ni ni-calendar-grid-58"></i>
                <span>Activity</span>
              </a>
              <a href="#" class="dropdown-item">
                <i class="ni ni-support-16"></i>
                <span>Support</span>
              </a>
              <div class="dropdown-divider"></div>
              <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">
                <i class="ni ni-user-run"></i>
                <span>Logout</span>
              </a>
            </div>
          </li>
        </ul>
        </c:otherwise>
        </c:choose>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="header bg-gradient-primary pb-7"></div>
    <div class="container-fluid mt-5">
    	<!-- 내용 -->
    	<tiles:insertAttribute name="content"></tiles:insertAttribute>
    
    </div>
  </div>
  
  
  	<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="회원가입" aria-describedby="테스트 모달">
		<div class="modal-dialog" >
			<div class="modal-content" style="background: #f0f2ff; width:550px;"></div>
		</div>
	</div>
	
  	<div id="modal-login" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="로그인" aria-describedby="테스트 모달">
		<div class="modal-dialog">
			<div class="modal-content" style="background: #5561A5; width:70%;"></div>
		</div>
	</div>
  <!--   Core   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
  <!--   Argon JS   -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  	
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
  <script>
     var loginmode = 'page';	
  	
  	$('#modal-testNew').on('show.bs.modal', function (e) {
	    $(this).find('.modal-content').load("signup");
	});
 	
	
	$('#modal-login').on('show.bs.modal', function (e) {
		
		if(e.relatedTarget.id =='pop'){
			loginmode = 'popup';
		}else{
			loginmode ='wiki';
		}
	    $(this).find('.modal-content').load("login2");
	});
  </script>
</body>
</html>