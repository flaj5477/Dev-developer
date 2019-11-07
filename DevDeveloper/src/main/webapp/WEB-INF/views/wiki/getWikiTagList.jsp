<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* div h5 {
  /* overflow: hidden; */
  /* text-overflow: ellipsis; */
  /* white-space: nowrap; */
/*   width: 100px;
  height: 40px; */
} */
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
		$('body').on('click','.card-body',function(){
			
			tagTitle = $(this).attr('id');
			
			location.href = "wikihome?select=tags&page=1&searchVal=" + tagTitle;
		});
	}



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

<div class="row pb-3">
	<button type="button" class="btn btn-danger" onclick="location.href='wikihome'">목록</button>
</div>

<div class="row">	
			<c:forEach items="${tagList}" var="tag">
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
            </c:forEach>
            
            
            
            
            
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">New users</h5>
                      <span class="h2 font-weight-bold mb-0">2,356</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-chart-pie"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
                    <span class="text-nowrap">Since last week</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Sales</h5>
                      <span class="h2 font-weight-bold mb-0">924</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
                    <span class="text-nowrap">Since yesterday</span>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Performance</h5>
                      <span class="h2 font-weight-bold mb-0">49,65%</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-info text-white rounded-circle shadow">
                        <i class="fas fa-percent"></i>
                      </div>
                    </div>
                  </div>
                  <p class="mt-3 mb-0 text-muted text-sm">
                    <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
                    <span class="text-nowrap">Since last month</span>
                  </p>
                </div>
              </div>
            </div>
          </div>
</body>
</html>