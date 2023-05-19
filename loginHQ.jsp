<%-- 
    Document   : loginHQ
    Created on : 12 May 2023, 11:23:31 pm
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Session In JSP</title>
		<style>
			h1{
				background-color:PINK;
				width:50%;
			}
			h2{
				text-decoration: underline;
			}
			td{
				padding:15px;
				width:50%;
			}
			legend{
				background-color:green;
			}
			fieldset{
				width:30%;
				height:70%;
				text-align:center;
			}
		</style>
	</head>
	<body>
		<h1>Session in JSP</h1>
		<h2>USER LOGIN SESSION</h2>
		<fieldset>
			<legend><font color="white"><b>Login Here:</b> </font></legend>
			<form action="validateHQ.jsp" method="post"> <!-- Here we are taking the values from user and triggering the validate.jsp file -->
			<table>
				<tr><td>USER NAME</td><td><input type="text" name="staffID"></td></tr>
				<tr><td>PASS WORD</td><td><input type="password" name="password"></td></tr>
				<tr><td></td><td><button type="submit">LOGIN</button></td></tr>
			</table>
			</form>
		</fieldset>
	</body>
</html>
