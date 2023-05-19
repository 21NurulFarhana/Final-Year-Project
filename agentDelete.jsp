<%-- 
    Document   : agentDelete
    Created on : 8 May 2023, 4:08:01 am
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MLM - Delete Agent</title>
    </head>
    <body>
        <%
int nana;            
String agentID=request.getParameter("agentID");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mlm", "root", "");


String i="DELETE FROM agentprofile WHERE agentID=?";
PreparedStatement myPS = conn.prepareStatement(i);
myPS.setString(1, agentID);
nana = myPS.executeUpdate();
if (nana >0){
    out.println("<h2>Agent Information Succesfully Deleted!</h2>");
            }
     conn.close();
%>

<div class="container">
     <a href="LeaderAgents.jsp"><h3>Agent List</h3></a>
 </div>
    </body>
</html>
