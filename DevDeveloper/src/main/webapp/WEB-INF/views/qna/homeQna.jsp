<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/resources/assets/css/aaa.css"> --%>
  	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/dd.css"> 
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/ff.css"> --%>
<%-- 	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/gg.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/hh.css">  --%>

</head>
 <body> 
<div>
              
  <div class="col-xs-12">
      <div class="main-container homepage">
          <div class="card card-tab">
              <div class="main-topbar-wrapper">
                  <ul class="main-filter sub-filter pull-left tabs">
                      <li class="filter-item title-padding">
                          <span class="title">최근에 등록된 질문</span>
                      </li>
                  </ul>
                  <ul class="main-filter sub-filter pull-right tabs">
                      <li class="filter-item active">
                          <a href="/">최신순</a>
                      </li>
                      <li class="filter-item ">
                          <a href="?type=nonselect">d</a>
                      </li>
                      <li class="filter-item ">
                          <a href="?type=nonanswer">d</a>
                      </li>
                  </ul>
              </div>
              <table class="question-table">
                  <tbody>
                  
                      
                          <tr>
                          <td style="width: 24%">
                              <ul class="question-statistic">
                                  <li >
                                      <div>300</div>
                                      답변수
                                  </li>
                                  <li>
                                      <div>5000</div>
                                      좋아요
                                  </li>
                                  <li>
                                      <div>1000</div>
                                      조회수
                                  </li>
                              </ul>
                          </td>
                          <td class="question-content">
                              <div class="question-title">
                                  <a href="/tag/etc/question/316">ㅋㅁㄴㅇㅁㅇㅁㄴㅇㅋㅇㅋㅋ</a>
                              </div>
                              <div class="row question-meta">
                                  <div class="pull-left">
                                      <div class="tags">
                                      
                                           
                                              <a href="/tag/etc/question" class="tags-item category">
                                                  <img src="">etc
                                              </a>
                                          
                                      
                                      </div>
                                  </div>
                                  <div class="pull-right">
                                      <span class="question-date">2019.11.01 14:37:01</span>
                                      <span class="question-author">
                                          <a href="/user/601">
                                              김지민
                                              <span class="author-reputation">
                                                  0
                                              </span>
                                          </a>
                                      </span>
                                  </div>
                              </div>
                          </td>
                      </tr>
                      </tbody>
                      </table>
                      </div>
                      </div>
                      </div>
                      </div>
                      
			
</body>
</html>