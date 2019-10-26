<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
</head>
<body>
	${wiki.manualNo}<br>
	${wiki.manualTitle}<br>
	${wiki.manualContentsPath}<br>
	${wiki.manualOriUrl}<br>
	${wiki.manualTags}<br>
	<form action="updateWikiForm">
		<input type="hidden" name="manualNo" value="${wiki.manualNo}">
	
		<div class="col">
			<div class="row align-items-center">
				<div class="col">
					<div class="ct-page-title">
			          <h1 class="ct-title" id="content">${wiki.manualTitle}</h1>
			        </div>
		        </div>
		        <div class="col">
			        <div class="nav nav-pills justify-content-end">
			        	<button class="btn btn-primary">수정</button>
			        </div>
		        </div>
		    </div>
		
			<hr>
			${wiki.manualContents }
		</div>
	</form>
		
		
		
</body>
</html>