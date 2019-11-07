<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script>
	pageName = "Q & A";
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%-- <script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		 
		<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css"> --%>
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ccsss.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/test.css">
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gg.css"> --%>
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ff.css"> --%>
<%-- 	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/hh.css">  --%>

</head>
<body id="qq">
<div class="container-fluid mt--3">
<div class="row">
<div class="col">
<div class="row mb-4">
			<div class=""
				style="padding-left: 110px;">
				<input class="form-control" name="searchVal" placeholder="Search"
					type="text" style="border: #686ce4 1px solid; display:inline-block; width:240px;"> <input
					type="hidden" name="page" value="1">
				<button class="btn btn-icon btn-3 btn-primary" type="button" style="margin-left: 0px;
				background-color :#793bea">
					질문하기</button>	
			</div>
		</div>

	<div class="main-qqqcontent">
		<div class="col-xs-12">
			<div class="main-qqqcontainer qqqhomepage">
				<div class="qqqcard qqqcard-tab">
					<div class="main-qqqtopbar-wrapper">
						<ul class="main-qqqfilter sub-qqqfilter pull-qqqright qqqtabs">
							<li class="filter-qqqitem active"><a href="/">최신순</a></li>
							<li class="filter-qqqitem "><a href="#">dd</a></li>
							<li class="filter-qqqitem "><a href="#">asd</a></li>

						</ul>
						<ul class="main-qqqfilter sub-qqqfilter pull-left qqqtabs">
						</ul>
					</div>
					<table class="question-qqqtable">
						<tbody>
							<c:forEach items="${qnaList}" var="qna"> 
							<tr>
								<td style="width: 21%; padding-left: 5px;">
									<ul class="question-qqqstatistic">
										<li>
											<div>0</div> 답변수
										</li>
										<li>
											<div>0</div> 좋아요
										</li>
										<li>
											<div>${qna.qqViews}</div> 조회수			
										</li>
									</ul>
								</td>
								<td class="question-qqqcontent">
									<div class="question-qqqtitle">
										<a href="#">${qna.qqTitle}</a>
									</div>
									<div class="rowqqq question-qqqmeta">
										<div class="pull-left">
											<div class="tags">
												<a href="#" class="tags-item category"> <img src="">java
												</a>
											</div>
										</div>
										<div class="pull-right">
											<span class="question-qqqauthor"> <a href="#">
													${qna.membersId }&nbsp; </a> <span class="question-qqqdate">${qna.qqDate}</span>

											</span>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach> 
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>



</body>

</html>