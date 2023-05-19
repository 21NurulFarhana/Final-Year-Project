<%-- 
    Document   : agentAdding
    Created on : 8 May 2023, 2:53:52 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM : Agent Confirmation</title>
    </head>
    <body>
        <%
String agentID=request.getParameter("agentID");
String Password=request.getParameter("Password");
String Name=request.getParameter("Name");
String Email=request.getParameter("Email");
String Pnumber=request.getParameter("Pnumber");
String Street=request.getParameter("Street");
String Postcode=request.getParameter("Postcode");
String City=request.getParameter("City");
String State=request.getParameter("State");
String joinDate=request.getParameter("joinDate");
String role=request.getParameter("role");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into agentprofile(agentID,Password,Name,Email,Pnumber,Street,Postcode,City,State,joinDate,role)values('"+agentID+"','"+Password+"','"+Name+"','"+Email+"','"+Pnumber+"','"+Street+"','"+Postcode+"','"+City+"','"+State+"','"+joinDate+"','"+role+"')");
        
        }
        catch(Exception e)
        {
        out.print(e);
        e.printStackTrace();
        }
 %>
 
 <h2> Agent is successfully registered!</h2>
 <!-- Button to Payment List Page -->
 <div class="container">
     <a href="AgentCustomer.jsp"><h3>Customer List</h3></a>
 </div>
    </body>
</html>