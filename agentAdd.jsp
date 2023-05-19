<%-- 
    Document   : agentAdd
    Created on : 8 May 2023, 1:55:38 am
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>MLM : Register Agent </title>
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
                    <h5 class="card-title text-center pb-0 fs-4">Adding New Agent!</h5>
                    <p class="text-center small">Enter the information of the agent</p>
                  </div>
                  
                    
                  <!-- Floating Labels Form -->
                  <form class="row g-3" action="agentAdding.jsp">
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="agentID" placeholder="Agent ID" required>
                        <label for="agentID">Agent ID</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="password" class="form-control" name="Password" placeholder="Password" required>
                        <label for="Password">Password</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="Name" placeholder="Name" required>
                        <label for="Name">Name</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="email" class="form-control" name="Email" placeholder="Email" required>
                        <label for="Email">Email</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="Pnumber" placeholder="Phone Number" required>
                        <label for="Pnumber">Phone Number</label>
                      </div>
                    </div>
                    <div class="col-8">
                      <div class="form-floating">
                          <input class="form-control" placeholder="Street" name="Street" style="height: 80px;" required>
                        <label for="Street">Street</label>
                      </div>
                    </div> 
                    <div class="col-md-4">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="Postcode" placeholder="Postcode" style="height: 80px" required>
                        <label for="Postcode">Postcode</label>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-floating">
                          <input type="text" class="form-control" name="City" placeholder="City" required>
                        <label for="City">City</label>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-floating mb-3">
                        <select class="form-select" name="State" aria-label="State">
                          <option value="Johor">Johor</option>
                          <option value="Kedah">Kedah</option>
                          <option value="Kelantan">Kelantan</option>
                          <option value="Melaka">Melaka</option>
                          <option value="Negeri Sembilan">Negeri Sembilan</option>
                          <option value="Pahang">Pahang</option>
                          <option value="Perak">Perak</option>
                          <option value="Perlis">Perlis</option>
                          <option value="Pulau Pinang">Pulau Pinang</option>
                          <option value="Sabah">Sabah</option>
                          <option value="Sarawak">Sarawak</option>
                          <option value="Selangor">Selangor</option>
                          <option value="Terengganu">Terengganu</option>
                          <option value="Wilayah Persekutuan">Wilayah Persekutuan</option>
                        </select>
                        <label for="State">State</label>
                      </div>
                    </div>
                    <div class="col-md-5">
                      <div class="col-md-12">
                        <div class="form-floating">
                          <input type="date" class="form-control" name="joinDate" placeholder="Join Date" >
                          <label for="joinDate" class="col-sm-2 col-form-label">Join Date</label>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-floating mb-3">
                        <select class="form-select" name="role" aria-label="Role">
                          <option value="Agent">Agent</option>
                          <option value="Leader">Leader</option>
                          <option value="HQ Staff">HQ Staff</option>
                        </select>
                        <label for="role">Role</label>
                      </div>
                    </div>
                    
                    <div class="text-center">
                      <!-- Vertically centered Modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#verticalycentered">
                          Next
                        </button>
                        <div class="modal fade" id="verticalycentered" tabindex="-1">
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title">Are You Confirm?</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Confirm</button>
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
    </body>
</html>

