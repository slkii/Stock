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
                  <a class="nav-link collapsed" href="noticeList.jsp">
                     <div class="nav-link-icon">
                        <i data-feather="globe" ></i>
                     </div> 게시판 <!--  <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  사이드바 드롭다운 -->
                  </a>
                  <!-- Sidenav Accordion (My Page)-->
                  <%
                  if (loginM != null) {
                  %>
                  <a class="nav-link collapsed" href="javascript:void(0);"
                     data-bs-toggle="collapse" data-bs-target="#collapseUtilities"
                     aria-expanded="false" aria-controls="collapseUtilities">
                     <div class="nav-link-icon">
                        <i data-feather="tool"></i>
                     </div> My Page
                     <div class="sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                     </div>
                  </a>
                  <div class="collapse" id="collapseUtilities"
                     data-bs-parent="#accordionSidenav">
                     <nav class="sidenav-menu-nested nav">
                        <a class="nav-link" href="MypageEdit.jsp">내정보수정</a>
                        <a class="nav-link" href="form.jsp">게시물등록</a> 
                        <a class="nav-link" href="background.html">관심기업</a>
                     </nav>
                  </div>
                  <%
                  }
                  %>
               </div>
            </div>

         </nav>
      </div>
			<!-- Main page content-->


			<div id="layoutSidenav_content">
				<main>
					<!--  page-->
				<div class="container">
						<div class="row">
						<div class="card mb-4">
							<div class="card-header">Join-UP</div>
							<div class="card-body">
								<form action="JoinService" method="post">
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
									<!-- Form Group (nink name)-->
									<div class="row gx-3 mb-3">
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">name</label>
											<input name="nick" class="form-control"
												id="inputEmailAddress" type="text"
												placeholder="Enter your Name" value="" />
										</div>
									</div>
									<!-- Form Group (password)-->
									<div class="row gx-3 mb-3">
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">password</label>
											<input name="pw" class="form-control" type="password"
												placeholder="Enter your Password" value="" />
										</div>
									</div>
									<!-- Form Group (email address)-->
									<div class="row gx-3 mb-3">
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">phone
												number</label> <input name="tel" class="form-control" type="text"
												placeholder="Enter your Phone number" value="" />
										</div>
									</div>
									<!-- Form Group (email address)-->
									<div class="row gx-3 mb-3">
										<div class="mb-3">
											<label class="small mb-1" for="inputEmailAddress">address</label>
											<input name="addr" class="form-control" type="text"
												placeholder="Enter your Address" value=""/>
										</div>
									</div>
									<div align="center">
									<!-- Submit button-->
									<button class="btn btn-primary" type="submit" id="btn-submit">join</button>
									<button class="btn btn-primary" type="reset">reset</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					</div>
				</main>
			</div>
			<footer class="footer-admin mt-auto footer-light">
				<div class="container-xl px-4">
					<div class="row">
						<div class="col-md-6 small">Copyright &copy; Your Website
							2021</div>
						<div class="col-md-6 text-md-end small">
							<a href="#!">Privacy Policy</a> &middot; <a href="#!">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
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
