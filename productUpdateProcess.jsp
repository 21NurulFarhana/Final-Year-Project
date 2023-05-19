<%-- 
    Document   : productUpdateProcess
    Created on : 17 Apr 2023, 7:14:35 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM - Update Product</title>
    </head>
    <body>
                <!-- End Header -->
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mlm";%>
<%!String userid = "root";%>
<%!String password = "";%>
<%
String productID = request.getParameter("productID");
String productName=request.getParameter("productName");
String productCategory=request.getParameter("productCategory");
String productDescription=request.getParameter("productDescription");
String weight=request.getParameter("weight");
String price=request.getParameter("price");
String stock=request.getParameter("stock");
String manufactureDate=request.getParameter("manufactureDate");
String expireDate=request.getParameter("expireDate");
String staffID=request.getParameter("staffID");
if(productID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(productID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,userid,password);
String sql="Update product set productID=?,productName=?,productCategory=?,productDescription=?,weight=?,price=?,stock=?,manufactureDate=?,expiredate=?,staffID=? where productID="+productID;
ps = con.prepareStatement(sql);
ps.setString(1,productID);
ps.setString(2, productName);
ps.setString(3, productCategory);
ps.setString(4, productDescription);
ps.setString(5, weight);
ps.setString(6, price);
ps.setString(7, stock);
ps.setString(8, manufactureDate);
ps.setString(9, expireDate);
ps.setString(10, staffID);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>

<h2>Product Information Succesfully Updated!</h2>
<div class="container">
     <a href="productPage.jsp"><h3>Product List</h3></a>
 </div>
    </body>
</html>

