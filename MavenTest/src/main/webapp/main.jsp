<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
.row > * {
    flex-shrink: 3;
    width: 100%;
    max-width: 100%;
    padding-top: calc(var(--bs-gutter-x) * 0.5);;
    padding-right: calc(var(--bs-gutter-x) * 0.5);
    padding-left: calc(var(--bs-gutter-x) * 0.5);
    margin-top: var(--bs-gutter-y);
}

.title{
   font-size: 20px; 
   font-weight: 800; 
   color:black; 
   background: #E6E6F8; 
   width: 100%;
}

.sentiment{
   color:BLUE; 
   width: 100%;
   
}

.summary{
   color:black; 
   background: white; 
   width: 100%;
}

.source{
   font-size: 10px;
   background: #E2FEFF;
   width: 100%; 
   text-align: right;
}

</style>
</head>

<body class="nav-fixed">
   <%
   //세션 값 가져옴 loginM 키 값이 지정되어 있는 세션 값  56번 로그인 판단기준.
   MemberVO loginM = (MemberVO) session.getAttribute("loginM");
   Class.forName("com.mysql.jdbc.Driver");
   String dbUrl = "jdbc:mysql://project-db-stu.ddns.net:3307/smhrd_e_3?serverTimezone=UTC";
   String dbUser = "smhrd_e_3";
   String dbPass = "smhrde3";
   Connection con = DriverManager.getConnection
         (dbUrl, dbUser, dbPass);
   String sql = "select * from NEWS order by idx DESC;";
   PreparedStatement pstmt = con.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery(sql);
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
                     <idata-feather="settings" >
                     </i>
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
                  <a class="nav-link collapsed" href="main.jsp">
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
      <div id="layoutSidenav_content">
         <main>
            <header
               class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
               <div class="container-xl px-4">
                  <div class="page-header-content pt-4">
                     <div class="row align-items-center justify-content-between">
                        <div class="col-auto mt-4">
                           <h1 class="page-header-title">
                              <div class="page-header-icon" style="color: white;">최신뉴스</div>
                           </h1>
                        </div>
                     </div>
                  </div>
               </div>
            </header>
            <!-- Main page content-->
            <div class="container">
               <div class="row">
                  <!-- Example DataTable for Dashboard Demo-->            
                  <div class="timeline-item">
                     <div class="card mb-4">
                        <div class="card-header"></div>
                        <div class="card-body">
                           <%
                           while (rs.next()) {
                           %>
                              <div style="border-color: black; border-style: solid; border-width: 1.5px;">
                                 <div class="title"><%=rs.getString("title")%></div>
                                 <div class="sentiment"><%=rs.getString("sentiment")%></div>
                                 <div class="summary"><%=rs.getString("summary")%></div>
                                 <div class="source"> 출처 : <a href="<%=rs.getString("source")%>"> <%=rs.getString("source")%> </a></div>
                              </div>
                           <%
                           }
                              %>
                              
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </main>
         <footer class="footer-admin mt-auto footer-light">
            <div class="container-xl px-4">
               <div class="row">
                  
                  <div class="col-md-6 text-md-end small">
                     Team : Stock's talk · · · <a href="https://github.com/GPT-s/GPT">https://github.com/GPT-s/GPT</a>
                  </div>
               </div>
            </div>
         </footer>
      </div>
   </div>
   <script type="text/javascript">
      setTimeout(function() {
           location.reload();
       }, 10000);
   </script>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="js/scripts.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
      crossorigin="anonymous"></script>
   <script src="assets/demo/chart-area-demo.js"></script>
   <script src="assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
      crossorigin="anonymous"></script>
   <script src="js/datatables/datatables-simple-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js"
      crossorigin="anonymous"></script>
   <script src="js/litepicker.js"></script>
</body>
</html>