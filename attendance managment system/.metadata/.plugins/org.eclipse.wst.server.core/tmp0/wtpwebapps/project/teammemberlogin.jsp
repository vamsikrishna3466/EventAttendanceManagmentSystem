<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<title>STUDENT ATTENDANCE</title>
</head>
<body>
<%
String us=request.getParameter("username");
String pa=request.getParameter("pass");
String ev=request.getParameter("event");
int l=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection co=DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-I81R9FD:1521:xe","system","manager");
	Statement soo=co.createStatement();
	ResultSet rsoo=soo.executeQuery("select * from "+ev);
	Statement s=co.createStatement();
	while(rsoo.next())
	{
	if((us.equals(rsoo.getString(1)))&&(pa.equals(rsoo.getString(2)))&&(ev.equalsIgnoreCase(rsoo.getString(3))))
	{
		l=1;
		Statement so=co.createStatement();
		ResultSet rso=so.executeQuery("select * from "+ev+"date");
		while(rso.next())
		{
			out.println("<center><div>");
			out.print("<table><tr><td>"+rso.getString(1)+"</td>");
			out.print("<td>"+rso.getString(2)+"</td></tr>");
		}
		%>
		<tr>
	<td><%=rsoo.getString("date1")%></td>
	<td><%=rsoo.getString("date2")%></td>
	</tr>
	

		</table>
		</div>
		<a href="Ephomepage.html">HOME PAGE</a>
		
		<center>
		<%
			}
	}
	if(l==0)
	{
		RequestDispatcher rd=request.getRequestDispatcher("teammemberlogin.html");
		rd.include(request,response);			
	}
	co.close();
}
catch(Exception a)
{
	System.out.println(a);
}
%>
</body>
</html>