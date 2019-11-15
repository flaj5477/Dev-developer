<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>login test</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/assets/img/brand/favicon.png"
	rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">

<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/loginstyle.css">
 


</head>

<body id="loginform">

	<form action="login" method="POST" class="loginform"
		style="background: #A18EF4;">
		<svg class="loginform" id="ryan" viewBox="0 0 120 120"
			xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243"
				stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32"
				fill="#e0a243" stroke="#000" stroke-width="2.5"
				stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32"
				fill="#e0a243" stroke="#000" stroke-width="2.5"
				stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000"
				stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000"
				stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000"
				stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path
				d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
				fill="#fff" />
                <path
				d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71"
				fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round"
				stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65"
				fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path
				d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105"
				fill="#fff" />
        </svg>
		<input type="text" placeholder="아이디" name="membersId" id="loginid"
			class="loginform"> <input type="password" placeholder="비밀번호"
			name="membersPw" id="loginpw" class="loginform"> <br>
		<div class="form-group">
			<span class="font-weight-bold text-black" id="spanLoginCheck"></span>
		</div>

		<div class="text-center" class="loginform">
			<button type="button" id="loginBtn" class="btn btn-primary my-4">로그인</button>
		</div>

	</form>

	<script>
		$('#loginBtn').click(function() {
			var id = $('#loginid').val();
			var pw = $('#loginpw').val();
			$.ajax({
				type : 'POST',
				url : 'login',
				data : {
					membersId : id,
					membersPw : pw,
				},
				success : function(data) {
					if (data == 0) { //로그인 실패시
						console.log(data);
						$('#spanLoginCheck').text('로그인 정보를 정확히 입력해주세요.');
					} else { //로그인 성공시
						if (loginmode == 'page') {
							console.log(data);
							location.href = '${sessionScope.prepage}';
							
						} else if(loginmode =='wiki'){
							  
							location.reload();
							
						}  
						else {
							 
							location.href = 'getDashboard'
						}
				

					}
				}
			});
		});
		
		//엔터키로 버튼클릭
		$('#loginpw,#loginid').keypress(function(event){
		     if ( event.which == 13 ) {
		         $('#loginBtn').click();
		         return false;
		     }
		});
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/loginscript.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>