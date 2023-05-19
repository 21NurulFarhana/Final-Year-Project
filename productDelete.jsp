<%-- 
    Document   : productDelete
    Created on : 29 Apr 2023, 2:11:32 pm
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM - Delete Product</title>
    </head>
    <body>
        <%
String productID=request.getParameter("productID");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM product WHERE productID="+productID);
                                                                                                                                                              
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>

<h2>Parcel Information Succesfully Deleted!</h2>
<div class="container">
     <a href="productPage.jsp"><h3>Product List</h3></a>
 </div>
    </body>
</html>
