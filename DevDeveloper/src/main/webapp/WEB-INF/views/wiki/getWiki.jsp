<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${wiki.manualTitle}-DD</title>
<style>
.row{
  margin-right: 0px;
  margin-left: 0px;
  padding: 5px;
}
</style>
<script>
	pageName = "위키가이드";
	if("${wiki.manualContentsCheck }" == 0){
		alert("접근불가!");
		//history.go(-1);//첫번째 방법
		history.back();//두번째 방법
	}
	


	$(function(){
		
		btnControl();
		
	});
	
	//태그클릭
	function clickTag(e,tag){
		//e.stopPropagation();
		location = "wikihome?select=tags&page=1&searchVal="+encodeURIComponent(tag);	// encodeURIComponent(tag) get방식은 파라미터넘길때 인코딩 해줘야함
	}
	
	function btnControl(){
		$('#btnDelWiki').on('click', function(){
			/* document.frm.action.value = "deleteWiki";
			document.frm.submit(); */
			var result = confirm('정말삭제?'); 
			
			if(result) { //yes 
				$("#frm").attr("action", "deleteWiki").submit();
			} else { //no 
				return;
			}
		});
		
		$('#btnOriWiki').on('click', function(){
			$("#frm").attr("action", "getWiki").submit();
		});
		
		$('#btnTransWiki').on('click', function(){
			$("#frm").attr("action", "transWikiForm").submit();
			/* $("#frm").attr({
				"action": "transWikiForm",
				"method": "get"
			}).submit(); */
		});
		
		$('#btnGetTransWiki').on('click', function(){
			$("#frm").attr("action", "getWikiTrans").submit();
		});
		
		
	}

</script>
</head>
<body>
	<div class="main p-5">
		<form name="frm" id="frm" action="updateWikiForm" method="post">
			<c:if test="${sessionScope.members.membersGrade eq 5}">
				<span class="col-3 text-right">
					<button type="button" id="btnDelWiki" class="btn btn-danger">삭제</button>
					<button class="btn btn-primary">수정</button>
				</span>
			</c:if>
			<div class="nav-wrapper">
			    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0 active" id="btnOriWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true"><i class="fas fa-atlas text-purple"></i> 원문보기</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0" id="btnTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false"><i class="fas fa-edit"></i> 번역하기</a>
			        </li>
			        <li class="nav-item">
			            <a class="nav-link mb-sm-3 mb-md-0" id="btnGetTransWiki" data-toggle="tab" href="#" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false"><i class="fas fa-bible"></i> 번역본보기</a>
			        </li>
			    </ul>
			</div>
			<input type="hidden" name="manualNo" value="${wiki.manualNo}">
			<input type="hidden" name="manualContentsPath" value="${wiki.manualContentsPath}">
			<div class="col">
				<div class="row align-items-center">
					<div class="col">
						<div class="ct-page-title">
				          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
				          <span>
							<c:choose>
								<c:when test="${wiki.manualTags eq null}">
									<span class="badge badge-default"><a href = "wikihome?select=tags&page=1&searchVal=기타">기타</a></span>
								</c:when>
								<c:when test="${not empty wiki.manualTags}">
									<c:forEach items="${wiki.divTagList }" var="tag" varStatus="index">
										<span class="badge badge-default"><a href = "javascript:clickTag(event,'${tag}')">${tag}</a></span>
									</c:forEach>		
								</c:when>
							</c:choose>
						  </span>
				        </div>
			        </div>
			    </div>
			
			<hr>
			<p>${wiki.manualContents }</p>
			</div>
		</form>
	</div>
		
		
</body>
</html>