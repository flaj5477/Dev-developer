<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입테스트</title>
<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/assets/img/brand/favicon.png"
	rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link
	href="${pageContext.request.contextPath}/resources/assets/js/plugins/nucleo/css/nucleo.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=1.1.0"
	rel="stylesheet" />
 



<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	/* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none;
	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.eheck_font {
	font-size: 13px;
	color: crimson;
}

form#signForm {
	width: 320px;
	padding: 60px 25px 80px;
	margin: 50px auto;
	background: #f8d348;
	display: flex;
	flex-direction: column;
}
</style>
</head>
<body>
	<!-- Table -->
	<div class="header bg-gradient-primary py-7 py-lg-8">
		<div class="container">
			<div class="header-body text-center mb-5">
				<div>
					<div>
						<h1 class="text-white">ddddddddddd!</h1>
						<p class="text-lead text-light">ㅎddddddddddd.</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<form action="signup" method="post" id="signForm"
		enctype="multipart/form-data" style="width: 450px">
		<div style="text-align : center; padding:0px 0px 7px 0px;">
			<div class="custom-control custom-radio mb-3" style ="display : inline-block">
				<input name="membersType" class="custom-control-input"
					id="customRadio5" checked="checked" type="radio" value="일반">
				<label class="custom-control-label" for="customRadio5">일반</label>
			</div>
			&nbsp;
			<div class="custom-control custom-radio mb-3" style ="display : inline-block">
				<input name="membersType" class="custom-control-input"
					id="customRadio6" value="기업" type="radio"> <label
					class="custom-control-label" for="customRadio6">기업</label>
			</div>
		</div>


		<div class="form-group">
			<div id="idv" class ="input-group input-group-alternative mb-3">
				<input name="membersId" id="membersId" class="form-control"
					placeholder="아이디" type="text">
			</div>
			<div class="eheck_font" id="id_check"></div>
		</div>

		<div class="form-group">
			<div id="pw1v" class ="input-group input-group-alternative mb-3">
				<input name="membersPw" id="membersPw" class="form-control"
					placeholder="비밀번호" type="password">
			</div>
			<div class="eheck_font" id="pw_check"></div>
		</div>

		<div class="form-group">
			<div id="pw2v" class ="input-group input-group-alternative mb-3">
				<input name="membersPw2" id="membersPw2" class="form-control"
					placeholder="비밀번호 확인" type="password">
			</div>
			<div class="eheck_font" id="pw2_check"></div>
		</div>

		<div class="form-group">
			<div id="namev" class ="input-group input-group-alternative mb-3">
				<input name="membersName" id="membersName" class="form-control"
					placeholder="이름" type="text">
			</div>
			<div class="eheck_font" id="name_check"></div>
		</div>

		<div id="wrap"
			style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
				id="btnFoldWrap"
				style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
				onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>

		<div class="form-group">
			<div id="telv" class ="input-group input-group-alternative mb-3">
				<input name="membersTel" id="membersTel" class="form-control"
					placeholder="연락처('-'없이 번호만 입력해주세요)" type="text">

			</div>
			<div class="eheck_font" id="phone_check"></div>
		</div>

		<div class="form-group">
			<div id="mailv" class ="input-group input-group-alternative mb-3">
				<input name="membersMail" id="membersMail" class="form-control"
					placeholder="이메일" type="email">

			</div>
			<div class="eheck_font" id="email_check"></div>
		</div>

		<div class="form-group">
			<div style="display: inline;" class ="input-group input-group-alternative mb-3">
				<input class="form-control"
					style="width: 40%; display: inline-block" placeholder="　우편번호"
					name="sample3_postcode" id="sample3_postcode" type="text"
					readonly="readonly" > &nbsp;&nbsp;
				<button style="padding: 9px" type="button" class="btn btn-secondary"
					onclick="sample3_execDaumPostcode()">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
		</div>

		<div class="form-group">
			<input class="form-control" placeholder="　주소" id="sample3_Addr"
				name="sample3_Addr" type="text" readonly="readonly" />
		</div>


		<div class="form-group">
			<div id="addrv" class ="input-group input-group-alternative mb-3">
				<input class="form-control" placeholder="　상세주소"
					name="sample3_detailAddress" id="sample3_detailAddress" type="text" />
			</div>
			<div class="eheck_font" id="addr_check"></div>
		</div>
		


 		<div class="filebox">
			<input class="upload-name" value="프로필사진" disabled="disabled">
			<label for="ex_filename">업로드</label> <input type="file"
				id="ex_filename" name="membersImage4" class="upload-hidden"
				onchange="fileCheck(this)" accept="image/jpeg, image/png"><br>jpg,jpeg,png 파일만 가능합니다.
		</div> 


		 
<!-- 	<div class="form-group">
			<input type="file" name="membersImage4"  onchange="fileCheck(this)" accept="image/jpeg, image/png">
			 jpg,jpeg,png 파일만 가능
	</div>  -->

		<div class="text-center">
			<button type="submit" class="btn btn-primary mt-4" id="usercheck">회원가입</button>
		</div>
		<br>
		<br> <input type="hidden" id="membersAddr" name="membersAddr" />
	</form>






	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
// 우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_wrap.style.display = 'none';
}

function sample3_execDaumPostcode() {
	// 현재 scroll 위치를 저장해놓는다.
	var currentScroll = Math.max(document.body.scrollTop,
			document.documentElement.scrollTop);
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				//		if (extraAddr !== '') {
				//			extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
				//		document.getElementById("sample3_extraAddress").value = extraAddr;

			//		} else {
				//		document.getElementById("sample3_extraAddress").value = '';
				//	}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample3_postcode').value = data.zonecode;
					document.getElementById("sample3_Addr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample3_detailAddress")
							.focus();

					document.getElementById('membersAddr').value = addr;

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_wrap.style.display = 'none';

					// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					document.body.scrollTop = currentScroll;
				},
				// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
				onresize : function(size) {
					element_wrap.style.height = size.height + 'px';
				},
				width : '100%',
				height : '100%'
			}).embed(element_wrap);

	// iframe을 넣은 element를 보이게 한다.
	element_wrap.style.display = 'block';
}

//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식  5에서 12자 
var idJ = /^[a-z0-9][a-z0-9]{4,11}$/;
// 비밀번호 정규식 6~15자
var pwJ = /^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}]{5,14}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,14}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식 숫자만
var phoneJ = /[0-9]/;


//var address = $('#sample3_detailAddress');

//아이디 중복확인
$("#membersId").blur(function() {
			if ($('#membersId').val() == '') {
				$('#id_check').text(
						'아이디를 입력하세요.');

			} else if (idJ.test($('#membersId')
					.val()) != true) {
				$('#id_check')
						.text('4~12자의 영문, 숫자만 사용 가능합니다.');
			} else {
				var membersId = $('#membersId')
						.val();
				$.ajax({
				// async : true,
				type : 'POST',
				data : {
					membersId : membersId
				},
				url : 'idsearch',
				dataType : 'json',
				// contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if (data.membersId != null) {
						$('#id_check').text('중복된 아이디 입니다.');
								$("#id_check").css('color','crimson');
								$("#usercheck").attr("disabled",true);
								$('#idv').attr('class','form-group has-danger');
							} else {
								$('#id_check').text('');
								$("#usercheck").attr("disabled",false);
								$('#idv').attr('class','form-group has-success');
								
								
									}
								}
								});//ajax/// 
					}//else if          
				});//blur 

					$('form')
							.on('submit',function() {
							var inval_Arr = new Array(6)
									.fill(false);
							if (idJ.test($('#membersId').val())) {
								inval_Arr[0] = true;
							} else {
								inval_Arr[0] = false;
								alert('아이디를 확인하세요.');
								return false;
							}
							
							 document.getElementById('membersAddr').value += ' '
							+ document.getElementById('sample3_detailAddress').value; 
							
							// 비밀번호가 같은 경우 && 비밀번호 정규식
							if (($('#membersPw').val() == ($('#membersPw2')
									.val()))
									&& pwJ.test($('#membersPw')
											.val())) {
								inval_Arr[1] = true;
							} else {
								inval_Arr[1] = false;
								alert('비밀번호를 확인하세요.');
								return false;
							}
							// 이름 정규식
							if (nameJ.test($('#membersName')
									.val())) {
								inval_Arr[2] = true;
							} else {
								inval_Arr[2] = false;
								alert('이름을 확인하세요.');
								return false;
							}

							// 이메일 정규식
							if (mailJ.test($('#membersMail')
									.val())) {
								inval_Arr[3] = true;
							} else {
								inval_Arr[3] = false;
								alert('이메일을 확인하세요.');
								return false;
							}
							// 휴대폰번호 정규식
							if (phoneJ.test($('#membersTel')
									.val())) {
								inval_Arr[4] = true;
							} else {
								inval_Arr[4] = false;
								alert('휴대폰 번호를 확인하세요.');
								return false;
							}
							
			
							//주소확인
							if (address.value == '') {
								inval_Arr[5] = false;
								alert('주소를 확인하세요.');
								return false;
							} else
								inval_Arr[5] = true;

							//전체 유효성 검사
							var validAll = true;
							for (var i = 0; i < inval_Arr.length; i++) {
								if (inval_Arr[i] == false) {
									validAll = false;
								}
							}
							


							if (validAll == true) { // 유효성 모두 통과
								alert('가입완료');
								return true;
							} else {
								alert('정보를 다시 확인하세요.')
								return false;
							}
						});

		$('#membersId')
				.blur(function() {
							if (idJ.test($('#membersId').val())) {
								console.log('true');
								$('#id_check').text('');
							} else {
								console.log('false');
								$('#id_check')
										.text('5~12자의 영문 소문자, 숫자, 특수문자만 사용 가능합니다.');
								$('#id_check').css('color',
										'crimson');
								$('#idv').attr('class','form-group has-danger');
									
							}
						});
					$('#membersPw').blur(function() {
						if (pwJ.test($('#membersPw').val())) {
							console.log('true');
							$('#pw_check').text('');
							$('#pw1v').attr('class','form-group has-success');
						} else {
							console.log('false');
							$('#pw_check').text('5~14자로 입력해주세요.');
							$('#pw1v').attr('class','form-group has-danger');
						}
					});

					//1~2 패스워드 일치 확인
					$('#membersPw2').blur(function() {
						if ($('#membersPw').val() != $(this).val()) {
							$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
							$('#pw2v').attr('class','form-group has-danger');

						} else {
							$('#pw2_check').text('');
							$('#pw2v').attr('class','form-group has-success');
						}
					});

					//이름에 특수문자 들어가지 않도록 설정
					$("#membersName").blur(function() {
						if (nameJ.test($(this).val())) {
							console.log(nameJ.test($(this).val()));
							$("#name_check").text('');
							$('#namev').attr('class','form-group has-success');
						} else {
							$('#name_check').text('이름을 확인해주세요');
							$('#namev').attr('class','form-group has-danger');
						}
					});
					$("#membersMail").blur(function() {
						if (mailJ.test($(this).val())) {
							$("#email_check").text('');
							$('#mailv').attr('class','form-group has-success');
						} else {
							$('#email_check').text('이메일 양식을 확인해주세요.');
							$('#mailv').attr('class','form-group has-danger');
						}
					});

					// 휴대전화
					$('#membersTel').blur(function() {
						if (phoneJ.test($(this).val())) {
							console.log(nameJ.test($(this).val()));
							$("#phone_check").text('');
							$('#telv').attr('class','form-group has-success');
						} else {
							$('#phone_check').text('숫자로 입력해주세요.');
							$('#telv').attr('class','form-group has-danger');
						}
					});
					// 상세주소
					$('#sample3_detailAddress').blur(function() {
						if ($('#sample3_detailAddress').val() == '') {
							$('#addr_check').text('상세주소를 입력해주세요.');
							$('#addrv').attr('class','form-group has-danger');
						}
						else{
							$("#addr_check").text('');
							$('#addrv').attr('class','form-group has-success');
						}
					});
					
					
					
					
					function fileCheck(obj) {
					    dot = obj.value.lastIndexOf('.');
					    filename = obj.value.substring(dot+1,obj.length);
					    filetype = filename.toLowerCase();
					    if(filetype=='jpg' || filetype=='png' || filetype=='jpeg') {
					        // 정상적인 이미지 확장자 파일일 경우 ...
					    } else {
					        alert('jpg,png,jpeg 파일만 가능합니다.');
					        parentObj  = obj.parentNode
					        node = parentObj.replaceChild(obj.cloneNode(true),obj);
					        return false;
					    }
					} 
					
					
 					$(document).ready(function(){
						var fileTarget = $('.filebox .upload-hidden');
						fileTarget.on('change', function(){// 값이 변경되면 
							if(window.FileReader){ // modern browser 
								var filename = $(this)[0].files[0].name; 
							}
							else { // old IE 
								var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
								} 
						// 추출한 파일명 삽입 
						$(this).siblings('.upload-name').val(filename);
						});
						}); 

					
						 
				
</script>
</body>

</html>