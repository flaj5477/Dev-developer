<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/qna.css">
<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
</head>
<body id = "pp">

<div class="container-fluid mt--3">
	<div class="main-qqqcontent">
	<div class="mb-4"> <!-- roww -->
		
			 <button class="btn qqqbutton" 
			 onclick="location.href='insertQna'">
					질문하기</button>	
					<form name ="searchform" method ="post">
			<input class="form-control" name="searchVal" placeholder="Search" value="${questionVO.searchVal}"
					type="text" style="border: #574775 1px solid; width:180px;  float :right">
					<input type="hidden" name="page" value="1"> 
				 	<input type="hidden" class ="orderby" id="orderby" name="orderby" value=""> 
					
				</form>	
		</div>
	
		<div class="col-xs-12">
			<div class="main-qqqcontainer qqqhomepage">
				<div class="qqqcard qqqcard-tab">
					<div class="main-qqqtopbar-wrapper" style="
    font-size: 13px;">
						<ul class="main-qqqfilter sub-qqqfilter pull-qqqright qqqtabs">
							<li class="filter-qqqitem <c:if test='${questionVO.orderby == "q_new" or empty questionVO.orderby}'>active</c:if>"><a href="qna">최신순</a></li>
							<li class="filter-qqqitem <c:if test='${questionVO.orderby == "count"}'>active</c:if>" id="count" style="cursor:pointer"">좋아요</li>
							<li class="filter-qqqitem <c:if test='${questionVO.orderby == "q_views"}'>active</c:if>" id="q_views" style="cursor:pointer">조회수</li>
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
									<c:choose>
									<c:when test ="${qna.aCount eq 0 }">
										<li>
											<div class="t">${qna.aCount}</div> 답변수
										</li>
									</c:when>
									<c:otherwise>
										<li class="fff">
											<div class="t">${qna.aCount}</div> 답변수
										</li>
									</c:otherwise>
									</c:choose>		
									<c:choose>
									<c:when test ="${qna.count eq 0 }">																		
										<li>
											<div>${qna.count}</div> 좋아요
										</li>
									</c:when>
									<c:otherwise>
										<li class="fff">
											<div>${qna.count}</div> 좋아요
										</li>		
									</c:otherwise>	
									</c:choose>
									<c:choose>
									<c:when test ="${qna.qViews < 100 }">					
										<li>
											<div>${qna.qViews}</div> 조회수			
										</li>
									</c:when>
									<c:otherwise>
										<li class = "ddd">
											<div>${qna.qViews}</div> 조회수			
										</li>									
									</c:otherwise>
									</c:choose>
									</ul>
								</td>
								<td class="question-qqqcontent">
									<div class="question-qqqtitle">
										<a href="qnaNo?qNo=${qna.qNo}">${qna.qTitle}</a>
									</div>
									<div class="rowqqq question-qqqmeta">
										<div class="pull-left">
										 <div class="tags">
										 	<%-- <c:choose>
										 	<c:when test="${qna.qTags eq null}">
										 	</c:when>
										 	<c:when test="${not empty qna.qTags}"> --%>
										 	<c:forEach var="tag" items="${qna.divTagList}">
												<a href="#" class="tags-item category">${tag}</a>
											</c:forEach>
								<%-- 			</c:when>
											</c:choose> --%>
											</div> 
											
										</div>
										<div class="pull-right">
											<span class="question-qqqauthor"> <a href="qna?&page=1&searchVal=${qna.membersId}">
												<img src="${pageContext.request.contextPath}/images/profile/${qna.membersImage}"
														width="32px" height="32px">&nbsp;${qna.membersId}&nbsp; </a> <span class="question-qqqdate">${qna.qDate}</span>
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
		
		$(document).ready(function(){ // When the DOM is Ready, then bind the click
		    $(".filter-qqqitem").click(function(){
		        var id = $(this).attr('id');
		        document.searchform.orderby.value = id 
				document.searchform.submit()
				
		    });	
		});
		

		  
		
		
	</script>


</body>

</html>