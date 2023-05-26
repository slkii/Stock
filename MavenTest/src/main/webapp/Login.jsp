<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Stock's talk</title>
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<style type="text/css">
.container-xl, .container-lg, .container-md, .container-sm, .container {
    max-width: max-content;
}
.mb-3 {
    margin-bottom: 10px!important;
}
#layoutSidenav #layoutSidenav_content{

}
.g-3, .gx-3 {
    --bs-gutter-x: -6rem;
}
.layoutSidenav_content {
  width: 100%;
  height: 100%;
  text-align: center;
}
.layoutSidenav_content::after {
  width: 100%;
  height: 100%;
  content: "";
  background:url("https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80");
}
</style>
</head>


<body class="nav-fixed">
	<%
	MemberVO loginM = (MemberVO) session.getAttribute("loginM");
	%>
	<nav
		class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white"
		id="sidenavAccordion">
		<!-- Sidenav Toggle Button-->
		<button
			class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0"
			id="sidebarToggle">
			<i data-feather="menu"></i>
		</button>
		<!-- Navbar Brand-->
		<!-- * * Tip * * You can use text or an image for your navbar brand.-->
		<!-- * * * * * * When using an image, we recommend the SVG format.-->
		<!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
		<a class="navbar-brand pe-3 ps-4 ps-lg-2" href="main.jsp">
			Stock's talk</a>

		<!-- Navbar Items-->
		<ul class="navbar-nav align-items-center ms-auto">

			<!-- User Dropdown-->

			<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
				<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="navbarDropdownUserImage" href="Join.jsp" aria-expanded="false"><img
					class="img-fluid" src="assets/img/demo/user-placeholder.svg" /></a>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sidenav shadow-right sidenav-light">
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
						<!-- Sidenav Menu Heading (Core)-->
						<div class="sidenav-menu-heading">MENU</div>
						<!-- Sidenav Accordion (NEWS1)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i data-feather="activity"></i>
							</div> NEWS <!--  <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  사이드바 드롭다운 -->
						</a>
						<!-- Sidenav Accordion (NEWS2)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseApps"
							aria-expanded="false" aria-controls="collapseApps">
							<div class="nav-link-icon">
								<i data-feather="globe"></i>
							</div> NEWS 2 <!--  <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  사이드바 드롭다운 -->
						</a>
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<header class="py-10 mb-4 bg-gradient-primary-to-secondary">
					<div class="container">
						<div class="text-center">
							<h1 class="text-white">Login</h1>
							<p class="lead mb-0 text-white-50">로그인 후 이용해 주세요.</p>
						</div>
					</div>
				</header>
			</main>
			<!-- Main page content-->

			<div id="layoutSidenav_content">
				<main>
					<!-- Login page-->
					<div class="container">
						<div class="row">
						<div class="card mb-4">
							<div class="card-header" style="text-align: center;">LOGIN</div>
							<div class="card-body">
								<form action="LoginService" method="post">
									<!-- Form Row-->
									<div class="row gx-3 mb-3">
										<!-- Form Group email address-->
										<div class="mb-3">
											<label class="small mb-1" for="inputFirstName">Email
												address</label> <input name="email" class="form-control"
												id="inputFirstName" type="email"
												placeholder="Enter your Email" value="" />
										</div>
									</div>
									<!-- Form Group (password)-->
									<div class="row gx-3 mb-3">
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">password</label>
											<input name="pw" class="form-control" id="inputEmailAddress"
												type="password" placeholder="Enter your Password" value="" />
										</div>
									</div>
									<!-- Submit button-->
									<div align="center">
									<button class="btn btn-primary" type="submit" id="btn-submit">Login</button>
									</div>
								</form>
								<div align="center"; style="margin-top:10px" >
									<a href="Join.jsp"><button class="btn btn-primary">Join
											Up</button></a>
								</div>
							</div>
						</div>
					</div>
					</div>
				</main>
			</div>
			<footer class="footer-admin mt-auto footer-light">

			</footer>
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script>
		$(document).ready(function() {
			$('#btn-submit').prop('disabled', true);
			$('input').keyup(function() {
				var empty = false;
				$('input').each(function() {
					if ($(this).val() === '') {
						empty = true;
						return false;
					}
				});	
				if (empty) {
					$('#btn-submit').prop('disabled', true);
				} else {
					$('#btn-submit').prop('disabled', false);
				}
			});
		});
	</script>
</body>
</html>
