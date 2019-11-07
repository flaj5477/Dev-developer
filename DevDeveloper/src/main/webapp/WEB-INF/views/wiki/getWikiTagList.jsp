<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		hover();
		tagClick();
	});

	
	/*
		곽동우
		20191103
		다른번역 클릭
	*/
	function tagClick(){
		$('body').on('click','#wikiList li',function(){
			
			tagTitle = $(this).attr('id');
			
			location.href = "wikihome?select=tags&page=1&searchVal=" + tagTitle;
		});
	}



	function hover(){
		$('li').hover(function() {	// on이벤트? 해줘야됨
			$(this).css("background-color", "#f4f5f7");
		}, function(){
			$(this).css("background-color", "transparent ");
		});
	}

</script>
</head>

<body>

	<div class="row pb-3">
		<button type="button" class="btn btn-danger" onclick="location.href='wikihome'">목록</button>
	</div>
	
	<div>
			<h1>위키가이드</h1>
	</div>
	
	<div class="row" id="wikiList">	
			<%-- <c:forEach items="${tagList}" var="tag">
	            <div class="col-xl-3 col-lg-6">
	              <div class="card card-stats mb-4 mb-xl-0">
	                <div class="card-body"  id="${tag.manualTags }">
	                  <div class="row">
	                    <div class="col">
	                      <span class="h2 font-weight-bold text-uppercase mb-0">${tag.manualTags }</span>
	                      <h5 class="card-title text-muted mb-0">${tag.tagsContents }</h5>
	                    </div>
	                  </div>
	                  <p class="mt-3 mb-0 text-muted text-sm">
	                    <span class="text-success mr-2"><i class="fa fa-arrow-up"></i>${tag.countTags }개</span>
	                    <span class="text-nowrap">${tag.countTags }개</span>
	                  </p>
	                </div>
	              </div>
	            </div>
            </c:forEach> --%>
            
            <div id="${tag.manualTags }">
            	<ul>
		            <c:forEach items="${tagList}" var="tag">
	                     <li id="${tag.manualTags }" data-toggle="tooltip" data-placement="right" title="${tag.tagsContents }">
	                     	${tag.manualTags }
	                     </li>
		            </c:forEach>
	            </ul>
            </div>
</div>
</body>
</html>