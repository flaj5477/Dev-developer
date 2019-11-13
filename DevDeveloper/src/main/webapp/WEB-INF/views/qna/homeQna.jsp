<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gg.css"> --%>
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ff.css"> --%>
<%-- 	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/hh.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/qna.css">
<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
	
</head>
<body id = "pp">
<div class="container-fluid mt--3">
	<div class="main-qqqcontent">
	<div class="mb-4"> <!-- roww -->
		
			 <button class="btn btn-darkblue" type="submit" id="qqqbutton"
			 onclick="location.href='insertQna'">
					질문하기</button>	
					<form name ="searchform" method ="post">
			<input class="form-control" name="searchVal" placeholder="Search"
					type="text" style="border: #686ce4 1px solid; width:180px;  float :right">
					<input type="hidden" name="page" value="1"> 
				</form>	
		</div>
	
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
								<td style="width: 27%; padding-left: 25px;">
									<ul class="question-qqqstatistic">
										<li>
											<div>0</div> 답변수
										</li>
										<li>
											<div>0</div> 좋아요
										</li>
										<li>
											<div>${qna.qViews}</div> 조회수			
										</li>
									</ul>
								</td>
								<td class="question-qqqcontent">
									<div class="question-qqqtitle">
										<a href="qnaNo?qNo=${qna.qNo}">${qna.qTitle}</a>
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
													${qna.membersId }&nbsp; </a> <span class="question-qqqdate">${qna.qDate}</span>
											</span>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach> 
						</tbody>
					</table>
					<my:paging paging="${paging}" jsFunc="go_page" />
				</div>
			</div>
		</div>
	</div>
</div>

	
	<script>
		function go_page(p) {
		 	document.searchform.page.value = p 
			document.searchform.submit()
		}
	</script>


</body>

</html>