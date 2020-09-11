<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String us=request.getParameter("username");
String pa=request.getParameter("pass");
String ev=request.getParameter("event");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection co=DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-I81R9FD:1521:xe","system","manager");
	Statement s=co.createStatement();
	ResultSet rs=s.executeQuery("select * from teamleader");
	while(rs.next())
	{

	if((us.equals(rs.getString(1)))&&(pa.equals(rs.getString(2)))&&(ev.equalsIgnoreCase(rs.getString(3))))
	{
		request.setAttribute("event",ev);
		RequestDispatcher rd=request.getRequestDispatcher("teamleadermodule.jsp");
		rd.forward(request,response);			
	
	}
	else
	{
		RequestDispatcher rd=request.getRequestDispatcher("teamleaderlogin.html");
		rd.include(request,response);			
	}
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