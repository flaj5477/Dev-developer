<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">

</head>

<body class="">
	<!-- Page content -->
	<div class="container-fluid mt--5">
		<div class="card bg-secondary shadow">
			<div class="card-header bg-white border-0">
				<div class="row align-items-center">
					<div class="col">
						<h3 class="mb-0 text-center display-4">Apply to Project</h3>
					</div>
				</div>
			</div>
			<div class="card-body">
				<form>
					<h6 class="heading-small text-muted mb-4">User information</h6>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-username">Username</label>
									<input type="text" id="input-username"
										class="form-control form-control-alternative"
										placeholder="Username" value="lucky.jesse">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-email">Email
										address</label> <input type="email" id="input-email"
										class="form-control form-control-alternative"
										placeholder="jesse@example.com">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-first-name">First
										name</label> <input type="text" id="input-first-name"
										class="form-control form-control-alternative"
										placeholder="First name" value="Lucky">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label class="form-control-label" for="input-last-name">Last
										name</label> <input type="text" id="input-last-name"
										class="form-control form-control-alternative"
										placeholder="Last name" value="Jesse">
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />
					<!-- Address -->
					<h6 class="heading-small text-muted mb-4">Contact information</h6>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-control-label" for="input-address">Address</label>
									<input id="input-address"
										class="form-control form-control-alternative"
										placeholder="Home Address"
										value="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09"
										type="text">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-city">City</label>
									<input type="text" id="input-city"
										class="form-control form-control-alternative"
										placeholder="City" value="New York">
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-country">Country</label>
									<input type="text" id="input-country"
										class="form-control form-control-alternative"
										placeholder="Country" value="United States">
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-country">Postal
										code</label> <input type="number" id="input-postal-code"
										class="form-control form-control-alternative"
										placeholder="Postal code">
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />
					<!-- Description -->
					<h6 class="heading-small text-muted mb-4">Introduce yourself</h6>
					<div class="pl-lg-4">
						<div class="form-group">
							<label>Introduce yourself</label>
							<textarea rows="4" class="form-control form-control-alternative"
								placeholder="A few words about you ...">A beautiful Dashboard for Bootstrap 4. It is Free and Open Source.</textarea>
						</div>
					</div>
					<div class="text-center">
					<button class="btn btn-icon btn-3 btn-primary" type="button">
						<span class="btn-inner--icon"><i class="fas fa-paper-plane"></i></span>

						<span class="btn-inner--text">지원하기</span>

					</button>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>

</html>