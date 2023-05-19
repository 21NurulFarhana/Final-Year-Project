<%-- 
    Document   : addingProduct
    Created on : 14 Mar 2023, 12:41:14 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM : Product Confirmation</title>
    </head>
    <body>
        <%
String productID=request.getParameter("productID");
String productName=request.getParameter("productName");
String productCategory=request.getParameter("productCategory");
String productDescription=request.getParameter("productDescription");
String weight=request.getParameter("weight");
String price=request.getParameter("price");
String stock=request.getParameter("stock");
String manufactureDate=request.getParameter("manufactureDate");
String expireDate=request.getParameter("expireDate");
String staffID=request.getParameter("staffID");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into product(productID,productName,productCategory,productDescription,weight,price,stock,manufactureDate,expireDate,staffID)values('"+productID+"','"+productName+"','"+productCategory+"','"+productDescription+"','"+weight+"','"+price+"','"+stock+"','"+manufactureDate+"','"+expireDate+"','"+staffID+"')");
        
        }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }
 %>
 
 <h2> Product Information is successfully inserted!</h2>
 <!-- Button to Payment List Page -->
 <div class="container">
     <a href="productPage.jsp"><h3>Product List</h3></a>
 </div>
    </body>
</html>