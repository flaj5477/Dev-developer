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
 <body id ="qq">
         <div class="main-qqqcontent">
         	<form name="searchfrm">
					<div class="row mb-3">
						<div class="col-xl-3 col-lg-4 col-md-5 col-sm-6 col-xs-7">
							<input class="form-control" name="searchVal" placeholder="Search" type="text" style="border:#686ce4 1px solid">
							<input type="hidden" name="page" value="1">			
						</div>
						<div>
							<button class="btn btn-icon btn-2 btn-primary">
							<span class="btn-inner-icon"><i class="fas fa-search"></i></span>
							</button>
						</div>
						</div>
						</form>
    		<div class="col-xs-12">
      		  <div class="main-qqqcontainer qqqhomepage">
          		  <div class="qqqcard qqqcard-tab">
              		  <div class="main-qqqtopbar-wrapper">
              		    <ul class="main-qqqfilter sub-qqqfilter pull-qqqright qqqtabs">
                        <li class="filter-qqqitem active">
                            <a href="/">최신순</a>
                        </li>
                        <li class="filter-qqqitem ">
                            <a href="#">dd</a>
                        </li>
                        <li class="filter-qqqitem ">
                            <a href="#">asd</a>
                        </li>
                    </ul>
                 	   <ul class="main-qqqfilter sub-qqqfilter pull-left qqqtabs">
                  	    </ul>

                </div>
                <table class="question-qqqtable">
                    <tbody>
                    
                        
                            <tr>
                            <td style="width: 21%; padding-left:5px;">
                                <ul class="question-qqqstatistic">
                                    <li >
                                        <div>0</div>
                                        답변수
                                    </li>
                                    <li>
                                        <div>0</div>
                                        좋아요
                                    </li>
                                    <li>
                                        <div>0</div>
                                        조회수
                                    </li>
                                </ul>
                            </td>
                            <td class="question-qqqcontent">
                                <div class="question-qqqtitle">
                                    <a href="#">제목</a>
                                </div>
                                <div class="rowqqq question-qqqmeta">
                                    <div class="pull-left">
                                        <div class="tags">                                                                        
                                                <a href="#" class="tags-item category">
                                                    <img src="">java
                                                </a>                                                   
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <span class="question-qqqauthor">
                                            <a href="#">
                                                memebersname&nbsp;	
                                            </a>                                       
                                        <span class="question-qqqdate">2시간 전</span>

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