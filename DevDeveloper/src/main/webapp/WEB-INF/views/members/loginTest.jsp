<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>d</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<link href="../assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
td{
   border:1px solid #000000;
   border-collapse:collapse;
}
</style>
 

</head>
<body>

   <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3>
                </div>
              
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form action="signup" method="post" role="form" >   
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="membersId" name="membersId" placeholder="ID">
                        <div class="eheck_font" id="id_check"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input type="password" class="form-control" id="membersPw" name="membersPw" placeholder="PASSWORD">
                        <div class="eheck_font" id="pw_check"></div>
                    </div>
           
                    
                       <div class="form-group">
                        <label for="membersName">이름</label>
                        <input type="text" class="form-control" id="membersName" name="membersName" placeholder="Name">
                         <div class="eheck_font" id="name_check"></div>
                    </div>
        	
        	 <div class="form-group">
                        <label for="membersName">구분</label>
                        <input type="radio"   id="membersType" name="membersType" value="일반">일반
                        <input type="radio"   id="membersType" name="membersType" value="기업">기업
                         
                    </div>
                     <div class="form-group">
                        <label for="membersName">apdlf</label>
                        <input type="text" class="form-control" id="membersAddr" name="membersMail" placeholder="Name">
                         <div class="eheck_font" id="name_check"></div>
                    </div>
                    
                    
            

  <div class="form-group text-center">
       <button type="submit" class="btn btn-primary">회원가입</button> 
  </div>
                </form>
            </div>
        </article>
</body>
</html>