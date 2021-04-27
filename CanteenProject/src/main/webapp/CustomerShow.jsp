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
<jsp:include page="CustomerMenu.jsp"/>
<%
	Connection con = ConnectionHelper.getConnection();
    String cmd = "select * from Customer";
    PreparedStatement pst = con.prepareStatement(cmd);
    ResultSet rs = pst.executeQuery();
%>
<table border="3">
<tr>
<th>cus_id</th>
<th>cus-name</th>
<th>password</th>
<th>email</th>
<th>Mobileno</th>
<th>DOB</th>
<th>Address</th>
<th>Select</th>
</tr>

<%
while(rs.next()){
	%>
<tr>
	<td>
		<%=rs.getInt("CUS_ID") %>
	</td>
	<td>
		<%=rs.getString("CUS_NAME") %>
	</td>
	<td>
		<%=rs.getString("CUS_PASSWORD") %>
	</td>
	<td>
		<%=rs.getString("CUS_EMAIL") %>
	</td>
	<td>
		<%=rs.getString("CUS_MOBILE") %>
	</td>
	<td>
		<%=rs.getDate("CUS_DOB") %>
	</td>
	<td>
	<%=rs.getString("CUS_ADDRESS") %>
	</td>
	
	<td>
	<a href="Select.jsp">select </a>
	</td>
	</tr>
<%
	}
%>

</table>
</body>
</html>