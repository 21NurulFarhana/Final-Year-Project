<%-- 
    Document   : custUpdating
    Created on : 7 May 2023, 3:47:02 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM - Update Customer</title>
    </head>
    <body>
                <!-- End Header -->
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mlm";%>
<%!String userid = "root";%>
<%!String password = "";%>
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
if(custID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(custID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,userid,password);
String sql="Update customer set custID=?,custName=?,custEmail=?,custPnum=?,street=?,postcode=?,city=?,state=?,agentID=?,sales=? where custID="+custID;
ps = con.prepareStatement(sql);
ps.setString(1,custID);
ps.setString(2, custName);
ps.setString(3, custEmail);
ps.setString(4, custPnum);
ps.setString(5, street);
ps.setString(6, postcode);
ps.setString(7, city);
ps.setString(8, state);
ps.setString(9, agentID);
ps.setString(10, sales);
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

<h2>Customer Information Successfully Updated!</h2>
<div class="container">
     <a href="AgentCustomer.jsp"><h3>Customer List</h3></a>
 </div>
    </body>
</html>
