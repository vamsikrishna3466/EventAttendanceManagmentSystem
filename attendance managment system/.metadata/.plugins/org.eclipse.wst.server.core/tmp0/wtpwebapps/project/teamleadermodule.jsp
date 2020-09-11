<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.servlet.*" import="java.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Attendnceform</title>
<style type="text/css">
table
{
background-color:lightblue;
}
div
{
margin-top:200px;
}
</style>
</head>
<body>
<% 

    try
    {
    Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection co=DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-I81R9FD:1521:xe","system","manager");
	Statement s=co.createStatement();
	String ev=(String)request.getAttribute("event");
	ResultSet rs=s.executeQuery("select * from "+ev);
	Statement so=co.createStatement();
	ResultSet rso=so.executeQuery("select * from "+ev+"date");
	%>
	<div>
	<%
	while(rso.next())
	{
		out.print("<center>");
		out.print("<table cellspacing='20'><tr><td>USERNAME</td><td>"+rso.getString(1)+"</td>");
		out.print("<td>"+rso.getString(2)+"</td></tr>");
		out.print("</center>");
	}
	%>
	
	<%
	while(rs.next())
	{
	%>
	<center>
	<form action="attendanceregister.jsp" method="post">
	<tr>
	<td><%=rs.getString("username")%></td>
	<td><input type="text" name="date1" maxlength="12"/></td>
	<td><input type="text" name="date2" maxlength="12"/></td>
	</tr>
<% 	
	}
	%>
	<tr>
	<td colspan="2">
	<center><input type="submit" value="submit"/></center> 
	</td>
	</tr>
	</table>
	</form>
	</center>
	</div>
		<% 
    }
		  catch(Exception a)
 {
  System.out.println(a);
 }
    %>
</body>
</html>