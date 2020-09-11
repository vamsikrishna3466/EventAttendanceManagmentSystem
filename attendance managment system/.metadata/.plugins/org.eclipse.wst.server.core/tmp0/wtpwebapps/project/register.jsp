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
			PreparedStatement ps=co.prepareStatement("insert into "+ev+" values(?,?,?,null,null)");
	ps.setString(1,us);
	ps.setString(2,pa);
	ps.setString(3,ev);
	ps.executeUpdate();
	RequestDispatcher rdd=request.getRequestDispatcher("teammemberlogin.html");
	rdd.forward(request,response);
	co.close();
}
catch(Exception a)
{
	System.out.println(a);
}
%>

</body>
</html>