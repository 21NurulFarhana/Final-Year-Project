<%-- 
    Document   : login.jsp [MULTILEVEL MARKETING SYSTEM]
    Created on : 13 DECEMBER 2022
    Author     : Nurul Farhana  (S58755)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    try {
        String id = request.getParameter("txt_id"); //txt_email
        String password = request.getParameter("txt_password"); //txt_password
    
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm","root",""); //create connection
	
        PreparedStatement admn = admn = con.prepareStatement("select * from account where ID=? AND Password=? AND Role = 'HQ Staff'"); //sql select query 
        admn.setString(1,id);
        admn.setString(2,password);
        ResultSet DepAdmn = admn.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement stf = stf = con.prepareStatement("select * from account where ID=? AND Password=? AND Role = 'Leader'"); //sql select query 
        stf.setString(1,id);
        stf.setString(2,password);
        ResultSet DepStf = stf.executeQuery(); //execute query and store in resultset object rs.
        
        PreparedStatement agt = agt = con.prepareStatement("select * from account where ID=? AND Password=?"); //sql select query 
        agt.setString(1,id);
        agt.setString(2,password);
        ResultSet DepAgt = agt.executeQuery(); //execute query and store in resultset object rs.
	if(request.getParameter("btn_login")!=null) {//check login button click event not null
            String dbid,dbpassword;

            if(DepAdmn.next()) {
		dbid=DepAdmn.getString("ID");
		dbpassword=DepAdmn.getString("Password");
			
		if(id.equals(dbid) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbid); //session name is login and store fetchable database email address
                    response.sendRedirect("HQPage.jsp"); //after login success redirect to welcome.jsp page
		}
            } else if(DepStf.next()) {
		dbid=DepStf.getString("ID");
		dbpassword=DepStf.getString("Password");
			
		if(id.equals(dbid) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbid); //session name is login and store fetchable database email address
                    response.sendRedirect("LeaderPage.jsp"); //after login success redirect to welcome.jsp page
		}
            }
             else if(DepAgt.next()) {
		dbid=DepAgt.getString("ID");
		dbpassword=DepAgt.getString("Password");
			
		if(id.equals(dbid) && password.equals(dbpassword)) {
                    session.setAttribute("login",dbid); //session name is login and store fetchable database email address
                    response.sendRedirect("AgentPage.jsp"); //after login success redirect to welcome.jsp page
		}
            }else {
		request.setAttribute("errorMsg","invalid ID or password"); //invalid error message for email or password wrong
            }
            con.close(); //close connection	
	}
    }
    catch(Exception e) {
            out.println(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>MLM : LOGIN</title>
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
        
        <script>
            function validate() {
                var email = document.myform.txt_email;
                var password = document.myform.txt_password;

                if (email.value === null || email.value === "") {//check email textbox not blank
                    window.alert("please enter email ?"); //alert message
                    email.style.background = '#f08080';
                    email.focus();
                    return false;
                }
                if (password.value === null || password.value === "") {//check password textbox not blank
                    window.alert("please enter password ?"); //alert message
                    password.style.background = '#f08080'; 
                    password.focus();
                    return false;
                }
            }
        </script>
    </head>
    <body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo-SSA.png" alt="">
                  <span class="d-none d-lg-block">Global Enterprise</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>

                  <form class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="txt_id" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="txt_password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" name="btn_login" type="submit">Login</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Don't have account? <a href="pages-register.html">Create an account</a></p>
                    </div>
                  </form>

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
