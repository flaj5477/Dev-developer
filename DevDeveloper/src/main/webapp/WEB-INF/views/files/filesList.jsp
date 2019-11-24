<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	pageName = "프로젝트 파일";

	function filesImport() {
		// name이 같은 체크박스의 값들을 배열에 담는다.
	    var list = [];
	    $("input[name='chk_files']:checked").each(function(i) {
			var obj = {};
	    	obj["filesNo"] = $(this).val();
	        list.push(obj);
	    });
	    var data = JSON.stringify(list);
		console.log(data);
	    $.ajax({
			type : "POST",
			url : 'filesImport',
			dataType : "json",
			data : data,
			contentType : "application/json",
			success : function(response) {
				location.reload();
			},
			error : function(xhr, status, msg) {
				alert("status : " + status + " / err msg : " + msg);
			}
		});
	}

	// 휴지통
	function filesTrash() {
		// name이 같은 체크박스의 값들을 배열에 담는다.
		console.log("후지통");
	    var trashList = [];
	    $("input[name='chk_files']:checked").each(function(i) {
			var trashObj = {};
			trashObj["filesNo"] = $(this).val();
			trashList.push(trashObj);
	    });
	    var trashData = JSON.stringify(trashList);
		console.log(trashData);
	    $.ajax({
			type : "POST",
			url : 'filesTrash',
			dataType : "json",
			data : trashData,
			contentType : "application/json",
			success : function(response) {
				location.reload();
			},
			error : function(xhr, status, msg) {
				alert("status : " + status + " / err msg : " + msg);
			}
		});
	}

	function filesSearch() {
		$.ajax({
			type : "POST",
			url : 'filesSearch',
			data : {
				filesNo : $('[name="chk_files"]:checked').val()
			},
			success : function(result) {
				location.reload();

			},
			error : function(e) {
			}
		});
	}

	function filesDownload() {
		var filesArr = [];
		$("input[name='chk_files']:checked").each(function(i){
			filesArr.push( $(this).val() ); // 체크한 것의 fileNo를 filsArr 배열에 담음
		});
		console.log(filesArr);
		if(filesArr.length == 0) { // 파일 체크를 하지 않았을 경우
			alert("파일을 선택해주세요.");
		} else {
			var link = document.createElement('a');
			link.setAttribute('download', null);
			link.style.display = "none";
			document.body.appendChild(link);
			for(var i = 0; i < filesArr.length; i++) {
				console.log(filesArr[i]);
				link.setAttribute("href", "download?filesNo=" + filesArr[i]);
				link.click();
			}
			document.body.removeChild(link);
		}
	}	
</script>
</head>

<body class="">
	<div class="container-fluid mt--7">
		<!-- Table -->
		<div class="row">
			<div class="col">
				</br>
				</br>
				</br>
				</br>
				<div class="card shadow">
					<div class="card-header border-0">
						<h2 class="mb-0">${project.projTitle }</h2>
						<div>
							<b>
							<font size = "5">
							<c:forEach items="${filesRoute}" var="route">
								<a href="getFilesList?upperFolder=${route.filesNo}"> ${route.filesTitle} /</a>

							</c:forEach>
							</font>
							</b>
						</div>

						<br />
						<div class="btn-card-header-group text-right">
							<div class="row">
								<div class="col-3">
									<form name="searchfrm" action="filesSearch">
										<input type="hidden" name="projNo" value='${projNo}' />
										<div class="input-group">
											<select name="select">
												<option value="title">제목
												<option value="userNo">작성자
											</select>
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="ni ni-zoom-split-in"></i></span>
											</div>
											<input class="form-control" name="searchVal"> <input
												type="hidden" name="page" value="1">
											<button>검색</button>
										</div>
									</form>
								</div>

								<!-- Modal -->
								<div class="modal fade" id="upmodal" tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h3 class="modal-title" id="exampleModalLabel">파일 업로드</h3>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form id="fileForm" name="fileForm" action="filesUpload"
													method="post" enctype="multipart/form-data"
													onsubmit='return getCmaFileView()'>
											<div class ="modal-body">
													<input type="hidden" name="projNo" value='${projNo}' />
													<input type="hidden" name="upperFolder" value="${param.upperFolder}" ></input>
													<div class = "row">
														<div class = "col-2">
															타이틀
														</div>
														<div class = "col-10">
															<input type="text"name="filesTitle" class = "form-control"></input>
														</div>
													</div>
													<br>
													<div class = "row">
														<div class = "col-2">
															코멘트
														</div>
														<div class = "col-10">
															<input type="text" name="filesComment" class = "form-control"></input>
														</div>
													</div>
													<br>
													<input type="file" class = "form-control-file" onchange='getC()' value="파일 선택" id="uploadFile"	name="uploadFile" multiple>
												
											</div>
											<div class="modal-footer">
												<input type = "submit" class = "btn btn-white" value = "업로드">
												<button type="submit" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
											</form>
										</div>
									</div>
								</div>

								<div class="col-9 pull-right">
									<!-- <button type="button" class="btn btn-primary btn"
										onclick="location.href='filesInsertForm.jsp'">새파일</button> -->

									<button type="button" class="btn btn-primary btn"
										onclick="filesImport()">중요</button>

									<button type="button" class="btn btn-primary btn"
										onclick="filesTrash()">휴지통</button>

									<button type="button" class="btn btn-primary btn" id=""
										data-toggle="modal" data-target="#upmodal">업로드</button>

									<button type="button" class="btn btn-primary btn"
										onclick="filesDownload()">다운로드</button>

									<!-- <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Ryan Tompson"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-1-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Romina Hadid"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-2-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Alexander Smith"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-3-800x800.jpg"
										class="rounded-circle">
									</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
										data-original-title="Jessica Doe"> <img
										alt="Image placeholder"
										src="./resources/assets/img/theme/team-4-800x800.jpg"
										class="rounded-circle"> -->
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="table-responsive">

					<table class="table align-items-center table-flush" id="filesRoot">
						<thead class="thead-light">
							<tr>
								<th scope="col">파일명</th>
								<th scope="col">코멘트</th>
								<th scope="col">Users</th>
								<th scope="col">업데이트 날짜</th>
								<th scope="col">파일 크기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="files" items="${list}">
								<tr>
									<td><input type="checkbox" value="${files.filesNo}"
										name="chk_files" id="chk_files"> <!-- <script>
											$('#chk_files').click(function() {
												var chk = $("#chk_files").prop("checkd");
												if(chk) {
													$(".chBox").prop("checkecd", true);
												}else {
													$(".chBox").prop("checked", false);
												}
											});
											</script> --> <%-- ${files.filesType} --%> <c:if
											test="${files.filesType=='F'}">
											<!-- <i class="far fa-file"></i> -->
                						${files.filesTitle}
                						 </c:if> <c:if test="${files.filesType=='D'}">
											<i class="far fa-folder"></i>
											<a href="./getFilesList?upperFolder=${files.filesNo}">${files.filesTitle}</a>
										</c:if>
										<span class="filesImportCheck">
											<c:if test="${files.filesImport=='Y'}">
												<i class ="ni ni-favourite-28 text-red"></i>
											</c:if>
										</span>
									</td>

									<!-- <input type="checkbox" name="chk_info" value="HTML">HTML -->
									<td>${files.filesComment }</td>
									<td>${files.membersName }</td>
									<td><fmt:formatDate value="${files.filesUploadDate}"
											pattern="yyyy-MM-dd" /></td>
									<td><c:if test="${files.filesType=='F'}">${files.filesSizeTrans}</c:if>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div class="card-footer py-4">
					<my:paging paging="${paging}" jsFunc="go_page" />
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="row align-items-center justify-content-xl-between">
			<div class="col-xl-6">
				<div class="copyright text-center text-xl-left text-muted">
					&copy; 2018 <a href="https://www.creative-tim.com"
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

	<script>
		function getCmaFileView() {
			var fileObj = document.fileForm.uploadFile.files[0];

			if (fileObj == null || fileObj == "") {

				alert('파일을 선택해주세요.');

				fileObjValue = '';

				return false;

			}

			return true;

		}
	</script>
	<!--   Core   -->
	<script src="./resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="./resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		function go_page(p) {
			location.href = "getFilesList?page=" + p
		}
		/*  window.TrackJS &&
		    TrackJS.install({
		      token: "ee6fab19c5a04ac1a32a645abde4613a",
		      application: "argon-dashboard-free"
		    }); */
	</script>
</body>

</html>