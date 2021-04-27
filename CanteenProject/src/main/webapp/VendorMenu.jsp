<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  String user=(String)session.getAttribute("user");
  out.println("Welcome <b>" +user+"</b>");
  
%>
<br/><br/>
<input type="button" name="logout" value="Logout" onclick="window.location='Login1.html'"style="margin-left: 50%">
<br/>
<center>
<a href ="ShowVendor.jsp">Show Vendor</a>&nbsp;&nbsp;&nbsp;
<a href ="OrderHistory.jsp">Order History</a>&nbsp;&nbsp;&nbsp;
<a href ="PendingHistory.jsp">PendingHistory</a>
</center>

</body>
</html>