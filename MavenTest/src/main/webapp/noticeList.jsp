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
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Posts List - SB Admin Pro</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
<script data-search-pseudo-elements defer
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="nav-fixed">
	<%
	//세션 값 가져옴 loginM 키 값이 지정되어 있는 세션 값  56번 로그인 판단기준.
	MemberVO loginM = (MemberVO) session.getAttribute("loginM");
	noticeDAO nodao = new noticeDAO();
	List<noticeVO> novo = (List<noticeVO>) session.getAttribute("list");
	session.setAttribute("list", novo);
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
		<a class="navbar-brand pe-3 ps-4 ps-lg-2" href="main.jsp">Stock's
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
						<a class="nav-link collapsed" href="main.jsp"
							data-bs-toggle="collapse" data-bs-target="#collapseDashboards"
							aria-expanded="false" aria-controls="collapseDashboards">
							<div class="nav-link-icon">
								<i data-feather="activity"></i>
							</div> NEWS <!--  <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>  사이드바 드롭다운 -->
						</a>
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
			<div id="layoutSidenav_content">
				<main style="padding-left: 18%;">
					<header
						class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
						<div class="container-fluid px-4">
							<div class="page-header-content">
								<div class="row align-items-center justify-content-between pt-3">
									<div class="col-auto mb-3">
										<h1 class="page-header-title">
											<div class="page-header-icon">
												<i data-feather="list"></i>
											</div>
											글 목록
										</h1>
									</div>
									<%
									if (loginM != null) {
									%>
									<div class="col-12 col-xl-auto mb-3">
										<a class="btn btn-sm btn-light text-primary" href="form.jsp">
											<i class="me-1" data-feather="plus"></i> Create New Post
										</a>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
					</header>

					<%
					Class.forName("com.mysql.jdbc.Driver");
					String dbUrl = "jdbc:mysql://project-db-stu.ddns.net:3307/smhrd_e_3?serverTimezone=UTC";
					String dbUser = "smhrd_e_3";
					String dbPass = "smhrde3";
					Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
					String sql = "select * from noticeBoard order by number DESC;";
					
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery(sql);
					%>

					<!-- noticeList 시작 -->
					<div class="container-fluid px-4">
						<div class="card">
							<div class="card-body">
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th>글번호</th>
											<th>제목</th>
											<th>글내용</th>
											<th>작성일</th>
											<th>작성자</th>
										</tr>
									</thead>

									<!-- 	<tr>
									<td>1</td>
									<td scope="row"><a href="https://www.naver.com/"
										class="link">글제목입니다.</a></td>
									<td>20 Jun 2021</td>
									<td><div>장향미</div></td>
								</tr> -->
									<%-- <%
								for (int i = 0; i < novo.size(); i++) {
								%>
								<tr>
									<td><%=novo.get(i).getNumber()%></td>
									<td scope='row'><a href="https://www.naver.com/" class="link"></a><%=novo.get(i).getTitle()%></td>
									<td><%=novo.get(i).getC_date()%></td>
									<td><div><%=novo.get(i).getNick()%></div></td>
								</tr>
								<%}%>  --%>

									<%-- <%
								if(loginM==null){
								while(rs.next()){%>
								<tr>
									<td><%=rs.getString("number") %></td>
									<td><%=rs.getString("title") %></td>
									<td><%=rs.getString("c_date") %></td>
									<td><%=rs.getString("nick") %></td>
								</tr>
								<%}%>
								
								<%}%>
								<%else{
								while(rs.next()){%>
								<tr>
									<td><%=rs.getString("number") %></td>
									<td><%=rs.getString("title") %></td>
									<td><%=rs.getString("c_date") %></td>
									<td><%=rs.getString("nick") %></td>
								</tr>
								<button class="btn btn-cyan" type="button">Cyan</button>
								<% }%>
								<% }%> --%>

									<%
									if (loginM == null) {
										while (rs.next()) {
									%>
									<%-- onclick="location.href='Board_content.jsp?board_seq=<%=bvo.getBoard_seq()%>&group_name=<%=vo.getGroup_name()%>';"> --%>

									<tr>
										<td><%=rs.getString("number")%></td>
										<td><%=rs.getString("title")%></td>
										<td><%=rs.getString("content")%></td>
										<td><%=rs.getString("c_date")%></td>
										<td><%=rs.getString("nick")%></td>
									</tr>
									<%
									}
									} else {
									while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getString("number")%></td>
										<td><%=rs.getString("title")%></td>
										<td><%=rs.getString("content")%></td>
										<td><%=rs.getString("c_date")%></td>
										<td><%=rs.getString("nick")%></td>
									</tr>

									<%
									}
									%>
									<%
									}
									%>

								</table>
							</div>
						</div>
					</div>
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
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables/datatables-simple-demo.js"></script>
</body>
</html>
