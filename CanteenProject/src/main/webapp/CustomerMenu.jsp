<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/>
<%
  String user=(String)session.getAttribute("user");
  out.println("Welcome <b>" +user+"</b>");
  
%>
<br/><br/>
<input type="button" name="logout" value="Logout" onclick="window.location='Login.html'"style="margin-left: 50%">
<br/>
<center>
<a href ="CustomerShow.jsp">Customer Show</a>&nbsp;&nbsp;&nbsp;
<a href ="OrdersShow.jsp">Orders Show</a>&nbsp;&nbsp;&nbsp;
<a href ="PendingOrders.jsp">PendingOrders</a>
</center>

</body>
</html>