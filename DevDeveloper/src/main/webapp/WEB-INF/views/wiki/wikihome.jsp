<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	pageName="위키가이드";
	
	function formSubmit(n){
		var form = document.frm;
		form.manualNo.value = n;
		form.submit();
	}
</script>
</head>


<!-- 
	20191021 곽동우 위키목록뿌리기추가
	
 -->
<body>
위키입니다
	<%-- <form action="getwiki" method="post">
		<c:forEach items="${wikiMap }" var="wiki">
			${wiki.manualNo}	<a href=${wiki.manualOriUrl}>${wiki.manualOriUrl} </a> 
			<a href ="getWiki?manualNo=${wiki.manualNo}">${wiki.manualContents}</a> <br>
		</c:forEach>
	</form> --%>
	
	<button onclick="location.href='insertWikiForm'">등록</button>
	
	<div class="card shadow">
            <div class="card-header border-0">
              <div class="row align-items-center">
                <div class="col">
                  <h3 class="mb-0">Card tables</h3>
                </div>
                <div class="col text-right">
                  <a href="insertWikiForm" class="btn btn-sm btn-primary">문서등록</a>
                </div>
              </div>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">Title</th>
                    <th scope="col">Status</th>
                    <th scope="col">Completion</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${wikiMap }" var="wiki">
                  <tr id="wikitd" onclick="location.href='getWiki?manualNo=${wiki.manualNo}'">
                    <th scope="row">
                      
                        <div class="media-body">
                          <span class="mb-0 text-sm">${wiki.manualNo}</span>
                        </div>
                     
                    </th>
                    <td>
                      ${wiki.manualOriUrl}
                    </td>
                    <td>
                      <span class="badge badge-dot mr-4">
                        ${wiki.manualOriUrl}
                      </span>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <span class="mr-2">60%</span>
                        <div>
                          <div class="progress">
                            <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td class="text-right">
                      <div class="dropdown">
                        <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="fas fa-ellipsis-v"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="card-footer py-4">
              <nav aria-label="...">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                      <i class="fas fa-angle-left"></i>
                      <span class="sr-only">Previous</span>
                    </a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">
                      <i class="fas fa-angle-right"></i>
                      <span class="sr-only">Next</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
	
</body>
</html>