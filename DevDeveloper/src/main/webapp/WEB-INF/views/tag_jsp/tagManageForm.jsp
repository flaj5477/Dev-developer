<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form id="form1">
		  <div class="form-group row">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
		    <div class="col-sm-10">
		      <input type="text" name="id" class="form-control" id="inputEmail3" placeholder="ID">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="inputPassword3" class="col-sm-2 col-form-label">Name</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="name" id="inputPassword3" placeholder="name">
		    </div>
		  </div>
		  <fieldset class="form-group">
		    <div class="row">
		      <legend class="col-form-label col-sm-2 pt-0"></legend>
		      <div class="col-sm-10">
		        <div class="form-check">
		          <input class="form-check-input" type="radio" name="role" id="gridRadios1" value="Admin" checked>
		          <label class="form-check-label" for="gridRadios1">
		            	관리자
		          </label>
		        </div>
		        <div class="form-check">
		          <input class="form-check-input" type="radio" name="role" id="gridRadios2" value="User">
		          <label class="form-check-label" for="gridRadios2">
		            	사용자
		          </label>
		        </div>
		        
		      </div>
		    </div>
		  </fieldset>
		  <div class="form-group row">
		    <div class="col-sm-10">
		      <button type="button" id="btnInsert" class="btn btn-primary">Sign in</button>
		      <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
			  <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
		    </div>
		  </div>
		</form>
	</div>

	<div class="container">
		<h2>사용자 목록</h2>	
		<table class="table text-center">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>패스워드</th>
					<th>롤</th>
				</tr>
			</thead>
			<tbody>
		
			</tbody>
		</table>
	</div>
	
</body>
</html>