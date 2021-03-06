<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div h5 {
  /* overflow: hidden; */
  /* text-overflow: ellipsis; */
  /* white-space: nowrap; */
/*   width: 100px;
  height: 40px; */
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	pageName = "Tags";

	$(function(){
		hover();
		//tagClick();
	});

	//태그클릭
	function clickTag(e,tag){
		//e.stopPropagation();
		location = "wikihome?select=tags&page=1&searchVal="+encodeURIComponent(tag);	// encodeURIComponent(tag) get방식은 파라미터넘길때 인코딩 해줘야함
	}
	function clickProjTag(e,tag){
		//e.stopPropagation();
		location = "getProjectsList?select=tags&page=1&searchVal="+encodeURIComponent(tag);	// encodeURIComponent(tag) get방식은 파라미터넘길때 인코딩 해줘야함
	}
	
/* 	function clickQnaTag(e,tag){
		//e.stopPropagation();
		location = "qna?tags&page=1&searchVal="+encodeURIComponent(tag);	// encodeURIComponent(tag) get방식은 파라미터넘길때 인코딩 해줘야함
	}	 */
	
	/*
		곽동우
		20191103
		다른번역 클릭
	*/
/* 	function tagClick(){
		$('body').on('click','.card-body',function(){
			
			tagTitle = $(this).attr('id');
			
			location.href = "wikihome?select=tags&page=1&searchVal=" + tagTitle;
		});
	}
 */


	function hover(){
		$('.card-body').hover(function() {	// on이벤트? 해줘야됨
			$(this).css("background-color", "#f4f5f7");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}

</script>
</head>

<body>
	<%-- <c:if test="${sessionScope.members.membersGrade eq 5}"> --%>
		<!-- <div class="row nav nav-pills justify-content-end pt-5 pr-5">
			<div class="text-right">
				<a href="tagManageForm" class="btn btn-lg btn-danger">태그관리</a>
			</div>
		</div> -->
	<%-- </c:if> --%>
	<div class="row p-5">
		<c:forEach items="${tagList}" var="tag">
            <div class="col-xl-3 col-lg-6 p-1">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body"  id="${tag.tagsTitle }">
                	<p class="mt-3 mb-0 text-muted text-sm">
	                    <a href="javascript:clickQnaTag(event,'${tag.tagsTitle}')" class="badge badge-primary">Q&A-${tag.qCount }건</a>
	                    <a href="javascript:clickProjTag(event,'${tag.tagsTitle}')" class="badge badge-primary">프로젝트: ${tag.pCount }</a>
	                    <a href = "javascript:clickTag(event,'${tag.tagsTitle}')"  class="badge badge-primary">위키: ${tag.wCount }</a>
                  	</p>
                  <div class="row">
                    <div class="col">
                      <span class="h2 font-weight-bold text-uppercase mb-0">${tag.tagsTitle }</span>
                      <h5 class="card-title text-muted mb-0">"${tag.tagsContents }"</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </c:forEach>
	</div>
</body>
</html>