<%-- 
    Document   : HQproducts
    Created on : 15 Mar 2023, 9:41:28 pm
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

        <title>MLM/HQ/Products</title>
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
        <style>
            .column{
                display: inline-block;
                width: 24%;
                padding: 0 10px;
            }
        </style>
            
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
        <a class="nav-link" href="HQproducts.jsp">
          <i class="bi bi-envelope"></i>
          <span>Products</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="HQDownlines.jsp">
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
      <h1>Products</h1>
      <nav>
        <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
           <li class="breadcrumb-item"><a href="#">HQ Admin Staff</a></li>
           <li class="breadcrumb-item active">Products</li>
        </ol>
      </nav>
      <nav class="d-flex justify-content-center">
        <ol class="breadcrumb">
           <button type="button" class="btn btn-light rounded-pill"><i class="bi bi-plus-circle"></i><a href="productAdd.jsp"> Add Product</a></button>
           <button type="button" class="btn btn-light rounded-pill"><i class="bi bi-calendar-check"></i> Expiration Check</button>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
        <%
        try{
        connection = DriverManager.getConnection(connectionUrl+database, userid, password);
        statement=connection.createStatement();
        String sql ="SELECT * FROM product ";
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
    <div class="column">
        <div class="card">
          <img src="assets/img/card.jpg" class="card-img-top" alt="...">
          <div class="card-body">
          <div class="label">Code: <%=resultSet.getString("productID")%></div>
          <div class="label">Name: <%=resultSet.getString("productName")%></div>
          <div class="label">Category: <%=resultSet.getString("productCategory") %></div>
          <div class="label">Description: <%=resultSet.getString("productDescription") %></div>
          <div class="label">Weight: <%=resultSet.getString("weight") %>g</div>
          <div class="label">Price: RM<%=resultSet.getString("price") %></div>
          <div class="label">Stock: <%=resultSet.getString("stock") %> unit</div>
          <div class="label">Mft Date: <%=resultSet.getString("manufactureDate") %></div>
          <div class="label">Exp Date: <%=resultSet.getString("expireDate") %></div>
          <nav class="d-flex justify-content-end">
            <ol class="breadcrumb">
                <button type="button" class="btn btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit">
                <a href="productUpdate.jsp?productID=<%=resultSet.getString("productID")%>"><i class="ri-edit-2-fill"></i></a></button>
                <button type="button" class="btn btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
                <a href="productDelete.jsp?productID=<%=resultSet.getString("productID")%>"><i class="ri-delete-bin-5-fill"></i></a></button>
            </ol>
          </nav>
          </div>
        </div>
    </div>
          
    <%
    }
    connection.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    </section>
  
  
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
