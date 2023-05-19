<%-- 
    Document   : productUpdate
    Created on : 12 Apr 2023, 1:40:31 am
    Author     : user
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String productID = request.getParameter("productID");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product where productID="+productID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>MLM : Update Product </title>
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
    
        <main>
    <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
  
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo-SSA.png" alt="">
                  <span class="d-none d-lg-block">Global Enterprise</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Update Product!</h5>
                    <p class="text-center small">Enter the information of the product</p>
                  </div>
                  
                    
                  <!-- Floating Labels Form -->
                  <form class="row g-3" action="productUpdateProcess.jsp">
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="productID" placeholder="Product Code" required value="<%= resultSet.getString(1)%>">
                        <label for="productID">Product Code</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="productName" placeholder="Product Name" required value="<%= resultSet.getString(2)%>">
                        <label for="productName">Product Name</label>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-floating mb-3">
                          <select class="form-select" name="productCategory" aria-label="Category" required value="<%= resultSet.getString(3)%>">
                          <option value="Body care">Body Care</option>
                          <option value="Slimming">Slimmimg</option>
                          <option value="Skincare">Skincare</option>
                          <option value="Healthcare">Healthcare</option>
                        </select>
                        <label for="productCategory">Category</label>
                      </div>
                    </div>
                    <div class="col-8">
                      <div class="form-floating">
                          <input class="form-control" placeholder="Product Description" name="productDescription" style="height: 80px;" required value="<%= resultSet.getString(4)%>"></textarea>
                        <label for="productDescription">Product Description</label>
                      </div>
                    </div> 
                    <div class="col-md-4">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="weight" placeholder="Weight(g)" required value="<%= resultSet.getString(5)%>">
                        <label for="weight">Weight(g)</label>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="price" placeholder="Price(RM)" required value="<%= resultSet.getString(6)%>">
                        <label for="price">Price(RM)</label>
                      </div>
                    </div>
                    
                    
                    <div class="col-md-4">
                      <div class="form-floating">
                        <input type="text" class="form-control" name="stock" placeholder="Stock" required value="<%= resultSet.getString(7)%>">
                        <label for="stock">Stock</label>
                      </div>
                    </div>
                      <!-- stop sini -->
                    <div class="col-md-5">
                      <div class="col-md-12">
                        <div class="form-floating">
                          <input type="date" class="form-control" name="manufactureDate" placeholder="Manufacture Date" value="<%= resultSet.getString(8)%>">
                          <label for="manufactureDate" class="col-sm-2 col-form-label">Manufacture Date</label>
                        </div>
                      </div>
                    </div>
                      <!-- comment -->
                    <div class="col-md-5">
                      <div class="col-md-12">
                        <div class="form-floating">
                          <input type="date" class="form-control" name="expireDate" placeholder="Expire Date" value="<%= resultSet.getString(9)%>">
                          <label for="expireDate" class="col-sm-2 col-form-label">Expire Date</label>
                        </div>
                      </div>
                    </div>
                      <!<!-- stop -->
                    
                    <div class="text-center">
                      <!-- Vertically centered Modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                          Confirm
                        </button>
                        <div class="modal fade" id="verticalycentered" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title">Enter Your ID to Make Change</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-body">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" name="staffID" placeholder="Your HQ ID" required value="<%= resultSet.getString(10)%>">
                                      <label for="staffID">Your Hq ID</label>
                                    </div>
                                  </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                              </div>
                            </div>
                          </div>
                        </div><!-- End Vertically centered Modal-->
                      <button type="reset" class="btn btn-secondary">Reset</button>
                    </div>
                  </form><!-- End floating Labels Form -->
                </div>
              </div>

              <div class="credits">
                Designed by <a href="https://www.facebook.com/farha.rizu.7">Nurul Farhana</a>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->


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
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>