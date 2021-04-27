<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.java.mphasis.canteen.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="VendorMenu.jsp"/>
<%
	Connection con = ConnectionHelper.getConnection();
    String cmd = "select * from Vendor";
    PreparedStatement pst = con.prepareStatement(cmd);
    ResultSet rs = pst.executeQuery();
%>
<table border="3">
<tr>
<th>ven_id</th>
<th>vendor name</th>
<th>password</th>
<th>email</th>
<th>Mobileno</th>
<th>Address</th>
<th>Select</th>
</tr>

<%
while(rs.next()){
	%>
<tr>
	<td>
		<%=rs.getInt("VEN_ID") %>
	</td>
	<td>
		<%=rs.getString("VEN_NAME") %>
	</td>
	<td>
		<%=rs.getString("VEN_PASSWORD") %>
	</td>
	<td>
		<%=rs.getString("VEN_EMAIL") %>
	</td>
	<td>
		<%=rs.getString("VEN_MOBILE") %>
	</td>
     <td>
	<%=rs.getString("VEN_ADDRESS") %>
	</td>
	
	<td>
	<a href="Select.jsp">select </a>
	</td>
	</tr>
<%
	}
%>
</body>
</html>