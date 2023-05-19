<%-- 
    Document   : custAdding
    Created on : 7 May 2023, 2:10:46 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM : Customer Confirmation</title>
    </head>
    <body>
        <%
String custID=request.getParameter("custID");
String custName=request.getParameter("custName");
String custEmail=request.getParameter("custEmail");
String custPnum=request.getParameter("custPnum");
String street=request.getParameter("street");
String postcode=request.getParameter("postcode");
String city=request.getParameter("city");
String state=request.getParameter("state");
String agentID=request.getParameter("agentID");
String sales=request.getParameter("sales");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into customer(custID,custName,custEmail,custPnum,street,postcode,city,state,agentID,sales)values('"+custID+"','"+custName+"','"+custEmail+"','"+custPnum+"','"+street+"','"+postcode+"','"+city+"','"+state+"','"+agentID+"','"+sales+"')");
        
        }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }
 %>
 
 <h2> Customer Information is successfully inserted!</h2>
 <!-- Button to Payment List Page -->
 <div class="container">
     <a href="AgentCustomer.jsp"><h3>Customer List</h3></a>
 </div>
    </body>
</html>
