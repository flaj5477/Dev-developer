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
		태그 클릭
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
			<h1>위키가이드 태그목록</h1>
	</div>
	
	<div class="row" id="wikiList">	
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