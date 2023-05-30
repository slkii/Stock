<%@page import="com.smhrd.model.Notice1VO"%>
<%@page import="com.smhrd.model.Notice1DAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.noticeDAO"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@page import="com.smhrd.model.noticeVO"%>
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
<title>Write Post - SB Admin Pro</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://unpkg.com/easymde/dist/easymde.min.css"
	rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
</head>
<!--ì¸ììì íì¼ì ë³´ ë°ìì¤ê¸°  -->


<body class="nav-fixed">
	<%
	Notice1VO nt1 = (Notice1VO) session.getAttribute("nt1");
	MemberVO loginM = (MemberVO) session.getAttribute("loginM");
	%>
	<%
	if (loginM == null) {
		response.sendRedirect("main.jsp");
	}
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
		<a class="navbar-brand pe-3 ps-4 ps-lg-2" href="index.html">SB
			Admin Pro</a>
		<!-- Navbar Search Input-->
		<!-- * * Note: * * Visible only on and above the lg breakpoint-->
		<form class="form-inline me-auto d-none d-lg-block me-3">
			<div class="input-group input-group-joined input-group-solid">
				<input class="form-control pe-0" type="search" placeholder="Search"
					aria-label="Search" />
				<div class="input-group-text">
					<i data-feather="search"></i>
				</div>
			</div>
		</form>
		<!-- Navbar Items-->
		<ul class="navbar-nav align-items-center ms-auto">
			<!-- Documentation Dropdown-->
			<li class="nav-item dropdown no-caret d-none d-md-block me-3"><a
				class="nav-link dropdown-toggle" id="navbarDropdownDocs"
				href="javascript:void(0);" role="button" data-bs-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
					<div class="fw-500">Documentation</div> <i
					class="fas fa-chevron-right dropdown-arrow"></i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-end py-0 me-sm-n15 me-lg-0 o-hidden animated--fade-in-up"
					aria-labelledby="navbarDropdownDocs">
					<a class="dropdown-item py-3"
						href="https://docs.startbootstrap.com/sb-admin-pro"
						target="_blank">
						<div class="icon-stack bg-primary-soft text-primary me-4">
							<i data-feather="book"></i>
						</div>
						<div>
							<div class="small text-gray-500">Documentation</div>
							Usage instructions and reference
						</div>
					</a>
					<div class="dropdown-divider m-0"></div>
					<a class="dropdown-item py-3"
						href="https://docs.startbootstrap.com/sb-admin-pro/components"
						target="_blank">
						<div class="icon-stack bg-primary-soft text-primary me-4">
							<i data-feather="code"></i>
						</div>
						<div>
							<div class="small text-gray-500">Components</div>
							Code snippets and reference
						</div>
					</a>
					<div class="dropdown-divider m-0"></div>
					<a class="dropdown-item py-3"
						href="https://docs.startbootstrap.com/sb-admin-pro/changelog"
						target="_blank">
						<div class="icon-stack bg-primary-soft text-primary me-4">
							<i data-feather="file-text"></i>
						</div>
						<div>
							<div class="small text-gray-500">Changelog</div>
							Updates and changes
						</div>
					</a>
				</div></li>
			<!-- Navbar Search Dropdown-->
			<!-- * * Note: * * Visible only below the lg breakpoint-->
			<li class="nav-item dropdown no-caret me-3 d-lg-none"><a
				class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="searchDropdown" href="#" role="button" data-bs-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"><i
					data-feather="search"></i></a> <!-- Dropdown - Search-->
				<div
					class="dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up"
					aria-labelledby="searchDropdown">
					<form class="form-inline me-auto w-100">
						<div class="input-group input-group-joined input-group-solid">
							<input class="form-control pe-0" type="text"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2" />
							<div class="input-group-text">
								<i data-feather="search"></i>
							</div>
						</div>
					</form>
				</div></li>
			<!-- Alerts Dropdown-->


			<!-- User Dropdown-->
			<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
				<a class="btn btn-icon btn-transparent-dark dropdown-toggle"
				id="navbarDropdownUserImage" href="javascript:void(0);"
				role="button" data-bs-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><img class="img-fluid"
					src="assets/img/illustrations/profiles/profile-1.png" /></a>
				<div
					class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up"
					aria-labelledby="navbarDropdownUserImage">
					<h6 class="dropdown-header d-flex align-items-center">
						<img class="dropdown-user-img"
							src="assets/img/illustrations/profiles/profile-1.png" />
						<div class="dropdown-user-details">
							<div class="dropdown-user-details-name">Valerie Luna</div>
							<div class="dropdown-user-details-email">vluna@aol.com</div>
						</div>
					</h6>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#!">
						<div class="dropdown-item-icon">
							<i data-feather="settings"></i>
						</div> Account
					</a> <a class="dropdown-item" href="#!">
						<div class="dropdown-item-icon">
							<i data-feather="log-out"></i>
						</div> Logout
					</a>
				</div>
			</li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sidenav shadow-right sidenav-light">
				<div class="sidenav-menu">
					<div class="nav accordion" id="accordionSidenav">
						<!-- Sidenav Menu Heading (Account)-->
						<!-- * * Note: * * Visible only on and above the sm breakpoint-->
						<div class="sidenav-menu-heading d-sm-none">Account</div>
						<!-- Sidenav Link (Alerts)-->
						<!-- * * Note: * * Visible only on and above the sm breakpoint-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i data-feather="bell"></i>
							</div> Alerts <span class="badge bg-warning-soft text-warning ms-auto">4
								New!</span>
						</a>
						<!-- Sidenav Link (Messages)-->
						<!-- * * Note: * * Visible only on and above the sm breakpoint-->
						<a class="nav-link d-sm-none" href="#!">
							<div class="nav-link-icon">
								<i data-feather="mail"></i>
							</div> Messages <span
							class="badge bg-success-soft text-success ms-auto">2 New!</span>
						</a>
						<!-- Sidenav Menu Heading (Core)-->
						<div class="sidenav-menu-heading">Core</div>
						<!-- Sidenav Accordion (Dashboard)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i data-feather="activity"></i>
							</div> Dashboards
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseDashboards"
							data-bs-parent="#accordionSidenav">
							<nav class="sidenav-menu-nested nav accordion"
								id="accordionSidenavPages">
								<a class="nav-link" href="dashboard-1.html"> Default <span
									class="badge bg-primary-soft text-primary ms-auto">Updated</span>
								</a> <a class="nav-link" href="dashboard-2.html">Multipurpose</a> <a
									class="nav-link" href="dashboard-3.html">Affiliate</a>
							</nav>
						</div>
						<!-- Sidenav Heading (Custom)-->
						<div class="sidenav-menu-heading">Custom</div>
						<!-- Sidenav Accordion (Pages)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse" data-bs-target="#collapsePages"
							aria-expanded="false" aria-controls="collapsePages">
							<div class="nav-link-icon">
								<i data-feather="grid"></i>
							</div> Pages
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							data-bs-parent="#accordionSidenav">
							<nav class="sidenav-menu-nested nav accordion"
								id="accordionSidenavPagesMenu">
								<!-- Nested Sidenav Accordion (Pages -> Account)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAccount" aria-expanded="false"
									aria-controls="pagesCollapseAccount"> Account
									<div class="sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAccount"
									data-bs-parent="#accordionSidenavPagesMenu">
									<nav class="sidenav-menu-nested nav">
										<a class="nav-link" href="account-profile.html">Profile</a> <a
											class="nav-link" href="account-billing.html">Billing</a> <a
											class="nav-link" href="account-security.html">Security</a> <a
											class="nav-link" href="account-notifications.html">Notifications</a>
									</nav>
								</div>
								<!-- Nested Sidenav Accordion (Pages -> Authentication)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth"
									aria-expanded="false" aria-controls="pagesCollapseAuth">
									Authentication
									<div class="sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									data-bs-parent="#accordionSidenavPagesMenu">
									<nav class="sidenav-menu-nested nav accordion"
										id="accordionSidenavPagesAuth">
										<!-- Nested Sidenav Accordion (Pages -> Authentication -> Basic)-->
										<a class="nav-link collapsed" href="javascript:void(0);"
											data-bs-toggle="collapse"
											data-bs-target="#pagesCollapseAuthBasic"
											aria-expanded="false" aria-controls="pagesCollapseAuthBasic">
											Basic
											<div class="sidenav-collapse-arrow">
												<i class="fas fa-angle-down"></i>
											</div>
										</a>
										<div class="collapse" id="pagesCollapseAuthBasic"
											data-bs-parent="#accordionSidenavPagesAuth">
											<nav class="sidenav-menu-nested nav">
												<a class="nav-link" href="auth-login-basic.html">Login</a> <a
													class="nav-link" href="auth-register-basic.html">Register</a>
												<a class="nav-link" href="auth-password-basic.html">Forgot
													Password</a>
											</nav>
										</div>
										<!-- Nested Sidenav Accordion (Pages -> Authentication -> Social)-->
										<a class="nav-link collapsed" href="javascript:void(0);"
											data-bs-toggle="collapse"
											data-bs-target="#pagesCollapseAuthSocial"
											aria-expanded="false" aria-controls="pagesCollapseAuthSocial">
											Social
											<div class="sidenav-collapse-arrow">
												<i class="fas fa-angle-down"></i>
											</div>
										</a>
										<div class="collapse" id="pagesCollapseAuthSocial"
											data-bs-parent="#accordionSidenavPagesAuth">
											<nav class="sidenav-menu-nested nav">
												<a class="nav-link" href="auth-login-social.html">Login</a>
												<a class="nav-link" href="auth-register-social.html">Register</a>
												<a class="nav-link" href="auth-password-social.html">Forgot
													Password</a>
											</nav>
										</div>
									</nav>
								</div>
								<!-- Nested Sidenav Accordion (Pages -> Error)-->
								<a class="nav-link collapsed" href="javascript:void(0);"
									data-bs-toggle="collapse" data-bs-target="#pagesCollapseError"
									aria-expanded="false" aria-controls="pagesCollapseError">
									Error
									<div class="sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									data-bs-parent="#accordionSidenavPagesMenu">
									<nav class="sidenav-menu-nested nav">
										<a class="nav-link" href="error-400.html">400 Error</a> <a
											class="nav-link" href="error-401.html">401 Error</a> <a
											class="nav-link" href="error-403.html">403 Error</a> <a
											class="nav-link" href="error-404-1.html">404 Error 1</a> <a
											class="nav-link" href="error-404-2.html">404 Error 2</a> <a
											class="nav-link" href="error-500.html">500 Error</a> <a
											class="nav-link" href="error-503.html">503 Error</a> <a
											class="nav-link" href="error-504.html">504 Error</a>
									</nav>
								</div>
								<a class="nav-link" href="pricing.html">Pricing</a> <a
									class="nav-link" href="invoice.html">Invoice</a>
							</nav>
						</div>

						<!-- Nested Sidenav Accordion (Layout -> Container Options)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse"
							data-bs-target="#collapseLayoutContainers" aria-expanded="false"
							aria-controls="collapseLayoutContainers"> Container Options
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayoutContainers"
							data-bs-parent="#accordionSidenavLayout">
							<nav class="sidenav-menu-nested nav">
								<a class="nav-link" href="layout-boxed.html">Boxed Layout</a> <a
									class="nav-link" href="layout-fluid.html">Fluid Layout</a>
							</nav>
						</div>
						<!-- Nested Sidenav Accordion (Layout -> Page Headers)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse"
							data-bs-target="#collapseLayoutsPageHeaders"
							aria-expanded="false" aria-controls="collapseLayoutsPageHeaders">
							Page Headers
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayoutsPageHeaders"
							data-bs-parent="#accordionSidenavLayout">
							<nav class="sidenav-menu-nested nav">
								<a class="nav-link" href="header-simplified.html">Simplified</a>
								<a class="nav-link" href="header-compact.html">Compact</a> <a
									class="nav-link" href="header-overlap.html">Content Overlap</a>
								<a class="nav-link" href="header-breadcrumbs.html">Breadcrumbs</a>
								<a class="nav-link" href="header-light.html">Light</a>
							</nav>
						</div>
						<!-- Nested Sidenav Accordion (Layout -> Starter Layouts)-->
						<a class="nav-link collapsed" href="javascript:void(0);"
							data-bs-toggle="collapse"
							data-bs-target="#collapseLayoutsStarterTemplates"
							aria-expanded="false"
							aria-controls="collapseLayoutsStarterTemplates"> Starter
							Layouts
							<div class="sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayoutsStarterTemplates"
							data-bs-parent="#accordionSidenavLayout">
							<nav class="sidenav-menu-nested nav">
								<a class="nav-link" href="starter-default.html">Default</a> <a
									class="nav-link" href="starter-minimal.html">Minimal</a>
							</nav>
						</div>
			</nav>
		</div>
		<!-- Sidenav Accordion (Components)-->

	</div>
	</nav>
	</div>
	<div id="layoutSidenav_content">
		<main>
			<header
				class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
				<div class="container-fluid px-4">
					<div class="page-header-content">
						<div class="row align-items-center justify-content-between pt-3">
							<div class="col-auto mb-3">
								<h1 class="page-header-title">
									<div class="page-header-icon">
										<i data-feather="file-text"></i>
									</div>
									Write Post
								</h1>
							</div>
							<div class="col-12 col-xl-auto mb-3">
								<a class="btn btn-sm btn-light text-primary"
									href="blog-management-posts-list.html"> <i class="me-1"
									data-feather="arrow-left"></i> Back to All Posts
								</a>
							</div>
						</div>
					</div>
				</div>
			</header>


			<!-- Main page content-->


			<!--게시판 입력-->

			<div class="container-fluid px-4">
				<div class="row gx-4">
					<div class="col-lg-8">
						<form action="WritePost" method="get">
							<input name="nick" type="hidden" <%=nt1.getNick()%>>
							 <input name="email" type="hidden" <%=nt1.getEmail()%>>

							<div class="card mb-4">
								<div class="card-header">Post Title</div>
								<div class="card-body">

									<input class="form-control" name="title" id="postTitleInput"
										type="text" placeholder="Enter your post title...">
								</div>
							</div>

							<div class="card card-header-actions mb-4 mb-lg-0">
								<div class="card-header">
									Post Content <i class="text-muted" data-feather="info"
										data-bs-toggle="tooltip" data-bs-placement="left"
										title="Markdown is supported within the post content editor."></i>
								</div>
								<div class="card-body">
									<textarea name="content" id="postEditor"></textarea>
								</div>
								<input name="date" type="hidden"
									<%SimpleDateFormat format = new SimpleDateFormat("yyyy-M-dd mm:HH:ss");
Date time = new Date();
String time1 = format.format(time);
System.out.print(time1 + "가나다라");%>>
								<button class="fw-500 btn btn-primary" type="submit">Submit
									Updates</button>
							</div>

						</form>
					</div>

				</div>
			</div>


			<!-- 게시판 입력 끝  -->



		</main>
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
	<script src="https://unpkg.com/easymde/dist/easymde.min.js"
		crossorigin="anonymous"></script>
	<script src="js/markdown.js"></script>
</body>
</html>
