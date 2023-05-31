<%@page import="com.smhrd.model.formVO"%>
<%@page import="java.sql.Connection"%>
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

<style type="text/css">
.container-xl, .container-lg, .container-md, .container-sm, .container {
	max-width: max-content;
}

.mb-3 {
	margin-bottom: 10px !important;
}

.g-3, .gx-3 { -
	-bs-gutter-x: -6rem;
}

#form {
	width: 800px;
	height: 500px;
}
</style>
</head>
<body>
	<%
	//세션 값 가져옴 loginM 키 값이 지정되어 있는 세션 값  56번 로그인 판단기준.
	MemberVO loginM = (MemberVO) session.getAttribute("loginM");
	formVO vo = (formVO) session.getAttribute("vo");
	/* 	Class.forName("com.mysql.jdbc.Driver");
		String dbUrl = "jdbc:mysql://project-db-stu.ddns.net:3307/smhrd_e_3?serverTimezone=UTC";
		String dbUser = "smhrd_e_3";
		String dbPass = "smhrde3"; */
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

		<a class="navbar-brand pe-3 ps-4 ps-lg-2" href="main.jsp"> Stock's
			talk</a>

		<!-- Navbar Items-->
		<ul class="navbar-nav align-items-center ms-auto">

			<!-- User Dropdown-->


			<!-- 로그인x  -->
			<%
			if (loginM == null) {
			%>
			<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
				<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="navbarDropdownUserImage" href="Login.jsp" aria-expanded="false"><img
					class="img-fluid" src="assets/img/demo/user-placeholder.svg" /></a>
			</li>
			<%
			} else {
			%>
			<!-- 로그인 o -->
			<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
				<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="navbarDropdownUserImage" href="javascript:void(0);"
				role="button" data-bs-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><img class="img-fluid"
					src="assets/img/illustrations/profiles/profile-1.png" /></a>
				<div
					class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
					aria-labelledby="navbarDropdownUserImage">
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="MypageEdit.jsp">
						<div class="dropdown-item-icon">
							<idata-feather="settings" > </i>
						</div> MyPage
					</a> <a class="dropdown-item" href="Logout">
						<div class="dropdown-item-icon">
							<i data-feather="log-out"></i>
						</div> Logout
					</a>
				</div>
			</li>
			<%
			}
			%>
		</ul>
	</nav>
	<!-- User Dropdown end -->
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
						<!-- Sidenav Accordion (NEWS2)-->
						<a class="nav-link collapsed" href="noticeList.jsp">
							<div class="nav-link-icon">
								<i data-feather="globe"></i>
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
								<a class="nav-link" href="MypageEdit.jsp">내정보수정</a> <a
									class="nav-link" href="form.jsp">게시물등록</a> <a class="nav-link"
									href="background.html">관심기업</a>
							</nav>
						</div>
						<%
						}
						%>
					</div>
				</div>

			</nav>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<header class="py-10 mb-4 bg-gradient-primary-to-secondary">
					<div class="container-xl px-4"></div>
				</header>
				<!-- Main page content-->
			</main>
			<!-- Main page content-->
			<div id="layoutSidenav_content">
				<div class="container">
					<div class="row" id="form">
						<form method="post" action="formService">
							<table class="table"
								style="text-align: center; border: 1px solid #dddddd;">
								<thead>
									<tr>
										<th colspan="2"
											style="background-color: #eeeeee; text-align: center;">
											게시판 글쓰기</th>
									</tr>
								</thead>
								<tbody>
									<tr style="display: none">
										<td><input style="color: black;" type="text" class="form-control" placeholder="이메일" name="email" maxlength="50" value="<%= loginM.getEmail() %>"></td>
									</tr>
									<tr style="display: none">
										<td><input type=""text"" class="form-control" placeholder="닉네임" name="nick" maxlength="50" value="<%= loginM.getNick() %>"></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control"
											placeholder="글 제목" name="title" maxlength="50"></td>
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="글 내용"
												id="content" name="content" maxlength="3000"
												style="height: 350px"></textarea></td>
									</tr>


									<tr>
										<td>
											<button type="submit" class="btn btn-primary">저장</button>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

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
</body>
</html>
