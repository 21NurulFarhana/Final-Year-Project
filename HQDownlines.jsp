<%-- 
    Document   : HQDownlines
    Created on : 15 Mar 2023, 9:55:46 pm
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mlm";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>MLM/HQ/Downlines</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/logo-SSA.png" rel="icon">
        <link href="assets/img/logo-SSA.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo-SSA.png" alt="">
        <span class="d-none d-lg-block">Global Enterprise</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Web Designer</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="#">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->
  
  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
        
      <li class="nav-heading">Pages</li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="HQPage.jsp">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="HQproducts.jsp">
          <i class="bi bi-envelope"></i>
          <span>Products</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link" href="HQDownlines.jsp">
          <i class="bi bi-card-list"></i>
          <span>Downlines</span>
        </a>
        </li><!-- End Register Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="HQOverview.jsp">
          <i class="bi bi-grid"></i>
          <span>Overview</span>
        </a>
      </li><!-- End Dashboard Nav -->
    </ul>

  </aside><!-- End Sidebar-->
  
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Downlines</h1>
      <nav>
        <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
           <li class="breadcrumb-item"><a href="#">HQ Admin Staff</a></li>
           <li class="breadcrumb-item active">Downlines</li>
        </ol>
      </nav>
      <nav class="d-flex justify-content-center">
        <ol class="breadcrumb">
           <button type="button" class="btn btn-light rounded-pill"><i class="bi bi-person-plus-fill"></i><a href="agentAdd.jsp"> Add Agent</a></button>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <!<!-- Start Tab -->
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Downline List</h5>

            <!-- Default Tabs -->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Leaders</button>
              </li>
              <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Agents</button>
              </li>
            </ul>
            <div class="tab-content pt-2" id="myTabContent">
              <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
              <!-- Dark Table -->
              <table class="table table-dark">
                <tr>
                    <td>Leader ID</td>
                    <td>Leader Name</td>
                    <td>Leader Email</td>
                    <td>Phone Number</td>
                    <%
                    try{
                    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM leaderprofile ";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                    %>
                <tr>
                    <td><%=resultSet.getString("leaderID")%></td>
                    <td><%=resultSet.getString("leaderName")%></td>
                    <td><%=resultSet.getString("leaderEmail") %></td>
                    <td><%=resultSet.getString("leaderPhoneNum") %></td>
                </tr>
                    <%
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
              </table>
              <!-- End Dark Table -->
              </div>
              <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="overflow-x:auto;">   
              <!-- Dark Table -->
              <table class="table table-dark">
                <tr>
                    <td>Agent ID</td>
                    <td>Agent Name</td>
                    <td>Agent Email</td>
                    <td>Phone Number</td>
                    <td>Street</td>
                    <td>Postcode</td>
                    <td>City</td>
                    <td>State</td>
                    <td>Join Date</td>
                    <td>Sale</td>
                    <td>Commission</td>
                    <td>Team ID</td>
                    <%
                    try{
                    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    statement=connection.createStatement();
                    String sql ="SELECT * FROM agentprofile ";
                    resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                    %>
                <tr>
                    <td><%=resultSet.getString("agentID")%></td>
                    <td><%=resultSet.getString("Name")%></td>
                    <td><%=resultSet.getString("Email") %></td>
                    <td><%=resultSet.getString("Pnumber") %></td>
                    <td><%=resultSet.getString("Street") %></td>
                    <td><%=resultSet.getString("Postcode") %></td>
                    <td><%=resultSet.getString("City") %></td>
                    <td><%=resultSet.getString("State") %></td>
                    <td><%=resultSet.getString("joinDate") %></td>
                    <td><%=resultSet.getString("personaleSale") %></td>
                    <td><%=resultSet.getString("commisionAgent") %></td>
                    <td><%=resultSet.getString("teamID") %></td>
                </tr>
                    <%
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
              </table>
              <!-- End Dark Table -->
              
              </div>
            </div><!-- End Default Tabs -->

          </div>
        </div>    
  
  
  <!--sebelum footer-->
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
    </body>
</html>
