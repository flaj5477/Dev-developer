<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--

=========================================================
* Argon Dashboard - v1.1.0
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2019 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
</head>
<script>
	function checkForm() {
		if ($("#participantName").val() == "") {
			alert("이름을 입력해야합니다")
			return false;
		} else if ($("#email").val() == "") {
			alert('이메일을 입력하세요')
			return false;
		} else if ($("#phoneNo").val() == "") {
			alert('핸드폰 번호를 입력하세요')
			return false;
		} else if ($("#address").val() == "") {
			alert('주소를 입력하세요')
			return false;
		} else if ($("#coverLetter").val() == "" || parseInt($("#count").html()) < 100) {
			alert('자기소개서를 작성해 주세요(최소 100자)')
			return false;
		} else {
			$("#frm").submit();
		}
	}

	
	$(function() {
		var countSpan = document.getElementById('count');
		var message = '';
		var MAX_MESSAGE_BYTE = 3000;

				$('#coverLetter').keyup(function(event) {
					const totalByte = count(event.target.value);

					if (totalByte <= MAX_MESSAGE_BYTE) {
						countSpan.innerText = totalByte.toString();
						message = event.target.value;
					} else {
						alert(MAX_MESSAGE_BYTE + "바이트까지 전송가능합니다.");
						countSpan.innerText = count(message).toString();
						event.target.value = message;
					}
				});

				
				$('#max-count').html(MAX_MESSAGE_BYTE.toString());

				function count(message) {
					var totalByte = 0;

					for (var index = 0, length = message.length; index < length; index++) {
						var currentByte = message.charCodeAt(index);
						(currentByte > 128) ? totalByte += 2 : totalByte++;
					}
					return totalByte;
				}
			})
</script>
<body class="">
	<!-- Page content -->
	<div class="container-fluid mt-5">
		<div class="card bg-secondary shadow">
			<div class="card-header bg-white border-0">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="mb-0 text-center display-4">Apply to Project</h3>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form action="applyProjects" id="frm">
					<h6 class="heading-small text-muted mb-4">User information</h6>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-username">Name</label> <input type="text" id="participantName" name="participantName" class="form-control form-control-alternative" placeholder="Name">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-email">Email address</label> <input type="email" id="email" name="email" class="form-control form-control-alternative" placeholder="jesse@example.com">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-first-name">Phone Number</label> <input type="text" id="phoneNo" name="phoneNo" class="form-control form-control-alternative" placeholder="***-****-****">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-last-name">Address</label> <input type="text" id="address" name="address" class="form-control form-control-alternative" placeholder="서울 광역시 강남구  119-11">
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />
					<!-- Description -->
					<h6 class="heading-small text-muted mb-4">Introduce yourself</h6>
					<div class="pl-lg-4">
						<div class="form-group">
							<label>Introduce yourself</label> <span>(</span><span id="count">0</span>/<span id="max-count">0</span><span>byte)</span>
							<textarea rows="4" class="form-control form-control-alternative" id="coverLetter" name="coverLetter" placeholder="Let me introduce yourself.."></textarea>
						</div>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-icon btn-3 btn-primary" onclick="checkForm()">
							<span class="btn-inner--icon"><i class="fas fa-paper-plane"></i></span> <span class="btn-inner--text">지원하기</span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>