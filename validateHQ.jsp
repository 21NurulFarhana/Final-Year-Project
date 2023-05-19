<%-- 
    Document   : validateHQ
    Created on : 12 May 2023, 11:54:29 pm
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Validate</title>
	</head>
	<body><!-- values given at login page are taken here and checks if the valid details are not -->
                <%
                String staffID=request.getParameter("staffID"); 
                session.setAttribute("staffID",staffID); 
                String password=request.getParameter("password"); 
                Class.forName("com.mysql.jdbc.Driver"); 
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm","root",""); 
                Statement st= con.createStatement(); 
                ResultSet rs=st.executeQuery("select * from hqstaff where staffID='"+staffID+"' and password='"+password+"'"); 
                try{
                        rs.next();
                                if(rs.getString("password").equals(password)&&rs.getString("staffID").equals(staffID)) 
                                        { 
                                              response.sendRedirect("HQPage.jsp"); 
                                        } 
                                else{
                                        out.println("Invalid password or username.");
                                        //IF THE USER IS NOT AUTHORISED THEN AGAIN HE WILL BE REDIRECTED TO THE SAME LOGIN PAGE
                                        response.sendRedirect("loginHQ.jsp");
                                    }
                }
                catch (Exception e) {
                e.printStackTrace();
                }
                %>
		
	</body>
</html>
