<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	pageName = "위키가이드";	

	$(function() {
		//transTitle();
		hover();
	});
	
	/* 
		게시글 클릭(n) 하면 n번 게시글 이동
	 */
	function formSubmit(n) {
		var form = document.frm;
		form.manualNo.value = n;
		form.submit();
	}
	
	
	function hover(){
		$('[name=wikitd]').hover(function() {	// on이벤트? 해줘야됨
			$(this).css("background-color", "#f4f5f7");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}

/* 	function transTitle() {
		var title = $('.title');
		$.each(title, function(idx, item) {
			res = item.html().replace("<", "&lt;");
			res = res.replace(">", "&gt;")
			item.html(res);
		});
	} */
</script>
</head>


<!-- 
	20191021 곽동우 위키목록뿌리기추가
	
 -->
<body>
	<%-- <form action="getwiki" method="post">
		<c:forEach items="${wikiMap }" var="wiki">
			${wiki.manualNo}	<a href=${wiki.manualOriUrl}>${wiki.manualOriUrl} </a> 
			<a href ="getWiki?manualNo=${wiki.manualNo}">${wiki.manualContents}</a> <br>
		</c:forEach>
	</form> --%>
	<c:if test="${sessionScope.members.membersGrade eq 5}">
		<span class="col-3 text-right">
			<a href="insertWikiForm" class="btn btn-sm btn-primary">문서등록</a>
		</span>
	</c:if>
	<div class="card shadow">
		<div class="card-header border-0">
			<div class="row align-items-center">
				<div class="col">
					<h3 class="mb-0">목록</h3>
				</div>
				<div class="col">
					<form name="searchfrm">
						<%-- <div class="input-group">
							<select name="select">
								<option value="title">제목
								<option value="tags">태그
							</select>
	                        <div class="input-group-prepend">
	                          <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span>
	                        </div>
                        	<input class="form-control" name="searchVal"  value="${param.searchVal }"><!--  getparameter? el에서 value안에값처럼표시 -->
                      	
							<input type="hidden" name="page" value="1">
							<button>검색</button>
						</div> --%>
						<select name="select">
								<option value="title">제목
								<option value="tags">태그
						</select>
						<div class="row mb-3">
							<div class="col-xl-3 col-lg-4 col-md-5 col-sm-6 col-xs-7">
								<input class="form-control" name="searchVal" placeholder="Search" type="text" value="${param.searchVal }">
								<input type="hidden" name="page" value="1">
								
							</div>
							<div >
								<button class="btn btn-icon btn-2 btn-primary">
									<span class="btn-inner--icon"><i class="fas fa-search"></i></span>
								</button>
							</div>
						</div>
					</form>
				</div>
				
				
			</div>
		</div>
		<div class="table-responsive">
			<table class="table align-items-center table-flush">
				<thead class="thead-light">
					<tr>
						<th scope="col">No</th>
						<th scope="col">Title</th>
						<th scope="col">Tags</th>
						<th scope="col">Completion</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${wikiMap }" var="wiki">
						<tr name="wikitd"
							onclick="location.href='getWiki?manualNo=${wiki.manualNo}'">
							<th scope="row">
								<div class="media-body">
									<span class="mb-0 text-sm">${wiki.manualNo}</span>
								</div>

							</th>
							<td id="${wiki.manualNo}" class="title">${wiki.manualTitle}
							</td>
							<td><span class="badge badge-dot mr-4">
									${wiki.manualTags} </span></td>
							<td>
								<div class="d-flex align-items-center">
									<span class="mr-2">60%</span>
									<div>
										<div class="progress">
											<div class="progress-bar bg-warning" role="progressbar"
												aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
												style="width: 60%;"></div>
										</div>
									</div>
								</div>
							</td>
							<td class="text-right">
								<div class="dropdown">
									<a class="btn btn-sm btn-icon-only text-light" href="#"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
									</a>
									<div
										class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<my:paging paging="${paging}" jsFunc="go_page" />
	<!-- 페이징 페이지이동 -->
	<script>
		function go_page(p) {
//			location.href = "wikihome?page=" + p
			document.searchfrm.page.value = p
			document.searchfrm.submit()
		}
	</script>

</body>
</html>