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
<style type="text/css">
a {
  color : "blue";
}

.cutline {
	width : 500px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}


</style>
<script>
	pageName = "위키가이드";
	$(function() {
		//transTitle();
		hover();
	});
	
	/* 
		게시글 클릭(n) 하면 n번 게시글 이동
	 */
	/* function formSubmit(n) {
		var form = document.frm;
		form.manualNo.value = n;
		form.submit();
	} */
	
	/* function getWiki(){
		$('[name=wikitd]').on('click',function(){
			$("#frmWiki").attr("action" , "getWiki").submit();
		});
	} */
	
	
	function hover(){
		$('[name=wikitd]').hover(function() {	// on이벤트? 해줘야됨
			$(this).css("background-color", "#f4f5f7");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}
	
	function clickTag(e,tag){
		//e.stopPropagation();
		location = "wikihome?select=tags&page=1&searchVal="+encodeURIComponent(tag);	// encodeURIComponent(tag) get방식은 파라미터넘길때 인코딩 해줘야함
	}
	
	
	
	
	
	
	
	
	
	
/* 	$('html').click(function(e) { 
		if(!$(e.target).hasClass("dropdown")) { 
			alert('영역 밖입니다.'); 
		} 
	}); */


/* 	function dropodwn(){
		$('.dropdown').on('click', function(event){
			event.stopPropagation();	
		});
	} */
	
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
	
	<div class="main p-4">
		<div class="card shadow">
			<div class="card-header border-0">
				<div class="row align-items-center">
					<form name="searchfrm">
						<div class="col">
							<div class="row">
								<select name="select">
									<option value="title" <c:if test="${param.select == 'title'}">selected</c:if>  >제목
									<option value="tags" <c:if test="${param.select == 'tags'}">selected</c:if>  >태그
								</select>
								<div>
									<input class="form-control" name="searchVal" placeholder="Search" type="text" value="${param.searchVal }">
									<input type="hidden" name="page" value="1">
									
								</div>
								<div >
									<button class="btn btn-icon btn-2 btn-primary">
										<span class="btn-inner--icon"><i class="fas fa-search"></i></span>
									</button>
								</div>
							</div>
						</div>
					</form>
					<div class="col">
						<div class="nav nav-pills justify-content-end"> 
							<c:if test="${sessionScope.members.membersGrade eq 5}">
								<div>
									<span class="col-3 text-right">
										<a href="insertWikiForm" class="btn btn-sm btn-danger">문서등록</a>
									</span>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<form id="frmWiki" name="frmWiki">
					<table class="table align-items-center table-flush">
						<thead class="thead-light">
							<tr  align="center">
								<th style="width:5%">No</th> 
								<th style="width:50%">Title</th>
								<th style="width:25%"><a href="getWikiTagList">Tags</a></th>
								<th style="width:20%">번역률</th>
							</tr>
						</thead>
						
						<tbody>
		
							<c:forEach items="${wikiMap }" var="wiki">
								<tr name="wikitd" onclick="location.href='getWiki?manualNo=${wiki.manualNo}'">
									<th scope="row">
										<div class="media-body">
											<span class="mb-0 text-sm">${wiki.manualNo}</span>
										</div>
		
									</th>
									<td id="${wiki.manualNo}" class="title">
										<div class="cutline">${wiki.manualTitle}</div>
									</td>
									<td>
										<div class="cutline2">
											<span>
												<c:choose>
													<c:when test="${wiki.manualTags eq null}">
														<span class="badge badge-default"><a href = "wikihome?select=tags&page=1&searchVal=기타">기타</a></span>
													</c:when>
													<c:when test="${not empty wiki.manualTags}">
														<c:forEach items="${wiki.divTagList }" var="tag" varStatus="index" begin="0" end="2">
															<span class="badge badge-default"><a href = "javascript:clickTag(event,'${tag}')">${tag}</a></span>
														</c:forEach>		
													</c:when>
												</c:choose>
											</span>
										</div>
									</td>
									<td>
										<div class="d-flex align-items-center">
											<span class="mr-2">${wiki.manualTransPercent }%</span>
											<div>
												<div class="progress">
													<div class="progress-bar bg-success" role="progressbar"
														aria-valuenow="${wiki.manualTransPercent }%" aria-valuemin="0" aria-valuemax="100"
														style="width:${wiki.manualTransPercent }%;"></div>
												</div>
											</div>
										</div>
									</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
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
	</div>

</body>
</html>