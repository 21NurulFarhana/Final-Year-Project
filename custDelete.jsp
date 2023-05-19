<%-- 
    Document   : custDelete
    Created on : 7 May 2023, 11:48:40 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM - Delete Customer</title>
    </head>
    <body>
        <%
int result;            
String custID=request.getParameter("custID");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");


String i="DELETE FROM customer WHERE custID=?";
PreparedStatement myPS = conn.prepareStatement(i);
myPS.setString(1, custID);
result = myPS.executeUpdate();
if (result >0){
    out.println("<h2>Parcel Information Succesfully Deleted!</h2>");
            }
     conn.close();
%>

<div class="container">
     <a href="AgentCustomer.jsp"><h3>Customer List</h3></a>
 </div>
    </body>
</html>

