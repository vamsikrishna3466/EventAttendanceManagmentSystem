<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
String data1[]=request.getParameterValues("date1");
String data2[]=request.getParameterValues("date2");
	
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection co=DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-I81R9FD:1521:xe","system","manager");
	Statement s=co.createStatement();
	ResultSet rs=s.executeQuery("select * from samyak");
	PreparedStatement p=co.prepareStatement("update samyak set date1=?,date2=? where username=?");
	int pq=0;
	while(rs.next())
	{
		p.setString(1,data1[pq]);
		p.setString(2,data2[pq]);
		p.setString(3,rs.getString(1));
		p.executeUpdate();
		pq++;
		}
	PrintWriter pw=response.getWriter();
	pw.println("<h1 style='color:green;'>ATTENDANCE UPDATED </h1>");
	RequestDispatcher rd=request.getRequestDispatcher("Ephomepage.html");
	rd.include(request,response);
	co.close();
	}
catch(Exception a)
{
	System.out.println(a);
}
%>
</body>
</html>